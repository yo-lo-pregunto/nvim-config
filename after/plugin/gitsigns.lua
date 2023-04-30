local wk = require("which-key")

require('gitsigns').setup{
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    local opts = { noremap=true, silent=true, buffer=bufnr }

  wk.register({
      [']'] = {
          name = "Next",
          ['c'] = { function()
              if vim.wo.diff then return ']c' end
              vim.schedule(function() gs.next_hunk() end)
              return '<Ignore>'
          end,  "Hunk" },
      },
      ['['] = {
          name = "Previous",
          ['c'] = { function()
              if vim.wo.diff then return '[c' end
              vim.schedule(function() gs.prev_hunk() end)
              return '<Ignore>'
          end,  "Hunk" },
      },
      ['<leader>'] = {
          ['g'] = {
              name = 'Git',
              ['s'] = { gs.stage_hunk, "Stage hunk" },
              ['r'] = { gs.reset_hunk, "Reset hunk" },
              ['u'] = { gs.undo_stage_hunk, "Undo hunk" },
              ['S'] = { gs.stage_buffer, "Stage Buffer" },
              ['R'] = { gs.reset_buffer, "Reset Buffer" },
              ['p'] = { gs.preview_hunk, "Preview hunk" },
              ['d'] = { function() gs.diffthis('~') end, "Diff" },
              ['c'] = { "<cmd>G commit -s<cr>", "Commit" },
              ['g'] = { "<cmd>G<cr>", "Status" },
              ['o'] = { "<cmd>Telescope git_status<cr>", "Open changed file" },
              ['b'] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
              ['l'] = { "<cmd>Telescope git_commits<cr>", "Log" },
          }
      }
  }, opts)
  end
}
