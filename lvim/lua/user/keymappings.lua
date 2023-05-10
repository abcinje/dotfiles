local M = {}

M.config = function()
  vim.keymap.set("i", "jk", "<Esc>")
end

return M
