-- Run `:Lazy log` to troubleshoot.
-- TODO:
--  * https://github.com/mfussenegger/nvim-dap
--  * https://github.com/rcarriga/nvim-dap-ui
--  * https://github.com/theHamsta/nvim-dap-virtual-text
require("lazy").setup({
    "ryanoasis/vim-devicons",
    "lewis6991/impatient.nvim",
    "folke/which-key.nvim",
    "folke/neodev.nvim",
    "ThePrimeagen/harpoon",
    "numToStr/Comment.nvim",
    "mhartington/formatter.nvim",
    "lewis6991/gitsigns.nvim",
    "dnlhc/glance.nvim",
    "towolf/vim-helm",
    "mbbill/undotree",
    "arcticicestudio/nord-vim",
    {
        "nvim-lualine/lualine.nvim",
        requires = {"nvim-tree/nvim-web-devicons", opt = true}
    },
    {"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim"
        }
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim"
        }
    },
    {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
    {"nvim-treesitter/nvim-treesitter"},
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            -- LSP Support
            {"neovim/nvim-lspconfig"}, -- Required

            -- Autocompletion
            {"hrsh7th/nvim-cmp"}, -- Required
            {"hrsh7th/cmp-nvim-lsp"}, -- Required
            {"L3MON4D3/LuaSnip"} -- Required
        }
    },
    "machakann/vim-highlightedyank",
    "ray-x/lsp_signature.nvim",
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim"
        }
    }
})
