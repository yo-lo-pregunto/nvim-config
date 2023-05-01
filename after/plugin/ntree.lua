require("nvim-tree").setup { -- BEGIN_DEFAULT_OPTS
      on_attach = "default", -- keymaps
      sync_root_with_cwd = true,
      view = {
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
    update_focused_file = {
        enable = true,
        debounce_delay = 15,
        update_root = true,
        ignore_list = {},
    },
    } -- END_DEFAULT_OPTS
