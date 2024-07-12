local conform = require("conform")
local config = {
	formatters = {
		tidy = {
			command = "tidy",
			args = { "-q", "-w", "50", "-i", "--indent-attributes", "yes" },
		},
		tidy_xml = {
			command = "tidy",
			args = { "-q", "-xml", "-w", "40", "-i", "--indent-attributes", "yes" },
		},
		deno_fmt = {
			env = {
				NO_COLOR = "1",
			},
		},
		css_beautify = {
			command = "css-beautify",
		},
	},
	formatters_by_ft = {
		lua = { "stylua" },
		c = { "astyle" },
		cpp = { "astyle" },
		java = { "astyle" },
		javascript = { "deno_fmt" },
		typescript = { "deno_fmt" },
		csharp = { "astyle" },
		html = { "tidy" },
		xml = { "tidy_xml" },
		json = { "jq" },
		css = { "css_beautify" },
	},
}

vim.keymap.set("n", "<space>f", function()
	conform.format()
end, opts)

conform.setup(config)
