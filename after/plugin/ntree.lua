require("nvim-tree").setup { -- BEGIN_DEFAULT_OPTS
      on_attach = "default", -- keymaps
      view = {
        hide_root_folder = true,
        signcolumn = "yes",
        float = {
          enable = false,
          open_win_config = {
            relative = "cursor",
            height = 10,
          },
        },
      },
      renderer = {
        highlight_opened_files = "icon",
        icons = {
          glyphs = {
            default = "",
            symlink = "",
            bookmark = "",
            modified = "●",
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
        symlink_destination = true,
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
    } -- END_DEFAULT_OPTS

require("which-key").register({
        ['e'] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    },
    require("yo-lo-pregunto.utils").remap_opts
)
