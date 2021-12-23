local status, nightfox = pcall(require, 'nightfox')
if not status then
  return
end

nightfox.setup({
  fox = "nightfox", -- nightfox, nordfox, dayfox, dawnfox and duskfox
  styles = {
   comments = "italic", -- change style of comments to be italic
   keywords = "bold", -- change style of keywords to be bold
   functions = "italic,bold" -- styles can be a comma separated list
  },
  inverse = {
    match_paren = false, -- inverse the highlighting of match_parens
  }
})

nightfox.load()
