local nm = require("neo-minimap")
nm.setup_defaults({
	height_toggle = { 12, 36 },
	--hl_group = "DiagnosticWarn",
})
nm.source_on_save("/home/ziontee113/.config/nvim/lua/plugins/neo-minimap/")

-- Markdown
nm.set("zi", { "*.rmd", "*.md" }, {
	events = { "BufEnter" },
	query = {
		[[
		;; query
    ((atex_heading) @cap)
		]],
		1,
	},
	height_toggle = { 20, 25 },
})
