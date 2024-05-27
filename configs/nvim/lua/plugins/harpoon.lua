local harpoon = nil
return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	keys = {
		{ "<C-e>", function() harpoon:toggle_telescope(harpoon:list()) end, desc = "Open harpoon window" },
		{ "<leader>a", function() harpoon:list():add() end, desc = "harpoon add to list" },
	},
	config = function(_, opts)
		harpoon = require("harpoon")
		harpoon.setup(opts)

		local telescope_conf = require("telescope.config").values
		function harpoon.toggle_telescope(self, harpoon_files)
			local make_finder = function()
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end
				return	require("telescope.finders").new_table({
					results = file_paths,
				})
			end

			require("telescope.pickers").new({}, {
				prompt_title = "Harpoon",
				finder = make_finder(),
				previewer = telescope_conf.file_previewer({}),
				sorter = telescope_conf.generic_sorter({}),
				attach_mappings = function(prompt_buffer_number, map)
					map("i","<C-Del>",
					function()
						local state = require("telescope.actions.state")
						local selected_entry = state.get_selected_entry()
						local current_picker = state.get_current_picker(prompt_buffer_number)
						print(harpoon)
						for key, value in pairs(harpoon:list()) do
							print(key);
						end
						harpoon:list():remove(selected_entry)
						current_picker:refresh(make_finder())
					end)
					return true
				end
			}):find()
		end

	end
}

