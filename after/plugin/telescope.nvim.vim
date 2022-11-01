if has('nvim')
lua << EOF
  -- Project
  require('telescope').setup{
    -- ...
  }
  require('telescope').load_extension 'file_browser'
  require('telescope').load_extension 'project'
EOF
endif
