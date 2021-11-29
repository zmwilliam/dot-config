let g:webdevicons_enable = 1
let g:webdevicons_enable_startify = 1
let g:startify_session_dir = '~/.config/nvim/sessions' "Sessions directory
let g:startify_session_delete_buffers = 1 "Delete all buffers when loading or closing a session
let g:startify_change_to_vcs_root = 1 "seek and change to the root directory of the VCS
let g:startify_session_persistence = 1 "Automatically update sessions before quiting vim
let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'files',     'header': ['   Files']            },
          \ ]
let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'c': '~/.config/nvim/coc-settings.json' },
            \ { 'z': '~/.config/tmux/tmux.conf' },
            \ { 'x': '~/.gitconfig' },
            \ ]

