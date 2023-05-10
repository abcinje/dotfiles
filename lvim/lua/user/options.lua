local M = {}

M.config = function()
  vim.opt.background = "light"
  vim.opt.linebreak = true
  vim.opt.list = true
  vim.opt.listchars:append({ tab = '» ', trail = '·' })
  vim.opt.relativenumber = true
  vim.opt.title = false
  vim.opt.wrap = true
  vim.opt.wrapscan = false
end

return M
