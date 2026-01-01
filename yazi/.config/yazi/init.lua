require("git"):setup()

require("omp"):setup({ config = "/home/dazuki/.config/ohmyposh/dazuki.toml" })

require("full-border"):setup({
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.PLAIN,
})
