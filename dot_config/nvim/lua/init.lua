require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "rust_analyzer", "clangd", "elixirls", "gopls" },
}

local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require("lspconfig").rust_analyzer.setup {}
require("lspconfig").clangd.setup {}
require("lspconfig").elixirls.setup {}
require("lspconfig").gopls.setup {
	on_attach = function(client)
		vim.cmd [[set noexpandtab]]
        lsp_zero.buffer_autoformat()
	end,
	settings = {
		gopls = {
			gofumpt = true
		}
	}
}

local cmp = require('cmp')

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<C-k>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item({behavior = 'insert'})
      else
        cmp.complete()
      end
    end),
    ['<C-j>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item({behavior = 'insert'})
      else
        cmp.complete()
      end
    end),
  })
})

require("autoclose").setup({
    options = {
        disable_command_mode = true
    }
})

vim.cmd [[colorscheme apprentice]]
