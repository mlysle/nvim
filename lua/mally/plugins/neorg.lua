return {
	'nvim-neorg/neorg',
	dependencies = { "luarocks.nvim" },
	config = function()
		local neorg = require("neorg")
		neorg.setup {
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {},
				["core.esupports.metagen"] = {
					config = {
						author = 'Maxwell Lysle',
						type = 'auto',
					}
				},
				["core.keybinds"] = {
					config = {
						hook = function(keybinds)
							--keybinds.map_event("norg", "n", "<C-s>", "core.integrations.telescope.find_linkable")
							--keybinds.map_event("norg", "i", "<C-l>", "core.integrations.telescope.insert_link")
							keybinds.remap_key("norg", "i", "<M-CR>", "<S-CR>")
							keybinds.remap_key("norg", "n", "<Tab>", "core.integrations.treesitter.next.heading")
							keybinds.remap_key("norg", "n", "<S-Tab>", "core.integrations.treesitter.previous.heading")
						end,
					},
				},
				["core.completion"] = {
					config = {
						engine = 'nvim-cmp',
					}
				},
				["core.journal"] = {
					config = {
						workspace = 'notes',
						strategy = 'flat',
					}
				},
				-- ["core.presenter"] = {},
				-- ["core.integrations.telescope"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/doc/neorg/notes",
							gtd = "~/doc/neorg/gtd",
						},
						default_workspace = "notes",
					}
				}
			}
		}
	end,
}
