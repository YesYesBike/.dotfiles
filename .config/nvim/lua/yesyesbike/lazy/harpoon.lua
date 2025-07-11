return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup({
			settings = {
				save_on_toggle = true,
				-- sync_on_ui_close = true,
			},
		})

		vim.keymap.set("n", "<leader>A", function()
			harpoon:list():prepend()
		end)
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<C-f>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<C-n>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<C-c>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<C-b>", function()
			harpoon:list():select(4)
		end)
		vim.keymap.set("n", "<leader><C-f>", function()
			harpoon:list():replace_at(1)
		end)
		vim.keymap.set("n", "<leader><C-n>", function()
			harpoon:list():replace_at(2)
		end)
		vim.keymap.set("n", "<leader><C-c>", function()
			harpoon:list():replace_at(3)
		end)
		vim.keymap.set("n", "<leader><C-b>", function()
			harpoon:list():replace_at(4)
		end)
	end,
}
