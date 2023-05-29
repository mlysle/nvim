require('neorg').setup {
	load = {
		["core.defaults"] = {},
		["core.keybinds"] = {
			config = {
				hook = function(keybinds)
					keybinds.map_event("norg", "n", "<C-s>", "core.integrations.telescope.find_linkable")
					keybinds.map_event("norg", "i", "<C-l>", "core.integrations.telescope.insert_link")
				end,
			},
		},
		["core.concealer"] = {},
		--		["core.gtd.base"] = {
		--			config = {
		--        workspace = "gtd",
		--		},
		--	},
		["core.integrations.telescope"] = {},
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
