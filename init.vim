" === BASIC SETTINGS ===
set number                " Show absolute line numbers
set relativenumber        " Show relative line numbers
set tabstop=4             " Number of spaces a tab counts for
set shiftwidth=4          " Number of spaces to use for each step of (auto)indent
set expandtab             " Use spaces instead of tabs
set smartindent           " Smart autoindent
set termguicolors         " Enable 24-bit RGB colors
syntax on                 " Enable syntax highlighting

" Show tabs and trailing spaces visibly
set list
set listchars=tab:>-,trail:·,extends:>,precedes:<,nbsp:%

" Enable mouse support (optional, handy)
set mouse=a

" === PLUGIN MANAGER ===
call plug#begin('~/.local/share/nvim/plugged')

" Dracula color scheme
Plug 'dracula/vim', { 'as': 'dracula' }

" File explorer
Plug 'preservim/nerdtree'

" Status line
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'  " Icons for lualine

" Fuzzy finder
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'

" LSP and completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Treesitter for better syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

" === COLOR SCHEME ===
colorscheme dracula

" === STATUS LINE ===
lua << EOF
require('lualine').setup {
  options = { theme = 'dracula' }
}
EOF

" === TREESITTER SETUP ===
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "cpp" },
  highlight = { enable = true },
  indent = { enable = true },
}
EOF

" === LSP SETUP FOR C (clangd) ===
lua << EOF
require('lspconfig').clangd.setup{}
EOF

" === AUTOCOMPLETE SETUP ===
lua << EOF
local cmp = require'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }
}
EOF

" === CSCOPE INTEGRATION ===
if has("cscope")
  set cscopequickfix=s-,c-,d-,i-,t-,e-
  if filereadable("cscope.out")
    cs add cscope.out
  endif
endif

" CSCOPE KEYMAPS for quick lookup
nmap <leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ct :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ce :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cf :cs find f <C-R>=expand("<cfile>")<CR><CR>

" === NERDTREE TOGGLE ===
nnoremap <C-n> :NERDTreeToggle<CR>

" === TELESCOPE KEYMAPS ===
nnoremap <leader>f <cmd>Telescope find_files<CR>
nnoremap <leader>g <cmd>Telescope live_grep<CR>

" === TOGGLE VISIBLE WHITESPACE ===
nnoremap <F3> :set list!<CR>
