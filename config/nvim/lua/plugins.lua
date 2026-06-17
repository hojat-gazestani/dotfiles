require("lazy").setup({

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" }
  },
  
  
  {
    "OXY2DEV/markview.nvim",
      lazy = false,
      opts = {
        preview = {
          filetypes = { "markdown", "codecompanion" },
          ignore_buftypes = {},
        },
      },
  },
  
  {
    "HakonHarnes/img-clip.nvim",
    opts = {
      filetypes = {
        codecompanion = {
          prompt_for_file_name = false,
          template = "[Image]($FILE_PATH)",
          use_absolute_path = true,
        },
      },
    },
  },
  --  theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
  },

  --  telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  --  file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },

  --  treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate'
  },

  --  LSP support
  {
    "neovim/nvim-lspconfig",
  },

  {
    "williamboman/mason.nvim",
    config = true,
  },

  {
    "williamboman/mason-lspconfig.nvim",
  },

  --  autocomplete
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
  },

  --  git integration
  {
    "lewis6991/gitsigns.nvim",
    config = true,
  },

  --  statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true,
  },

  --  useful editor plugins
  "tpope/vim-commentary",
  "tpope/vim-surround",
  "tpope/vim-fugitive",

   --  code compoanion
  {
    "olimorris/codecompanion.nvim",
    version = "^19.0.0",
    opts = {
      adapters = {
        http = {
          qwen = function()
            return require("codecompanion.adapters").extend(
              "openai_compatible",
              {
                env = {
                  url = "http://saca-api.inside.sahab.ir:3100",
                  api_key = "sk-0EdNANfss1LiE5caKcCboQ",
                },
              }
            )
          end,
        },
      },

      strategies = {
        chat = { adapter = "qwen" },
        inline = { adapter = "qwen" },
        cmd = { adapter = "qwen" },
      },
    },
    dependencies = {
      "ravitemer/mcphub.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  }, 
})
