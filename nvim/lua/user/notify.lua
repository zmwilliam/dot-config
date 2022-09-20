local M = {}


function M.setup()
  local status_ok, notify = pcall(require, "notify")
  if not status_ok then
    return
  end

  notify.setup({
    timeout = 1500,
  })

  vim.notify = notify
end

return M
