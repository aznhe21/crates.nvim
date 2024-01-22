---@class Config
---@field smart_insert boolean
---@field insert_closing_quote boolean
---@field autoload boolean
---@field autoupdate boolean
---@field autoupdate_throttle integer
---@field loading_indicator boolean
---@field date_format string
---@field thousands_separator string
---@field notification_title string
---@field curl_args string[]
---@field max_parallel_requests integer
---@field open_programs string[]
---@field expand_crate_moves_cursor boolean
---@field disable_invalid_feature_diagnostic boolean
---@field enable_update_available_warning boolean
---@field on_attach fun(bufnr: integer)
---@field text TextConfig
---@field highlight HighlightConfig
---@field diagnostic DiagnosticConfig
---@field popup PopupConfig
---@field src SrcConfig
---@field null_ls NullLsConfig
---@field lsp LspConfig

---@class TextConfig
---@field loading string
---@field version string
---@field prerelease string
---@field yanked string
---@field nomatch string
---@field upgrade string
---@field error string

---@class HighlightConfig
---@field loading string
---@field version string
---@field prerelease string
---@field yanked string
---@field nomatch string
---@field upgrade string
---@field error string

---@class DiagnosticConfig
---@field section_invalid string
---@field workspace_section_not_default string
---@field workspace_section_has_target string
---@field section_dup string
---@field section_dup_orig string
---@field crate_dup string
---@field crate_dup_orig string
---@field crate_novers string
---@field crate_error_fetching string
---@field crate_name_case string
---@field vers_upgrade string
---@field vers_pre string
---@field vers_yanked string
---@field vers_nomatch string
---@field def_invalid string
---@field feat_dup string
---@field feat_dup_orig string
---@field feat_invalid string

---@class PopupConfig
---@field autofocus boolean
---@field hide_on_select boolean
---@field copy_register string
---@field style string
---@field border string|string[]
---@field show_version_date boolean
---@field show_dependency_version boolean
---@field max_height integer
---@field min_width integer
---@field padding integer
---@field text PopupTextConfig
---@field highlight PopupHighlightConfig
---@field keys PopupKeyConfig

---@class PopupTextConfig
---@field title string
---@field pill_left string
---@field pill_right string
---@field description string
---@field created_label string
---@field created string
---@field updated_label string
---@field updated string
---@field downloads_label string
---@field downloads string
---@field homepage_label string
---@field homepage string
---@field repository_label string
---@field repository string
---@field documentation_label string
---@field documentation string
---@field crates_io_label string
---@field crates_io string
---@field categories_label string
---@field keywords_label string
---@field version string
---@field prerelease string
---@field yanked string
---@field version_date string
---@field feature string
---@field enabled string
---@field transitive string
---@field normal_dependencies_title string
---@field build_dependencies_title string
---@field dev_dependencies_title string
---@field dependency string
---@field optional string
---@field dependency_version string
---@field loading string

---@class PopupHighlightConfig
---@field title string
---@field pill_text string
---@field pill_border string
---@field description string
---@field created_label string
---@field created string
---@field updated_label string
---@field updated string
---@field downloads_label string
---@field downloads string
---@field homepage_label string
---@field homepage string
---@field repository_label string
---@field repository string
---@field documentation_label string
---@field documentation string
---@field crates_io_label string
---@field crates_io string
---@field categories_label string
---@field keywords_label string
---@field version string
---@field prerelease string
---@field yanked string
---@field version_date string
---@field feature string
---@field enabled string
---@field transitive string
---@field normal_dependencies_title string
---@field build_dependencies_title string
---@field dev_dependencies_title string
---@field dependency string
---@field optional string
---@field dependency_version string
---@field loading string

---@class PopupKeyConfig
---@field hide string[]
---@field open_url string[]
---@field select string[]
---@field select_alt string[]
---@field toggle_feature string[]
---@field copy_value string[]
---@field goto_item string[]
---@field jump_forward string[]
---@field jump_back string[]

---@class SrcConfig
---@field insert_closing_quote boolean
---@field text SrcTextConfig
---@field cmp CmpConfig
---@field coq CoqConfig

---@class SrcTextConfig
---@field prerelease string
---@field yanked string

---@class CmpConfig
---@field enabled boolean
---@field use_custom_kind boolean
---@field kind_text CmpKindTextConfig
---@field kind_highlight CmpKindHighlightConfig

---@class CmpKindTextConfig
---@field version string
---@field feature string

---@class CmpKindHighlightConfig
---@field version string
---@field feature string

---@class CoqConfig
---@field enabled boolean
---@field name string

---@class NullLsConfig
---@field enabled boolean
---@field name string

---@class LspConfig
---@field enabled boolean
---@field name string
---@field on_attach fun(client: lsp.Client, bufnr: integer)
---@field actions boolean
---@field completion boolean


---@class crates.UserConfig
---@field public smart_insert? boolean
---@field public insert_closing_quote? boolean
---@field public autoload? boolean
---@field public autoupdate? boolean
---@field public autoupdate_throttle? integer
---@field public loading_indicator? boolean
---@field public date_format? string
---@field public thousands_separator? string
---@field public notification_title? string
---@field public curl_args? string[]
---@field public max_parallel_requests? integer
---@field public open_programs? string[]
---@field public expand_crate_moves_cursor? boolean
---@field public disable_invalid_feature_diagnostic? boolean
---@field public enable_update_available_warning? boolean
---@field public on_attach? fun(bufnr: integer)
---@field public text? crates.UserTextConfig
---@field public highlight? crates.UserHighlightConfig
---@field public popup? crates.UserPopupConfig
---@field public src? crates.UserSrcConfig
---@field public null_ls? crates.UserNullLsConfig
---@field public lsp? crates.UserLspConfig

---@class crates.UserTextConfig
---@field public loading? string
---@field public version? string
---@field public prerelease? string
---@field public yanked? string
---@field public nomatch? string
---@field public upgrade? string
---@field public error? string

---@class crates.UserHighlightConfig
---@field public loading? string
---@field public version? string
---@field public prerelease? string
---@field public yanked? string
---@field public nomatch? string
---@field public upgrade? string
---@field public error? string

---@class crates.UserPopupConfig
---@field public autofocus? boolean
---@field public hide_on_select? boolean
---@field public copy_register? string
---@field public style? string
---@field public border? string|string[]
---@field public show_version_date? boolean
---@field public show_dependency_version? boolean
---@field public max_height? integer
---@field public min_width? integer
---@field public padding? integer
---@field public text? crates.UserPopupTextConfig
---@field public highlight? crates.UserPopupHighlightConfig
---@field public keys? crates.UserPopupKeyConfig

---@class crates.UserPopupTextConfig
---@field public title? string
---@field public pill_left? string
---@field public pill_right? string
---@field public description? string
---@field public created_label? string
---@field public created? string
---@field public updated_label? string
---@field public updated? string
---@field public downloads_label? string
---@field public downloads? string
---@field public homepage_label? string
---@field public homepage? string
---@field public repository_label? string
---@field public repository? string
---@field public documentation_label? string
---@field public documentation? string
---@field public crates_io_label? string
---@field public crates_io? string
---@field public categories_label? string
---@field public keywords_label? string
---@field public version? string
---@field public prerelease? string
---@field public yanked? string
---@field public version_date? string
---@field public feature? string
---@field public enabled? string
---@field public transitive? string
---@field public normal_dependencies_title? string
---@field public build_dependencies_title? string
---@field public dev_dependencies_title? string
---@field public dependency? string
---@field public optional? string
---@field public dependency_version? string
---@field public loading? string

---@class crates.UserPopupHighlightConfig
---@field public title? string
---@field public pill_text? string
---@field public pill_border? string
---@field public description? string
---@field public created_label? string
---@field public created? string
---@field public updated_label? string
---@field public updated? string
---@field public downloads_label? string
---@field public downloads? string
---@field public homepage_label? string
---@field public homepage? string
---@field public repository_label? string
---@field public repository? string
---@field public documentation_label? string
---@field public documentation? string
---@field public crates_io_label? string
---@field public crates_io? string
---@field public categories_label? string
---@field public keywords_label? string
---@field public version? string
---@field public prerelease? string
---@field public yanked? string
---@field public version_date? string
---@field public feature? string
---@field public enabled? string
---@field public transitive? string
---@field public normal_dependencies_title? string
---@field public build_dependencies_title? string
---@field public dev_dependencies_title? string
---@field public dependency? string
---@field public optional? string
---@field public dependency_version? string
---@field public loading? string

---@class crates.UserPopupKeyConfig
---@field public hide? string[]
---@field public open_url? string[]
---@field public select? string[]
---@field public select_alt? string[]
---@field public toggle_feature? string[]
---@field public copy_value? string[]
---@field public goto_item? string[]
---@field public jump_forward? string[]
---@field public jump_back? string[]

---@class crates.UserSrcConfig
---@field public insert_closing_quote? boolean
---@field public text? crates.UserSrcTextConfig
---@field public cmp? crates.UserCmpConfig
---@field public coq? crates.UserCoqConfig

---@class crates.UserSrcTextConfig
---@field public prerelease? string
---@field public yanked? string

---@class crates.UserCmpConfig
---@field public enabled? boolean
---@field public use_custom_kind? boolean
---@field public kind_text? crates.UserCmpKindTextConfig
---@field public kind_highlight? crates.UserCmpKindHighlightConfig

---@class crates.UserCmpKindTextConfig
---@field public version? string
---@field public feature? string

---@class crates.UserCmpKindHighlightConfig
---@field public version? string
---@field public feature? string

---@class crates.UserCoqConfig
---@field public enabled? boolean
---@field public name? string

---@class crates.UserNullLsConfig
---@field public enabled? boolean
---@field public name? string

---@class crates.UserLspConfig
---@field public enabled? boolean
---@field public name? string
---@field public on_attach? fun(client: lsp.Client, bufnr: integer)
---@field public actions? boolean
---@field public completion? boolean
