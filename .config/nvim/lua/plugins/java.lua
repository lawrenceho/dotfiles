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
        opts.on_attach = function()
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
        end
      end,
    },
  },
}
