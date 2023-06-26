local M = {}

M.config = function()
  vim.keymap.set("i", "jk", "<Esc>")
  vim.keymap.set("n", ":", ";")
  vim.keymap.set("n", ";", ":")
end

return M
