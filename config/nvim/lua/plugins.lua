require("lazy").setup({

  -- code companion
  "olimorris/codecompanion.nvim",
  dependencies = {
    "ravitemer/mcphub.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
                

  require("codecompanion").setup({
      adapters = {
          http = {
          	qwen = function()
      	    return require("codecompanion.adapters").extend(
      		"openai_compatible",
      		{
                  	    env = {
      	    	        url = "http://saca-api.inside.sahab.ir:3100/v1",
      	    	        api_key = "sk-0EdNANfss1LiE5caKcCboQ",
                  	        chat_url = "/v1/chat/completions",
                  	        models_endpoint = "/v1/models",
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

    --opts = {
    --    -- Main model
    --    interactions = {
    --      chat = {
    --        adapter = "openai",
    --        model = "AliBaba/Qwen3.6-27B",
    --      },
    --      inline = {
    --        adapter = "openai",
    --        model = "AliBaba/Qwen3.6-27B",
    --      },
    --      cmd = {
    --        adapter = "openai",
    --        model = "AliBaba/Qwen3.6-27B",
    --      },
    --      background = {
    --        adapter = "openai",
    --        model = "AliBaba/Qwen3.6-27B",
    --      },
    --    },
    --    -- Adapter configuration
    --    adapters = {
    --      http = {
    --        openai = function()
    --          return require("codecompanion.adapters").extend("openai", {
    --            env = {
    --              api_key = "sk-0EdNANfss1LiE5caKcCboQ",
    --              url = "http://saca-api.inside.sahab.ir:3100/v1", 
    --            },
    --            -- Specific parameters for Qwen
    --            schema = {
    --              model = {
    --                default = "AliBaba/Qwen3.6-27B",
    --              },
    --              parameters = {
    --                -- Qwen-specific settings
    --                temperature = 0.7,
    --                max_tokens = 4096,
    --              },
    --            },
    --          })
    --        end,
    --      },
    --    },
    --    opts = {
    --      log_level = "DEBUG", 
    --      -- Optional: Configure how CodeCompanion interacts with your API
    --      api = {
    --        timeout = 60, -- Seconds
    --        --retry = {
    --        --  attempts = 3,
    --        --  delay = 2,
    --        --},
    --      },
    --    },
    --    -- Strategy for how CodeCompanion handles the model
    --    strategy = "chat", -- or "agent" for more complex tasks
    --  },
    --  config = function(_, opts)
    --    require("codecompanion").setup(opts)
    --  end,
    --},

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
  --  code compoanion
  {
    "olimorris/codecompanion.nvim",
    version = "^19.0.0",
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
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

})
