require("formatter").setup({
    -- Enable or disable logging
    logging = true,
    -- Set the log level
    log_level = vim.log.levels.WARN,
    -- All formatter configurations are opt-in
    filetype = {
        go = {require("formatter.filetypes.go").gofumpt},
        zig = {require("formatter.filetypes.zig").zigfmt},
        haskell = {require("formatter.filetypes.haskell").stylish_haskell},
        json = {require("formatter.filetypes.json").jq},
        markdown = {require("formatter.filetypes.markdown").prettier},
        yaml = {require("formatter.filetypes.yaml").yamlfmt},
        sh = {require("formatter.filetypes.sh").shfmt},
        lua = {require("formatter.filetypes.lua").luaformat},

        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ["*"] = {require("formatter.filetypes.any").remove_trailing_whitespace}
    }
})
