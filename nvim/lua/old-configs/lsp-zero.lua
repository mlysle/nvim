local lsp = require('lsp-zero')

lsp.preset('manual-setup')

lsp.configure('jdtls', {
	--cmd = {'jdtls', '-configuration', '/home/mally/.local/opt/jdtls-launcher/jdtls/config_linux/', '-data', '/home/mally/.cache/jdtls/workspace'},
	--cmd = {'jdtls'},
	cmd = {
		'java',
		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.level=ALL',
		'-noverify',
		'-Xmx1G',
		'-jar', '/home/mally/doc/java/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
		'-configuration', '/home/mally/doc/java/jdtls/config_linux/',
		'-data', '$1',
	},
	capabilities = capabilities

})

lsp.setup_servers({'jdtls'})
lsp.setup_servers({'pylsp'})
lsp.setup()

-- CMP
local cmp = require('cmp')
local cmp_config = lsp.defaults.cmp_config({
  sources = {
    { name = "luasnip" },
    { name = "neorg" },
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
})

cmp.setup(cmp_config)
