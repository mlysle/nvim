local function bootstrap(user, repo)
	local url = ("https://github.com/" .. user .. "/" .. repo)
	local name = url:gsub(".*/", "")
	local path = vim.fn.stdpath("data") .. "/lazy/" .. name

	if vim.fn.isdirectory(path) == 0 then
		print(name .. ": installing to " .. vim.fn.stdpath("data") .. "/lazy/" .. "...")

		vim.fn.system {"git", "clone", url, path}

		vim.cmd "redraw"
		print(name .. ": finished installing")
	end
	vim.opt.runtimepath:prepend(path)
end

-- bootstrap lazy
bootstrap("folke", "lazy.nvim")

-- bootstrap tangerine
bootstrap("udayvir-singh", "tangerine.nvim")

require "tangerine".setup({
	compiler = {
		hooks = {"onsave", "oninit"}
	}
})

-- I'm not sure but I think this will start init.fnl
require("init")
