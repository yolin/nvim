return {
  "neovim/nvim-lspconfig",
  opts = {
    autoformat = false,
    setup = {
      clangd = function(_, opts)
        opts.cmd = { "clangd", "--header-insertion=never" }
        opts.capabilities = vim.tbl_deep_extend("force", opts.capabilities or {}, {
          textDocument = {
            semanticTokens = {
              dynamicRegistration = false,
            },
          },
        })
        return true
      end,
    },
  },
}
