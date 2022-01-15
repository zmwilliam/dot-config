local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
    disable = { "yaml" }
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  autopairs = {
		enable = true,
	},
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = {}, -- List of parsers to ignore installing
  ensure_installed = "maintained",
  -- ensure_installed = { -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  --   "fish",
  --   "json",
  --   "yaml",
  --   "html",
  --   "css",
  --   "scss",
  --   "elixir",
  --   "heex",
  --   "go",
  --   "lua",
  --   "javascript"
  -- },
}
