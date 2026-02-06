-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
local target_project = "/home/ard/work/newton_daily/app1"
local is_wsl = vim.fn.environ()["WSL_DISTRO_NAME"] ~= nil

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local cwd = vim.fn.getcwd()
    -- Only act if we are in WSL2
    if is_wsl then
      -- Check if the current directory starts with your target path
      if vim.startswith(cwd, target_project) then
        vim.diagnostic.enable(true)
        vim.g.disable_autoformat = false
        vim.g.autoformat = true
      else
        vim.diagnostic.enable(false)
        vim.g.disable_autoformat = true
        vim.g.autoformat = false
      end
    end
  end,
})
