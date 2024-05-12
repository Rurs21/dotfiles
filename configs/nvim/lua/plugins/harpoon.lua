local package = nil
local function harpoon()
	if package == nil then
		package = require("harpoon")
		package:setup()
	end
	return package
end

return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<C-e>", function() harpoon().ui:toggle_quick_menu(harpoon():list()) end, desc = "harpoon toggle quick menu" }, 
		{ "<leader>a", function() harpoon():list():add() end, desc = "harpoon add to list" },
	}
}

