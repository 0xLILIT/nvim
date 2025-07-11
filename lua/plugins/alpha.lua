return {
	"goolord/alpha-nvim",
	-- dependencies = { 'echasnovski/mini.icons' },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local startify = require("alpha.themes.startify")
		-- available: devicons, mini, default is mini
		-- if provider not loaded and enabled is true, it will try to use another provider
		startify.file_icons.provider = "devicons"
		require("alpha").setup(startify.config)
		local status_ok, alpha = pcall(require, "alpha")
		if not status_ok then
			return
		end

		local hlColor = "Mute"
		startify.section.header.val = {
			[[                                                                        ]],
			[[     ##### #     ##                                                     ]],
			[[  ######  /#    #### /                             #                    ]],
			[[ /#   /  / ##    ###/                             ###                   ]],
			[[/    /  /  ##    # #                  ##           #                    ]],
			[[    /  /    ##   #                    ##                                ]],
			[[   ## ##    ##   #    /##       /###   ##    ### ###   ### /### /###    ]],
			[[   ## ##     ##  #   / ###     / ###  / ##    ### ###   ##/ ###/ /##  / ]],
			[[   ## ##     ##  #  /   ###   /   ###/  ##     ### ##    ##  ###/ ###/  ]],
			[[   ## ##      ## # ##    ### ##    ##   ##      ## ##    ##   ##   ##   ]],
			[[   ## ##      ## # ########  ##    ##   ##      ## ##    ##   ##   ##   ]],
			[[   #  ##       ### #######   ##    ##   ##      ## ##    ##   ##   ##   ]],
			[[      /        ### ##        ##    ##   ##      ## ##    ##   ##   ##   ]],
			[[  /##/          ## ####    / ##    ##   ##      /  ##    ##   ##   ##   ]],
			[[ /  #####           ######/   ######     ######/   ### / ###  ###  ###  ]],
			[[/     ##             #####     ####       #####     ##/   ###  ###  ### ]],
			[[#                                                                       ]],
			[[ ##                                                                     ]],
			[[                                                                        ]],
		}
		-- startify.section.header.opts.hl = hlColor
		-- startify.section.footer.val = {
		-- 	{
		-- 		type = "text",
		-- 		val = { [[]], [["Nothing can happen till you swing the bat"]] },
		-- 		opts = {
		-- 			hl = hlColor,
		-- 		},
		-- 	},
		-- }
		alpha.setup(startify.opts)
	end,
}
