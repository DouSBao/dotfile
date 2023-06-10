-- basic keymaps
local keymap = vim.api.nvim_set_keymap
local opt = user.keymap.option

keymap("", "<Space>", "<Nop>", opt)
vim.g["mapleader"] = " "

-- shift + arrow to switch buffer
keymap("n", "<S-Right>", ":bnext<CR>", opt)
keymap("n", "<S-Left>", ":bprevious<CR>", opt)

-- shift + up/down to scroll up/down
keymap("n", "<S-Up>", "<PageUp>", opt)
keymap("n", "<S-Down>", "<PageDown>", opt)

-- shift + q to close buffer
keymap("n", "<S-q>", ":bdelete<CR>", opt)

-- ctrl + arrow to switch window
keymap("n", "<C-Left>", ":wincmd h<CR>", opt)
keymap("n", "<C-Right>", ":wincmd l<CR>", opt)
keymap("n", "<C-Up>", ":wincmd k<CR>", opt)
keymap("n", "<C-Down>", ":wincmd j<CR>", opt)

-- ctrl + q to window close
keymap("n", "<C-q>", ":quit<CR>", opt)

-- ctrl + shift + arrow to move window
keymap("n", "<S-C-Down>", ":wincmd J<CR>", opt)
keymap("n", "<S-C-Up>", ":wincmd K<CR>", opt)
keymap("n", "<S-C-Right>", ":wincmd L<CR>", opt)
keymap("n", "<S-C-Left>", ":wincmd H<CR>", opt)

-- ctrl + shift + q to leave neovim
keymap("n", "<S-C>q", ":quitall!<CR>", opt)

-- stay in visual mode after < and >
keymap("v", "<", "<gv", opt)
keymap("v", ">", ">gv", opt)

-- esc to turn off highlight search
keymap("n", "<Esc>", "<Esc>:nohlsearch<CR>", opt)

-- ctrl + c yank to system clipboard, ctrl + v paste from system clipboard
keymap("v", "<C-c>", "\"+y", opt)
keymap("n", "<C-v>", "\"+p", opt)
keymap("i", "<C-v>", "<Cmd>normal! \"+p<CR>", opt)

