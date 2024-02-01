-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = 'q'

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Map Esc to kk
map('i', '<leader>i', '<Esc>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- Toggle auto-indenting for code paste
map('n', '<F2>', ':set invpaste paste?<CR>')
vim.opt.pastetoggle = '<F2>'

-- Change split orientation
map('n', '<leader>p', ':split<CR>', { noremap = true, silent = true })
map('n', '<leader>o', ':vsplit<CR>', { noremap = true, silent = true })
map('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })
map('n', '<leader>x', ':only<CR>', { noremap = true, silent = true })

-- Les onglets sur NeoVim
map('n', '<leader>w', ':tabclose<CR>', { noremap = true, silent = true })
map('n', '<leader>t', ':tabnew<CR>', {noremap = true, silent = true})
map('n', '<leader><right>', ':tabnext<CR>', { noremap = true, silent = true })
map('n', '<leader><left>', ':tabprevious<CR>', { noremap =true, silent = true })

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<leader>j', '<C-w>h')
map('n', '<leader>k', '<C-w>j')
map('n', '<leader>i', '<C-w>k')
map('n', '<leader>l', '<C-w>l')


-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Fast saving with <leader> and s
map('n', '<leader>.', ':w<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>,', ':qa!<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('n', '<leader>4', ':Term<CR>', { noremap = true })  -- open
map('t', '<leader>5', '<C-\\><C-n>')                    -- exit

-- NvimTree
map('n', '<leader>f', ':NvimTreeToggle<CR>')            -- open/close
map('n', '<leader>fr', ':NvimTreeRefresh<CR>')       -- refresh
map('n', '<leader>fd', ':NvimTreeFindFile<CR>')      -- search file

-- Tagbar
map('n', '<leader>z', ':TagbarToggle<CR>')          -- open/close
