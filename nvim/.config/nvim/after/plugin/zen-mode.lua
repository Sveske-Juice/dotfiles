local zenmode = require("zen-mode");

zenmode.setup({
    backdrop = 0.95,

    options = {
        enables = true,
    },

    twilight = { enabled = true }
})

vim.keymap.set("n", "<leader>z", [[:ZenMode<CR>]], {desc="Toggle Zen Mode"})
