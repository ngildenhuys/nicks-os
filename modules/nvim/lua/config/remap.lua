-- Sets the leader to be the space key for new commands
vim.g.mapleader = " "
-- Sets in normal mode leader->p->v keystrokes will do the command :Ex (the explore command)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move block in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in center while C-d and C-u jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--  search terms to stay in the center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- map <leader>p to paste but whatever you paste over goes to the void
-- register instead of to your active yank register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- remap <leader>p to yank to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])


-- mappings for changing windows
vim.keymap.set({'n', 't'}, '<leader>r', '<Plug>NetrwRefresh')
vim.keymap.set({'n', 't'}, '<C-h>', '<CMD>NavigatorLeft<CR>')
vim.keymap.set({'n', 't'}, '<C-l>', '<CMD>NavigatorRight<CR>')
vim.keymap.set({'n', 't'}, '<C-k>', '<CMD>NavigatorUp<CR>')
vim.keymap.set({'n', 't'}, '<C-j>', '<CMD>NavigatorDown<CR>')
vim.keymap.set({'n', 't'}, '<C-p>', '<CMD>NavigatorPrevious<CR>')
