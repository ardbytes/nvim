return {
  {
    "saghen/blink.cmp",
    opts = {
      -- Turn off the automatic popup menu while editing text
      completion = {
        menu = { auto_show = false },
      },
      -- Keep the automatic popup menu turned ON for the command line
      cmdline = {
        completion = {
          menu = { auto_show = true },
        },
      },
    },
  },
}
