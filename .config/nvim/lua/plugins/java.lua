return {
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      jdtls = function(opts)
        table.insert(opts.cmd, "--jvm-arg=-Djava.import.generatesMetadataFilesAtProjectRoot=false")
        -- https://github.com/LazyVim/LazyVim/discussions/2793
        opts.root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" })
        opts.settings = {
          java = {
            import = {
              gradle = {
                enabled = false,
              },
            },
            inlayHints = {
              parameterNames = {
                enabled = "all",
              },
            },
            completion = {
              importOrder = {
                "",
                "javax",
                "java",
                "#",
              },
            },
            sources = {
              organizeImports = {
                starThreshold = 5,
                staticStarThreshold = 3,
              },
            },
          },
        }
        -- https://github.com/LazyVim/LazyVim/pull/5218
        opts.capabilities = LazyVim.has("blink.cmp") and require("blink.cmp").get_lsp_capabilities()
          or LazyVim.has("cmp-nvim-lsp") and require("cmp_nvim_lsp").default_capabilities()
          or nil
        opts.on_attach = function()
          -- Inlay hints
          if LazyVim.opts("nvim-lspconfig").inlay_hints.enabled then
            vim.lsp.inlay_hint.enable(true)
          end
        end
      end,
    },
  },
}
