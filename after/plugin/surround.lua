local surround = require("nvim-surround")
surround.setup({
    keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "gs",
        normal_cur = "gss",
        normal_line = "gS",
        normal_cur_line = "gSS",
        visual = "S",
        visual_line = "gS",
        delete = "ds",
        change = "cs",
    },
})
