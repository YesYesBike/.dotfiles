-- Setup language servers.ls
--local lspconfig = require('lspconfig')
--local capabilities = require('cmp_nvim_lsp').default_capabilities()

--lspconfig.clangd.setup {
--    capabilities = capabilities,
--}
--lspconfig.lua_ls.setup {
--    settings = {
--        Lua = {
--            runtime = {
--                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--                version = "LuaJIT",
--            },
--            workspace = {
--                -- Make the server aware of Neovim runtime files
--                checkThirdParty = false,
--                library = {
--                    -- '${3rd}/luv/library',
--                    vim.env.VIMRUNTIME,
--                },
--                -- library = unpack(vim.api.nvim_get_runtime_file("", true)),
--
--            },
--            -- Do not send telemetry data containing a randomized but unique identifier
--            completion = {
--                callSnippet = 'Replace',
--            },
--            capabilities = capabilities,
--        },
--    },
--}
--lspconfig.r_language_server.setup {
--    capabilities = capabilities,
--}
--lspconfig.phpactor.setup{
--    capabilities = capabilities,
--}

--vim.api.nvim_create_autocmd('LspAttach', {
--    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--    callback = function(ev)
--        -- Enable completion triggered by <c-x><c-o>
--        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
--
--        -- Buffer local mappings.
--        -- See `:help vim.lsp.*` for documentation on any of the below functions
--        local opts = { buffer = ev.buf }
--        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
--        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist) --diagnostic quickfix list
--        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
--        vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
--        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--        vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, opts)
--        vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, opts)
--        --vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, opts)
--        vim.keymap.set('n', 'H', vim.lsp.buf.hover, opts)
--        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--        vim.keymap.set('n', '<leader>D', require('telescope.builtin').lsp_type_definitions, opts)
--        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
--        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
--        vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
--        vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations, opts)
--
--
--        local client = vim.lsp.get_client_by_id(ev.data.client_id)
--        if client and client.server_capabilities.documentHighlightProvider then
--            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
--                buffer = ev.buf,
--                callback = vim.lsp.buf.document_highlight,
--            })
--
--            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
--                buffer = ev.buf,
--                callback = vim.lsp.buf.clear_references,
--            })
--        end
--    end
--})


-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-s>'] = cmp.mapping.complete(),  --I use C-Space as tmux leader key but it need to fixed because of my pinky
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'luasnip' }, -- For luasnip users.
        { name = 'nvim_lsp', max_item_count = 6},
        --{ name = 'cmp_nvim_r' },
        { name = 'path' },
        { name = 'buffer', max_item_count = 6} ,
        }),
    experimental = {
        ghost_text = true
    },
})

  --cmp_nvim_r
--require("cmp_nvim_r").setup({
--    filetypes = {"r", "rmd", "quarto"},
--})
--
---- Set configuration for specific filetype.
--cmp.setup.filetype('gitcommit', {
--    sources = cmp.config.sources({
--        { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
--    }, {
--            { name = 'buffer' },
--        })
--})
--
---- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline({ '/', '?' }, {
--    mapping = cmp.mapping.preset.cmdline(),
--    sources = {
--        { name = 'buffer' }
--    }
--})
--
---- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline(':', {
--    mapping = cmp.mapping.preset.cmdline(),
--    sources = cmp.config.sources({
--        { name = 'path' }
--    }, {
--            { name = 'cmdline' }
--        })
--})
