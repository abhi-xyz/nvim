return {
    'neovim/nvim-lspconfig',
    config = function()
        local lspconfig = require('lspconfig')

        -- Configure Rust language server
        lspconfig.rust_analyzer.setup {
            on_attach = function(client, bufnr)
                -- Enable completion triggered by <c-x><c-o>
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
                -- Mappings.
                local opts = { noremap = true, silent = true }
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
                    opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
                    opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl',
                    '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>e',
                    '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
                vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
            end,
            settings = {
                ["rust-analyzer"] = {}
            }
        }

        lspconfig.pyright.setup({
            on_attach = function(client, bufnr)
                local opts = { noremap = true, silent = true }
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
                -- Add more key mappings as needed
            end,
            settings = {
                -- Add any server-specific settings here
            },
            flags = {
                debounce_text_changes = 150,
            },
        })

        lspconfig.lua_ls.setup({
            on_attach = function(client, bufnr)
                local opts = { noremap = true, silent = true }
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
                -- Add more key mappings as needed
            end,
            settings = {
                -- Add any server-specific settings here
            },
            flags = {
                debounce_text_changes = 150,
            },
        })




        lspconfig.nil_ls.setup({
            on_attach = function(client, bufnr)
                local opts = { noremap = true, silent = true }
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
                -- Add more key mappings as needed
            end,
            settings = {
                -- Add any server-specific settings here
            },
            flags = {
                debounce_text_changes = 150,
            },
        })


        lspconfig.ltex.setup({
            on_attach = function(client, bufnr)
                local opts = { noremap = true, silent = true }
                -- Key mappings for LSP functionality
            end,
            settings = {
                ltex = {
                    language = "en",                                       -- Default language for linting
                    diagnosticSeverity = "hint",                           -- Adjust severity level if needed
                    additionalRules = {
                        enablePickyRules = true,                           -- Example of enabling picky rules
                    },
                    filetypes = { "markdown", "tex", "plaintex", "org", }, -- Specify file types
                }
            },
            flags = {
                debounce_text_changes = 150,
            },
        }) -- --local words = {}
        --
        -- for word in io.open(/lua/abhi/core/spell/en.utf-8.add, "r"):lines() do
        --     table.insert(words, word)
        -- end,
        --
    end
}
