function ClearBackground()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

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
ClearBackground()

