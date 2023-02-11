local luasnip = require('luasnip')

luasnip.config.set_config({
	history = true, -- enable jumpback
	updateevents = "TextChanged,TextChangedI",
	region_check_events = 'InsertEnter',
	delete_check_events = 'InsertLeave'
})

require("luasnip.loaders.from_vscode").lazy_load()
