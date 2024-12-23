return {
    {
        'echasnovski/mini.nvim',
        -- can set this for any plugin to easily turn on/off
        -- enabled = false,
        config = function()
            local statusline = require 'mini.statusline'
            local pairs = require 'mini.pairs'

            statusline.setup { use_icons = true }
            pairs.setup {}
        end
    }
}
