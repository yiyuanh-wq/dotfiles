return {
    {
        'echasnovski/mini.nvim',
        -- can set this for any plugin to easily turn on/off
        -- enabled = false,
        config = function()
            local statusline = require 'mini.statusline'
            statusline.setup { use_icons = true }
        end
    }
}
