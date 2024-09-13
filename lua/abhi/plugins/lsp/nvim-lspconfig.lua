return {
    'neovim/nvim-lspconfig',
    init_options = {
        userLanguages = {
            rust = "html",
        },
    },
    config = function()
        local lspconfig = require('lspconfig')

        -- Configure Rust language server
        lspconfig.rust_analyzer.setup {
            on_attach = function(client, bufnr)
                -- Enable completion triggered by <c-x><c-o>
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
                -- Mappings.
                local opts = { noremap = true, silent = true }
            end,
            settings = {
                ["rust-analyzer"] = {
                    assist = {
                        importMergeBehavior = "last",
                        importPrefix = "by_self",
                    },
                    cargo = {
                        allFeatures = true,
                    },
                    checkOnSave = {
                        command = "clippy", -- Use Clippy to catch more issues
                    },
                    procMacro = {
                        enable = true, -- Enable macro expansion
                    },
                },
            } }

        lspconfig.pyright.setup({
            on_attach = function(client, bufnr)
                local opts = { noremap = true, silent = true }
                -- Add more key mappings as needed
            end,
            settings = {
                -- Add any server-specific settings here
            },
            flags = {
                debounce_text_changes = 150,
            },
        })


        lspconfig.gopls.setup({
            on_attach = function(client, bufnr)
                local opts = { noremap = true, silent = true }
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
                -- Add more key mappings as needed
            end,
            settings = {
                -- Add any server-specific settings here
            },
            flags = {
                debounce_text_changes = 150,
            },
        })




        lspconfig.nixd.setup({
            on_attach = function(client, bufnr)
                local opts = { noremap = true, silent = true }
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
