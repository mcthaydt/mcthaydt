local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

-- Reccommended Settings from Documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- Customize icons.
vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged = '',
    staged = '',
    unmerged = '',
    renamed = '',
    deleted = '',
    untracked = '',
    ignored = '',
  },
  folder = {
    default = '',
    open = '',
    symlink = '',
  },
}

nvimtree.setup()
