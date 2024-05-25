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
        opts.on_attach = function(args)
          -- DAP configuration
          require("dap").configurations.java = {
            {
              type = "java",
              request = "attach",
              name = "Debug (Attach) - Remote",
              hostName = "localhost",
              port = 5005,
            },
          }

          -- Register the gd keymap and toggle inlay hints
          -- because the supports_method function may return false
          -- when jdtls is not fully loaded in Neovim 0.10
          require("which-key").register({
            ["gd"] = {
              function()
                require("telescope.builtin").lsp_definitions({ reuse_win = true })
              end,
              "Goto Definition",
            },
          }, { mode = "n", buffer = args.buf })

          if vim.fn.has("nvim-0.10") == 1 then
            LazyVim.toggle.inlay_hints(args.buf, true)
          end
        end
      end,
    },
  },
}
