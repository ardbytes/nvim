return {
  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      completion = {
        ghost_text = { enabled = false },
        -- Disable the pop-up menu showing automatically as you type
        trigger = {
          show_on_keyword = false,
          show_on_trigger_character = false,
        },
      },
    },
  },
}
