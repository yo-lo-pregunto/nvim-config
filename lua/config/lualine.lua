local status_ok, line  = pcall(require, "lualine")
if not status_ok then
    return
end

local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added    = gitsigns.added,
            modified = gitsigns.changed,
            removed  = gitsigns.removed
        }
    end
end

local function local_time ()
    local my_time = {}
    local local_hour = os.date("%H")

    table.insert(my_time, local_hour)
    table.insert(my_time, os.date("%M"))
    return table.concat(my_time, ":")
end

line.setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {"NvimTree"},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = { {'diff', source = diff_source} },
        lualine_c = { {'filename', path = 1} },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {local_time}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { {'filename', path =1} },
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
        lualine_a = { { 'buffers', symbols = { modified = " *" }, } },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {'branch'},
        lualine_y = {},
        lualine_z = {'tabs'}},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
