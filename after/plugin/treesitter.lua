require'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "rust", "c", "cpp", "python", "java", "haskell", "cmake", "c_sharp",
	"javascript", "html", "css", "json", "go", "zig", "bash",
	"lua", "vim", "vimdoc", "query", "yaml", "markdown"},

	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
