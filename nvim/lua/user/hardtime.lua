vim.g.hardtime_default_on = 1 --hardtime to run in every buffer
vim.g.hardtime_showmsg = 0 -- enable the notification about HardTime being enabled set
vim.g.hardtime_ignore_quickfix = 1
vim.g.hardtime_allow_different_key = 1 -- allow a key if it is different from the previous key
vim.g.hardtime_maxcount = 5
vim.g.hardtime_timeout = 1000
vim.g.hardtime_ignore_buffer_patterns = { "NvimTree", "alpha", "fugitive"}
