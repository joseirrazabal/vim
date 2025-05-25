return {
	"lukas-reineke/indent-blankline.nvim",
	enabled = false,
	opts = {
		indent = {
			-- highlight = highlight,
			char = "│",
			tab_char = "│",
		},
		scope = {
			show_start = false,
			show_end = false,
			enabled = false,
		},
		exclude = {
			buftypes = {
				"nofile",
				"terminal",
			},
			filetypes = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"Trouble",
				"trouble",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lazyterm",
			},
		},
	},
	main = "ibl",
}
