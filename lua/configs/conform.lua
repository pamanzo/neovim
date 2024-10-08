local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        python = { "black" },
        html = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        astro = { "prettier" },
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        lsp_fallback = true,
    },
}

require("conform").setup(options)
