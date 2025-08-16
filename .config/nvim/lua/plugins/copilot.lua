return {
  "zbirenbaum/copilot.lua",
  opts = {
    suggestion = {
      auto_trigger = true, -- Show suggestions without manual trigger
      keymap = {
        accept = "<C-l>", -- Alt+l to accept (avoids <Tab> conflicts)
        next = "<C-j>", -- Cycle next suggestion
        prev = "<C-k>", -- Cycle previous suggestion
        dismiss = "<C-c>", -- Dismiss suggestion
      },
    },
    panel = { enabled = false }, -- Disable if you don't use the panel
  },
}
