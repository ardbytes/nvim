return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      --"OXY2DEV/markview.nvim",
      "nvim-treesitter/nvim-treesitter-context",
    },
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    init = function(plugin)
      -- Add nvim-treesitter to runtime path early
      require("lazy.core.loader").add_to_rtp(plugin)
    end,
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall", "TSUninstall" },
    opts = {
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      -- Automatically install missing parsers when entering buffer
      auto_install = true,
    },
    config = function(_, opts)
      -- Install the required parsers
      local parsers_to_install = {
        "bash",
        "c",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "regex",
        "ruby",
        "toml",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      }

      -- Setup nvim-treesitter with options
      require("nvim-treesitter").setup(opts)

      -- Install parsers asynchronously
      require("nvim-treesitter").install(parsers_to_install)

      -- Enable treesitter highlighting for all supported filetypes
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
}
