local cmp = require("cmp")

cmp.setup({
	min_length = 8,
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	experimental = {
		native_menu = false,
		ghost_text = true,
	},
	completion = { completeopt = "menu,menuone,noinsert" },
})

