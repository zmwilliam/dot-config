local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

parser_config.embedded_template = {
  install_info = {
    url                            = 'https://github.com/tree-sitter/tree-sitter-embedded-template',
    files                          = { 'src/parser.c' },
    requires_generate_from_grammar = true,
  },
  used_by = { 'eex', 'leex', 'eelixir', 'eruby', 'erb' }
}

configs.setup {
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = false,
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
  ensure_installed = { -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    "bash",
    "css",
    "dockerfile",
    "eex",
    "elixir",
    "erlang",
    "fish",
    "go",
    "heex",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "python",
    "query",
    "scss",
    "surface",
    "tsx",
    "typescript",
    "vim",
    "vue",
    "yaml",
  },
}
