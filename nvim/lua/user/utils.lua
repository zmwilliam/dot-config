local M = {}

---@param modname string
---@param fn function
function M.onRequireOk(modname, fn)
  local status_ok, mod = pcall(require, modname)
  if status_ok then
    fn(mod)
  end
end

return M
