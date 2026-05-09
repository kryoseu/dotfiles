return {
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            numThreads = 2,

            -- Kill the on-save cargo check. Use clippy only on demand.
            checkOnSave = false,

            cargo = {
              buildScripts = {
                enable = false,
              },
            },

            -- Disable proc macros entirely if you can tolerate red squiggles
            procMacro = {
              enable = false,
            },

            -- Cache priming threads - this is separate from numThreads
            cachePriming = {
              enable = true,
              numThreads = 1, -- default is all physical cores
            },

            diagnostics = {
              enable = false, -- nuclear option, but stops cargo check spawning
            },

            files = {
              excludeDirs = {
                "node_modules",
                "target",
                ".git",
                ".cargo",
              },
            },

            inlayHints = {
              enable = false,
            },
          },
        },
      },
    },
  },
}
