local vim = vim
local api = vim.api

local animation = require('aneo.animation')
local timer = require('pomovims.timer')

local M = {}

function M.start(setup)
    local buf = api.nvim_create_buf(false, true)
    api.nvim_open_win(buf, true, setup)

    local timer_animation = animation:new(timer)
    local window_width = vim.api.nvim_win_get_width(0)
    local window_height = vim.api.nvim_win_get_height(0)
    local x = math.floor((window_width - timer_animation.width ) / 2)
    local y = math.floor((window_height - timer_animation.height) / 2) - 1

    local timer_buf = api.nvim_create_buf(false, true)
    local timer_win = api.nvim_open_win(timer_buf, true, {
        width = timer_animation.width + 20,
        height = timer_animation.height,
        relative = "win",
        row = y + (timer_animation.height/2),
        col = x + math.floor(((timer_animation.width - 20)/8)),
    })
    print ("Width : " .. window_width)
    print ("height: " .. window_height)

    timer_animation:render(timer_win)
end

return M



