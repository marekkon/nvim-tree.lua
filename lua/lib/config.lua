local M = {}

function M.get_icon_state()
  local show_icons = vim.g.lua_tree_show_icons or { git = 1, folders = 1, files = 1 }
  local icons = {
    default = nil,
    git_icons = {
      unstaged = "✗",
      staged = "✓",
      unmerged = "═",
      renamed = "➜",
      untracked = "★"
    }
  }

  local user_icons = vim.g.lua_tree_icons
  if user_icons then
    if user_icons.default then
      icons.default = user_icons.default
    end
    for key, val in pairs(user_icons.git) do
      if icons.git_icons[key] then
        icons.git_icons[key] = val
      end
    end
  end

  return {
    show_file_icon = show_icons.files == 1 and vim.g.nvim_web_devicons == 1,
    show_folder_icon = show_icons.folders == 1,
    show_git_icon = show_icons.git == 1,
    icons = icons
  }
end

function M.get_bindings()
  local keybindings = vim.g.lua_tree_bindings or {}
  return {
    edit        = keybindings.edit or '<CR>',
    edit_vsplit = keybindings.edit_vsplit or '<C-v>',
    edit_split  = keybindings.edit_split or '<C-x>',
    edit_tab    = keybindings.edit_tab or '<C-t>',
    cd          = keybindings.cd or '<C-]>',
    create      = keybindings.create or 'a',
    remove      = keybindings.remove or 'd',
    rename      = keybindings.rename or 'r',
  }
end

return M
