local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = {                                                                                                                                            
          actions.move_selection_previous, type = "action",                                                                                                          
          opts = { nowait = true, silent = true }                                                                                                                
        },
        ["<C-j>"] = {                                                                                                                                            
          actions.move_selection_next, type = "action",                                                                                                          
          opts = { nowait = true, silent = true }                                                                                                                
        }
      },
      n = {
        ["<C-k>"] = {                                                                                                                                            
          actions.move_selection_previous, type = "action",                                                                                                          
          opts = { nowait = true, silent = true }                                                                                                                
        },
        ["<C-j>"] = {                                                                                                                                            
          actions.move_selection_next, type = "action",                                                                                                          
          opts = { nowait = true, silent = true }                                                                                                                
        },
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      hijack_netrw = true,
      dir_icon = ' ',
      mappings = {
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
}
telescope.load_extension("file_browser")

-- keymaps
local opts = {silent = true, noremap = true}

vim.keymap.set("n", "<leader>fb", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end, opts)
vim.keymap.set('n', '<leader>pf', function()
    builtin.find_files({
      no_ignore = false,
      hidden = true,
    })
  end, opts)
vim.keymap.set('n', '<leader>ps', function()
  builtin.live_grep()
end, opts)
vim.keymap.set('n', '<leader>b', function()
  builtin.buffers()
end, opts)
vim.keymap.set('n', ';t', function()
  builtin.help_tags()
end, opts)
vim.keymap.set('n', ';;', function()
  builtin.resume()
end, opts)
vim.keymap.set('n', ';e', function()
  builtin.diagnostics()
end, opts)
