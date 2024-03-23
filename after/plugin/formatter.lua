require("formatter").setup({
    -- Enable or disable logging
    logging = true,
    -- Set the log level
    log_level = vim.log.levels.WARN,
    -- All formatter configurations are opt-in
    filetype = {
        go = {require("formatter.filetypes.go").gofumpt},
        zig = {require("formatter.filetypes.zig").zigfmt},
        json = {require("formatter.filetypes.json").jq},
        markdown = {require("formatter.filetypes.markdown").prettier},
        -- typescript = {require("formatter.filetypes.typescript").prettier},
        yaml = {
            require("formatter.filetypes.yaml").yamlfmt, function()
                return {
                    exe = "yamlfmt",
                    args = {"-conf", "~/.config/.yamlfmt", "-in"},
                    stdin = true
                }
            end

        },
        sh = {require("formatter.filetypes.sh").shfmt},
        lua = {require("formatter.filetypes.lua").luaformat},
        haskell = {function() return {exe = "hindent"} end},
        terraform = {require("formatter.filetypes.terraform").terraformfmt},
        rust = {require("formatter.filetypes.rust").rustfmt},
        python = {require("formatter.filetypes.python").black},
        ocaml = {
            require("formatter.filetypes.ocaml").ocamlformat, function()
                local util = require "formatter.util"
                return {
                    exe = "ocamlformat",
                    args = {
                        "--enable-outside-detected-project",
                        util.escape_path(util.get_current_buffer_file_path())
                    },
                    stdin = true
                }
            end
        },

        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ["*"] = {require("formatter.filetypes.any").remove_trailing_whitespace}
    }
})
