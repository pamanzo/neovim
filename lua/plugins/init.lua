return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        config = function()
            require "configs.conform"
        end,
        lazy = false,
    },

    {
        "smoka7/hop.nvim",
        version = "*",
        opts = {},
        lazy = false,
    },

    {
        "tpope/vim-surround",
        lazy = false,
    },

    -- These are some examples, uncomment them if you want to see them work!

    {
        "williamboman/mason.nvim",
        opts = {
            pkg = {
                "lua-language-server",
                "stylua",
                "html-lsp",
                "css-lsp",
                "prettier",
                "clangd",
                "pyright",
                "ts-standard",
                "marksman",
                "astro-language-server",
            },
        },
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "AstroNvim/astrolsp", opts = {} },
            {
                "williamboman/mason-lspconfig.nvim", -- MUST be set up before `nvim-lspconfig`
                dependencies = { "williamboman/mason.nvim" },
                opts = function()
                    return {
                        -- use AstroLSP setup for mason-lspconfig
                        handlers = {
                            function(server)
                                require("astrolsp").lsp_setup(server)
                            end,
                        },
                    }
                end,
            },
        },
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
            -- set up servers configured with AstroLSP
            vim.tbl_map(require("astrolsp").lsp_setup, require("astrolsp").config.servers)
        end,
    },

    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup {
                panel = {
                    enabled = true,
                    auto_refresh = false,
                    keymap = {
                        jump_prev = "[[",
                        jump_next = "]]",
                        accept = "<CR>",
                        refresh = "gr",
                        open = "<M-CR>",
                    },
                    layout = {
                        position = "bottom", -- | top | left | right
                        ratio = 0.4,
                    },
                },
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        accept = "<M-0>",
                        accept_word = "<M-f>",
                        accept_line = "<M-m>",
                        next = "<M-]>",
                        prev = "<M-[>",
                        dismiss = "<C-]>",
                    },
                },
                filetypes = {
                    yaml = false,
                    markdown = true,
                    help = false,
                    gitcommit = true,
                    gitrebase = false,
                    hgcommit = false,
                    svn = false,
                    cvs = false,
                    ["."] = false,
                },
                copilot_node_command = "node", -- Node.js version must be > 18.x
                server_opts_overrides = {},
            }
        end,
    }, --
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "html",
                "css",
                "markdown",
                "markdown_inline",
            },
        },
    },

    -- tailwind-tools.lua
    {
        "luckasRanarison/tailwind-tools.nvim",
        name = "tailwind-tools",
        build = ":UpdateRemotePlugins",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim", -- optional
            "neovim/nvim-lspconfig", -- optional
        },
        opts = {}, -- your configuration
        lazy = true,
    },
    -- Lazy
    {
        "piersolenski/telescope-import.nvim",
        dependencies = "nvim-telescope/telescope.nvim",
        config = function()
            require("telescope").load_extension "import"
        end,
    },

    {
        "olrtg/nvim-emmet",
        config = function()
            vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation)
        end,
    },

    {
        "windwp/nvim-ts-autotag",
        lazy = false,
        event = "InsertEnter",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },

    {
        "sontungexpt/url-open",
        event = "VeryLazy",
        cmd = "URLOpenUnderCursor",
        config = function()
            local status_ok, url_open = pcall(require, "url-open")
            if not status_ok then
                return
            end
            url_open.setup {}
        end,
    },

    --indica el nivel de intentación
    -- si va mal usar "huy-hng/anyline.nvim"
    {
        "shellRaining/hlchunk.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("hlchunk").setup {
                chunk = {
                    enable = true,
                    -- ...
                },
                indent = {
                    enable = true,
                    -- ...
                },
            }
        end,
    },

    -- destaca las variables con el mismo nombre
    {
        "RRethy/vim-illuminate",
        event = "CursorHold",
        config = function()
            vim.g.Illuminate_delay = 100
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        lazy = false,
        config = function()
            require("treesitter-context").setup {}
        end,
    },

    {
        "smjonas/inc-rename.nvim",
        lazy = false,
        config = function()
            require("inc_rename").setup()
        end,
    },
    {
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons", -- para iconos en el árbol
        },
        config = function()
            local function my_on_attach(bufnr)
                local api = require "nvim-tree.api"

                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                -- Usa las configuraciones predeterminadas
                api.config.mappings.default_on_attach(bufnr)

                -- Elimina los mapeos predeterminados
                vim.keymap.del("n", "J", { buffer = bufnr })
                vim.keymap.del("n", "K", { buffer = bufnr })
            end

            require("nvim-tree").setup {
                on_attach = my_on_attach,
            }
        end,
    },
}
