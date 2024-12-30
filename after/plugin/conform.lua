local conform = require("conform")
local config = {
	formatters = {
        odinfmt = {
            command = "odinfmt",
            args = {
                "-stdin"
            }
        },
		tidy = {
			command = "tidy",
			args = {
				"-q",
				"-w",
				"70",
				"-i",
				"--indent-attributes",
				"yes",
				"--show-warnings",
				"no",
				"--drop-empty-elements",
				"no",
			},
		},
		tidy_xml = {
			command = "tidy",
			args = {
				"-q",
				"-xml",
				"-w",
				"70",
				"-i",
				"--indent-attributes",
				"yes",
				"--show-warnings",
				"no",
				"--drop-empty-elements",
				"no",
			},
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
		go = { "gofmt" },
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
		odin = { "odinfmt" },
		css = { "css_beautify" },
	},
}

vim.keymap.set("n", "<space>f", function()
	conform.format()
end, opts)

conform.setup(config)
