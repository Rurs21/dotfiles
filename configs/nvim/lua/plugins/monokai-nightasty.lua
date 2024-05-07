return {
    "polirritmico/monokai-nightasty.nvim",
    lazy = false,
    priority = 1000,
    keys = {
        { "<leader>tt", "<cmd>MonokaiToggleLight<cr>", desc = "Monokai-Nightasty: Toggle dark/light theme." },
    },
    opts = {
        dark_style_background = "#181818", -- default, dark, transparent, #color
        light_style_background = "#eff1f5", -- default, dark, transparent, #color
        color_headers = true, -- Enable header colors for each header level (h1, h2, etc.)
        lualine_bold = true, -- Lualine a and z sections font width
        lualine_style = "default", -- "dark", "light" or "default" (Follows dark/light style)
        -- Style to be applied to different syntax groups. See `:help nvim_set_hl`
        hl_styles = {
            keywords = { italic = true },
            comments = { italic = true },
        },

        on_highlights = function(highlights, colors)
            -- You could add styles like bold, underline, italic
            highlights.TelescopeSelection = { bold = true }
            highlights.TelescopeBorder = { fg = colors.grey }
            highlights["@lsp.type.property.lua"] = { fg = colors.fg }
        end,
    },
    config = function(_, opts)
        -- Highlight line at the cursor position
        vim.opt.cursorline = true

        require("monokai-nightasty").load(opts)
    end,
}
