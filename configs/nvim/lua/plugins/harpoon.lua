local harpoon = nil

local telescope_conf = nil
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = telescope_conf.file_previewer({}),
        sorter = telescope_conf.generic_sorter({}),
    }):find()
end

return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	keys = {
		{ "<C-e>", function() toggle_telescope(harpoon:list()) end, desc = "Open harpoon window" },
		{ "<leader>a", function() harpoon:list():add() end, desc = "harpoon add to list" },
	},
	config = function(_, opts)
		harpoon = require("harpoon")
		harpoon.setup(opts)
		telescope_conf = require("telescope.config").values

	end
}

