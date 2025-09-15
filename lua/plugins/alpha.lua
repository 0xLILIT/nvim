return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local startify = require("alpha.themes.startify")
		startify.file_icons.provider = "devicons"
		require("alpha").setup(startify.config)
		local status_ok, alpha = pcall(require, "alpha")
		if not status_ok then
			return
		end

		local version = vim.version()
		local version_string = "v"
			.. version.major
			.. "."
			.. version.minor
			.. "."
			.. version.patch
			.. "-"
			.. version.prerelease

		startify.section.header.val = {
			[[                                           ███                 ]],
			[[                                          ░░░                  ]],
			[[ ████████    ██████   ██████  █████ █████ ████  █████████████  ]],
			[[░░███░░███  ███░░███ ███░░███░░███ ░░███ ░░███ ░░███░░███░░███ ]],
			[[ ░███ ░███ ░███████ ░███ ░███ ░███  ░███  ░███  ░███ ░███ ░███ ]],
			[[ ░███ ░███ ░███░░░  ░███ ░███ ░░███ ███   ░███  ░███ ░███ ░███ ]],
			[[ ████ █████░░██████ ░░██████   ░░█████    █████ █████░███ █████]],
			[[░░░░ ░░░░░  ░░░░░░   ░░░░░░     ░░░░░    ░░░░░ ░░░░░ ░░░ ░░░░░ ]]
				.. " "
				.. version_string,
		}

		-- startify.section.header.val = {
		-- 	[[                                                                        ]],
		-- 	[[     ##### #     ##                                                     ]],
		-- 	[[  ######  /#    #### /                             #                    ]],
		-- 	[[ /#   /  / ##    ###/                             ###                   ]],
		-- 	[[/    /  /  ##    # #                  ##           #                    ]],
		-- 	[[    /  /    ##   #                    ##                                ]],
		-- 	[[   ## ##    ##   #    /##       /###   ##    ### ###   ### /### /###    ]],
		-- 	[[   ## ##     ##  #   / ###     / ###  / ##    ### ###   ##/ ###/ /##  / ]],
		-- 	[[   ## ##     ##  #  /   ###   /   ###/  ##     ### ##    ##  ###/ ###/  ]],
		-- 	[[   ## ##      ## # ##    ### ##    ##   ##      ## ##    ##   ##   ##   ]],
		-- 	[[   ## ##      ## # ########  ##    ##   ##      ## ##    ##   ##   ##   ]],
		-- 	[[   #  ##       ### #######   ##    ##   ##      ## ##    ##   ##   ##   ]],
		-- 	[[      /        ### ##        ##    ##   ##      ## ##    ##   ##   ##   ]],
		-- 	[[  /##/          ## ####    / ##    ##   ##      /  ##    ##   ##   ##   ]],
		-- 	[[ /  #####           ######/   ######     ######/   ### / ###  ###  ###  ]],
		-- 	[[/     ##             #####     ####       #####     ##/   ###  ###  ### ]],
		-- 	[[#                                                                       ]],
		-- 	[[ ##                                                                     ]],
		-- 	[[                                                                        ]],
		-- }
		alpha.setup(startify.opts)
	end,
}
