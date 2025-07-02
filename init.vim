call plug#begin('~/.local/share/nvim/plugged')

" Dracula theme
Plug 'dracula/vim', { 'as': 'dracula' }

" File explorer
Plug 'preservim/nerdtree'

" Status line
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Fuzzy finder
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'

" LSP and autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

" Theme and statusline
colorscheme dracula
lua << EOF
require('lualine').setup {
  options = {
    theme = 'dracula'
  }
}
EOF

" === ADD TREESITTER CONFIG HERE ===
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "cpp" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
}
EOF

" Other Lua configs like LSP, cmp, etc. follow here...
