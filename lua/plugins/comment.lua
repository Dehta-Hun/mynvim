return {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
        require("Comment").setup({
            ignore = "^$",
            toggler = {
                line = " /",
            },
            opleader = {
                line = " /",
            },
        })
    end,
}
