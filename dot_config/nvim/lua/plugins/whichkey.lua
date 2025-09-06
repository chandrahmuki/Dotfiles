return{

  {
    "folke/which-key.nvim",
    lazy = false,        -- force charge immédiat
    config = function(_, opts)
      require("which-key").setup(opts)
    end,
  },

}
