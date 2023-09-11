-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v1.x/doc/md/lsp.md#install-new-language-servers
local lsp = require("lsp-zero")
local config = require("lspconfig")

lsp.preset("recommended")

lsp.ensure_installed({
    "gopls", "lua_ls", "jsonls", "marksman", "yamlls", "zls", "bashls",
    "clangd", "rust_analyzer", "hls", "ocamllsp", "terraform-ls"
})

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({select = true}),
    ["<C-space>"] = cmp.mapping.complete()
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    setup_servers_on_start = true,
    set_lsp_keymaps = true,
    configure_diagnostics = true,
    cmp_capabilities = true,
    manage_nvim_cmp = true,
    call_servers = "local",
    sign_icons = {error = " ✘", warn = " ▲", hint = " ⚑", info = "!"}
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<leader>h", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>ws",
                   function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end,
                   opts)
    -- navigate between diagnostic messages
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end,
                   opts)
    vim.keymap.set("n", "<leader>rf", function() vim.lsp.buf.references() end,
                   opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>s",
                   function() vim.lsp.buf.signature_help() end, opts)
end)

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = true,
    float = true,
    underline = true
})

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd
config.clangd.setup {}
config.gopls.setup {}
config.yamlls.setup {filetypes = {"yaml", "yml"}}
config.marksman.setup {filetypes = {"markdown"}}
config.lua_ls.setup(lsp.nvim_lua_ls())
config.zls.setup({})
config.hls.setup({filetypes = {'haskell', 'lhaskell', 'cabal'}})
config.terraformls.setup({})
-- npm i -g vscode-langservers-extracted
config.eslint.setup({
    --- ...
    on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre",
                                    {buffer = bufnr, command = "EslintFixAll"})
    end
})
-- npm install -g typescript typescript-language-server
config.tsserver.setup {}

lsp.setup()
