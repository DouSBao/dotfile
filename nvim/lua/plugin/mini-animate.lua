local ok, animate = pcall(require, "mini.animate")
if not ok then
	vim.notify("'mini-animate.nvim' not found", "error", { title = "plugin missing" })
	return
end

animate.setup({
	-- Cursor path
    cursor = {
		-- Whether to enable this animation
		enable = true,

		-- Timing of animation (how steps will progress in time)
		-- timing = --<function: implements linear total 250ms animation duration>,
		-- Animate for 20 milliseconds with linear easing
		timing = animate.gen_timing.linear({ 
			duration = 20, 
			unit = 'total' 
		}),

		-- Path generator for visualized cursor movement
		-- path = --<function: implements shortest line path>,
		-- Animate with shortest line for any cursor move
		-- except in visual line mode
		path = animate.gen_path.line({
			predicate = function(destination) 
				return vim.fn.mode() ~= 'V'
			end,
		}),
    },

    -- Vertical scroll
    scroll = {
		-- Whether to enable this animation
		enable = true,

		-- Timing of animation (how steps will progress in time)
		-- timing = --<function: implements linear total 250ms animation duration>,

		-- Subscroll generator based on total scroll
		-- subscroll = --<function: implements equal scroll with at most 60 steps>,
    },

    -- Window resize
    resize = {
		-- Whether to enable this animation
		enable = true,

		-- Timing of animation (how steps will progress in time)
		-- timing = --<function: implements linear total 250ms animation duration>,

		-- Subresize generator for all steps of resize animations
		-- subresize = --<function: implements equal linear steps>,
    },

    -- Window open
    open = {
		-- Whether to enable this animation
		enable = true,

		-- Timing of animation (how steps will progress in time)
		-- timing = --<function: implements linear total 250ms animation duration>,

		-- Floating window config generator visualizing specific window
		-- winconfig = --<function: implements static window for 25 steps>,

		-- 'winblend' (window transparency) generator for floating window
		-- winblend = --<function: implements equal linear steps from 80 to 100>,
    },

    -- Window close
    close = {
		-- Whether to enable this animation
		enable = true,

		-- Timing of animation (how steps will progress in time)
		-- timing = --<function: implements linear total 250ms animation duration>,

		-- Floating window config generator visualizing specific window
		-- winconfig = --<function: implements static window for 25 steps>,

		-- 'winblend' (window transparency) generator for floating window
		-- winblend = --<function: implements equal linear steps from 80 to 100>,
    },
})
