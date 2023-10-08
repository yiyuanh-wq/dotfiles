local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- COLORSCHEMES

  -- Catppuccin
  { "catppuccin/nvim",     name = "catppuccin", priority = 1000 },

  -- Dracula
  { "Mofiqul/dracula.nvim" },

  -- Edge
  { "sainnhe/edge" },

  -- Everforest
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup({
        -- Your config here
      })
    end,
  },

  -- Github
  { "projekt0n/github-nvim-theme" },

  -- Gruvbox
  { "sainnhe/gruvbox-material",         priority = 1000 },

  -- Kanagawa
  { "rebelot/kanagawa.nvim",            priority = 1000 },

  -- Comment
  { "numToStr/Comment.nvim" },

  -- Gitsigns
  { "lewis6991/gitsigns.nvim" },

  -- Harpoon
  { "theprimeagen/harpoon" },

  -- Nord
  { "shaunsingh/nord.nvim" },

  -- Oxocarbon

  { "nyoom-engineering/oxocarbon.nvim", priority = 1000 },

  -- Rose Pine
  { "rose-pine/neovim",                 name = "rose-pine" },

  -- Solarized
  { "ishan9299/nvim-solarized-lua" },

  -- Sonokai
  { "sainnhe/sonokai" },

  -- Tokyo Night
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  -- VSCode
  { "Mofiqul/vscode.nvim" },

  -- USER PLUGINS

  -- Auto Pairs
  { "jiangmiao/auto-pairs" },

  -- LSP Signature
  { "ray-x/lsp_signature.nvim" },

  -- LSP Zero
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" }, -- Required
      {
        -- Optional
        "williamboman/mason.nvim",
        build = function()
          pcall(vim.cmd, "MasonUpdate")
        end,
      },
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },     -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "L3MON4D3/LuaSnip" },     -- Required
    },
  },

  -- Lualine
  { "nvim-lualine/lualine.nvim" },

  -- Numb
  { "nacro90/numb.nvim" },

  -- Plenary
  { "nvim-lua/plenary.nvim" },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    -- or                              , branch = '0.1.1',
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build =
    "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Trouble
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },

  -- Zen Mode
  { "folke/zen-mode.nvim" },
})
