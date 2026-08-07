return {
  {
    "asperan/chstr.nvim",
    lazy = false,
    priority = 1000,
    dependencies = {
      "rktjmp/lush.nvim",
    },
    config = function()
      vim.cmd.colorscheme("chstr")
    end,
  },
}
