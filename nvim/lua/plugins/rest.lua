return {
	"mistweaverco/kulala.nvim",
	opts = {
		-- split_direction = "vertical",
		default_winbar_panes = { "body", "headers", "headers_body" },
		default_view = "body",
		winbar = true,
		default_env = "dev",
		contenttypes = {
			["application/json"] = {
				formatter = { "jq", "." },
			},
			-- Si quieres formatear también cuando el Content-Type es "text/json"
			["text/json"] = {
				formatter = { "jq", "." },
			},
		},
	},
}
