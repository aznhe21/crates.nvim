local actions = require("crates.actions")
local util = require("crates.util")
local state = require("crates.state")
local src = require("crates.src.common")

local M = {}

---@class ServerOpts
---@field capabilities table
---@field handlers table<string,fun(method: string, params: any, callback: function)>
---@field on_request fun(method: string, params: any)|nil
---@field on_notify fun(method: string, params: any)|nil

---@class CodeAction
---@field title string
---@field kind string
---@field action function

---@class Command
---@field title string
---@field command string
---@field arguments function[]

---@param opts ServerOpts
---@return function
function M.server(opts)
    opts = opts or {}
    local capabilities = opts.capabilities or {}
    local on_request = opts.on_request or function(_, _) end
    local on_notify = opts.on_notify or function(_, _) end
    local handlers = opts.handlers or {}

    return function(dispatchers)
        local closing = false
        local srv = {}
        local request_id = 0

        ---@param method string
        ---@param params any
        ---@param callback fun(method: string|nil, params: any)
        ---@return boolean
        ---@return integer
        function srv.request(method, params, callback)
            pcall(on_request, method, params)
            local handler = handlers[method]
            if handler then
                handler(method, params, callback)
            elseif method == "initialize" then
                callback(nil, {
                    capabilities = capabilities,
                })
            elseif method == "shutdown" then
                callback(nil, nil)
            end
            request_id = request_id + 1
            return true, request_id
        end

        ---@param method string
        ---@param params any
        function srv.notify(method, params)
            pcall(on_notify, method, params)
            if method == "exit" then
                dispatchers.on_exit(0, 15)
            end
        end

        ---@return boolean
        function srv.is_closing()
            return closing
        end

        function srv.terminate()
            closing = true
        end

        return srv
    end
end

function M.start_server()
    local CRATES_COMMAND = "crates_command"

    local commands = {
        ---@param cmd Command
        ---@param ctx table<string,any>
        [CRATES_COMMAND] = function(cmd, ctx)
            local action = cmd.arguments[1]
            if action then
                vim.api.nvim_buf_call(ctx.bufnr, action)
            else
                util.notify(vim.log.levels.INFO, "Action not available")
            end
        end
    }

    local server = M.server({
        capabilities = {
            codeActionProvider = state.cfg.lsp.actions,
            completionProvider = state.cfg.lsp.completion and {
                triggerCharacters = src.trigger_characters,
            },
        },
        handlers = {
            ---@param _method string
            ---@param _params any
            ---@param callback fun(err: nil, actions: CodeAction[])
            ["textDocument/codeAction"] = function(_method, _params, callback)
                local code_actions = {}
                for _, action in ipairs(actions.get_actions()) do
                    local title = util.format_title(action.name)
                    table.insert(code_actions, {
                        title = title,
                        kind = "refactor.rewrite",
                        command = {
                            title = title,
                            command = CRATES_COMMAND,
                            arguments = { action.action },
                        },
                    })
                end
                callback(nil, code_actions)
            end,
            ---@param _method string
            ---@param _params any
            ---@param callback fun(err: nil, items: CompletionList|nil)
            ["textDocument/completion"] = function(_method, _params, callback)
                src.complete(function(items)
                    callback(nil, items)
                end)
            end,
        },
    })
    ---@type integer
    local client_id = vim.lsp.start({
        name = state.cfg.lsp.name,
        cmd = server,
        commands = commands,
    })
    if not client_id then
        return
    end

    ---@type lsp.Client
    local client = vim.lsp.get_client_by_id(client_id)
    if not client then
        return
    end

    local buf = util.current_buf()
    state.cfg.lsp.on_attach(client, buf)
end

return M
