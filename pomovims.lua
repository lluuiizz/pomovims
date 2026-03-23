local vim = vim
local api = vim.api
FloatingWindow = {}
FloatingWindow.___index = FloatingWindow

local buf = api.nvim_create_buf(false, true)
function FloatingWindow.setup(opts)
     local self = setmetatable({}, FloatingWindow)
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
         PomoVims(self)
     end)

     return self

 end



function PomoVims(float_setup) 
    local win = vim.api.nvim_open_win(buf, true, float_setup)
end


