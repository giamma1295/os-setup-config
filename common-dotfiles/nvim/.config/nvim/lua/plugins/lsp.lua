return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          settings = {
            vtsls = {},
            typescript = {},
          },
          before_init = function(_, config)
            local yarnPnpFile = vim.fs.find({ ".pnp.cjs" }, { upward = true })[1]
            if yarnPnpFile then
              config.settings.typescript.tsdk = vim.fs.dirname(yarnPnpFile) .. "/.yarn/sdks/typescript/lib"
              config.settings.vtsls.autoUseWorkspaceTsdk = true
            end
          end,
        },
        --- @type lspconfig.options.jsonls
        jsonls = {
          settings = {
            json = {
              schemas = {
                { fileMatch = { "*.json", "*.jsonc" }, schema = { allowTrailingCommas = true } },
              },
            },
          },
        },
      },
    },
  },
}
