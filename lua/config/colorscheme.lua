local colorscheme = "carbonfox"
local default = "darkblue"

local colors_path = vim.o.rtp .. ",$HOME/.local/share/nvim/site/pack/packer/start/*"
local ext = {"colors/*.vim", "colors/*.lua"}
local colors = {}

local function get_color()
    local b
    for _, t in pairs(colors) do
        for _, c in pairs(t) do
            b = string.match(c, "^.+/(.+)")
            b, _ = string.gsub(b, ".vim", '')
            b, _ = string.gsub(b, ".lua", '')
            if b == colorscheme then
                return colorscheme
            end
        end
    end
    return default
end

for _, e in pairs(ext) do
    table.insert(colors, vim.fn.globpath(colors_path, e, 0, 1))
end

local color = get_color()

local base_theme = {'catppuccin', 'fox'}

for _, theme in pairs(base_theme) do
    if string.find(color,theme) then
        local ok, _ = pcall(require,"config.colors."..theme)
        if not ok then
            print('There is not a base theme for ' .. color .. ' using defaults')
        end
    end
end
pcall(vim.cmd, "colorscheme " .. color)
