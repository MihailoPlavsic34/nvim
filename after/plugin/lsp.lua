local lsp_zero = require('lsp-zero')

lsp_zero.setup_servers({ 'pylsp', 'rust_analyzer', 'yamlls', 'dockerls', 'lua_ls', 'bashls', 'gopls', 'html', 'ts_ls',
	'perlpls', 'jsonls' })

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { 'pylsp', 'rust_analyzer', 'yamlls', 'dockerls', 'lua_ls', 'bashls', 'terraformls', 'gopls', 'html', 'htmx', 'ts_ls', 'jsonls' },
	handlers = {
		lsp_zero.default_setup,
	},
})

require 'lspconfig'.perlpls.setup {
	filetypes = {"perl", "t", "rules"},
	-- settings = {
	-- 	perl = {
	-- 		perlcritic = {
	-- 			perlcritic = "~/.perlcritic"
	-- 		}
	-- 	}
	-- }
}

require("lspconfig").htmx.setup {}

require("lspconfig").terraformls.setup({
	init_options = {
		experimentalFeatures = {
			prefillRequiredFields = true,
		},
	}
})

require("lspconfig").pylsp.setup {
	settings = {
		pylsp = {
			plugins = {
				flake8 = {
					enabled = true,
					extendIgnore = { 'E501' }
				},
				pycodestyle = {
					enabled = false
				},
				autopep8 = {
					enabled = true
				}
			}
		}
	}
}

require('lspconfig').yamlls.setup {
	settings = {
		yaml = {
			schemaStore = {
				enable = true
			},
			schemas = {
				["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
				["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
				["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
				["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
				["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
				["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
				["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
				["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
				["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
				["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
				["https://raw.githubusercontent.com/josa42/jsonschema-bitbucket-pipelines/master/schema/bitbucket-pipeline.schema.json"] = "*bitbucket*.{yml,yaml}",
				kubernetes = "*.yaml",
			},
		},
	}
}

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp_zero.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

lsp_zero.setup()

vim.diagnostic.config({
	virtual_text = true
})
