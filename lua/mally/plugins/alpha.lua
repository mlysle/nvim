return {
	'goolord/alpha-nvim',
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
			[[+200% LAZY                     __                ]],
			[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
			[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
			[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
			[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
			[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
		}
		dashboard.section.buttons.val = {
			dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("v", "  Settings", ":e $MYVIMRC| :cd %:p:h<CR>"),
			dashboard.button("n", "󰠮  Start NEORG", ":NeorgStart<CR>:Neorg journal today<CR>"),
			dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
		}
		--local handle = io.popen('fortune')
		--local fortune = handle:read("*a")
		--handle:close()
		--dashboard.section.footer.val = fortune

		dashboard.config.opts.noautocmd = true

		vim.cmd [[autocmd User AlphaReady echo 'ready']]

		alpha.setup(dashboard.config)
	end,
}