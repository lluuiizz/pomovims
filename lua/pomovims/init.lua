local vim = vim
local core = require('pomovims.core')

local M = {}

function M.setup(opts)
     local self = setmetatable({}, M)
     opts = opts or {width = 120, height = 30, style = 'minimal'}

     self.width = opts.width
     self.height = opts.height
     self.row = math.floor((vim.o.lines - self.height) / 2) - 1
     self.col = math.floor((vim.o.columns - self.width ) / 2)
     self.relative = 'editor'
     self.style = opts.style
     self.border = vim.o.winborder == '' and 'single' or vim.o.winborder
     self.title = "PomoVims @version 0.0.1"

     vim.keymap.set('n', '<leader>pm', function ()
         core.start(self)
     end)
 end

return M

