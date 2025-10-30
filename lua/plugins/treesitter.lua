return{ 
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate", 
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "c", "cpp", "python", "lua", "bash", "json", "html", "cmake" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
