local function bootstrap(url, ref)
	local name = url:gsub(".*/", "")
	local path = vim.fn.stdpath("data") .. "/lazy/" .. name

	if vim.fn.isdirectory(path) == 0 then
		print(name .. ": installing to " .. vim.fn.stdpath("data") .. "/lazy/" .. "...")

		vim.fn.system {"git", "clone", url, path}
		if ref then
			vim.fn.system {"git", "-C", path, "checkout", ref}
		end

		vim.cmd "redraw"
		print(name .. ": finished installing")
	end
	vim.opt.runtimepath:prepend(path)
end

-- bootstrap tangerine/hibiscus
bootstrap("https://github.com/udayvir-singh/tangerine.nvim", "v2.4")
bootstrap("https://github.com/udayvir-singh/hibiscus.nvim")
require "tangerine".setup {}

