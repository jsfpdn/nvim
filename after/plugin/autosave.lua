require("auto-save").setup {
    condition = function(buf)
        local fn = vim.fn
        local utils = require("auto-save.utils.data")

        if fn.getbufvar(buf, "&modifiable") == 0 then return false end
        if utils.not_in(fn.getbufvar(buf, "&filetype"), {"rust"}) then
            return false
        end

        return true
    end
}
