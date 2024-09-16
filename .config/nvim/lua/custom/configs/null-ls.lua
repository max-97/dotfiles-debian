local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local opts = {
    sources = {
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.ruff.with({
            extra_args = { "--ignore E501"}
        }),
        null_ls.builtins.formatting.black.with({
            extra_filetypes = { "python" },
            extra_args = { "-l 120"}
        }),
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.rustfmt,
    },
    on_attach = function (client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
                group = augroup,
                buffer = bufnr,
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function ()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end
            })
        end
    end,
    root_dir = require("null-ls.utils").root_pattern(
        "Cargo.toml", "requirements.txt", "setup.py"
    )
}
return opts
