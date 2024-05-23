function ColorMyPencils(color)
    color = color or "default"

    local hour = tonumber(os.date("%H"))

    if hour >= 6 and hour < 18 then
        vim.opt.background = "light"
    else
        vim.opt.background = "dark"
    end

    vim.cmd.colorscheme(color)
end

ColorMyPencils()

