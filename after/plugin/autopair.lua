local npairs = require("nvim-autopairs")
local Rule = require('nvim-autopairs.rule')
local ts_conds = require('nvim-autopairs.ts-conds')
local _setup = {
	disable_filetype = { "TelescopePrompt", "spectre_panel" },
	disable_in_macro = true,
	disable_in_visualblock = false ,-- disable when insert after visual block mode
	disable_in_replace_mode = true,
	ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
	enable_moveright = true,
	enable_afterquote = true,
	enable_bracket_in_quote = true,
	enable_abbr = false,
	break_undo = true,
	map_cr = true,
	map_bs = true,
	map_c_h = false,
	map_c_w = false,
	enable_check_bracket_line = false,
    check_ts = true,
    ts_config = {
        lua = {'string'},-- it will not add a pair on that treesitter node
        javascript = {'template_string'},
        java = false,-- don't check treesitter on java
    },
}

npairs.setup(_setup)
npairs.get_rules("'")[1].not_filetypes = { "scheme", "lisp" }
npairs.add_rules({
  Rule("%", "%", "lua")
    :with_pair(ts_conds.is_ts_node({'string','comment'})),
  Rule("$", "$", "lua")
    :with_pair(ts_conds.is_not_ts_node({'function'}))
})
