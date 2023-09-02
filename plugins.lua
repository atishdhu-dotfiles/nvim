local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- Session - https://github.com/rmagatti/auto-session
  {
    'rmagatti/auto-session',
    event = "VimEnter",
    config = function()
      require("auto-session").setup {
        -- log_level = 'debug',
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        auto_session_use_git_branch = false,
        auto_session_enable_last_session = true,
        auto_session_enabled = true,
        auto_session_create_enabled = true,
        auto_save_enabled = true,
        auto_restore_enabled = true,
        auto_session_session_name = 'Session.vim', -- Set the session file name (optional)

        -- Hooks
        pre_save_cmds = {
          -- Close NvimTree (auto-session may not restore nvimtree properly)
          "NvimTreeClose",
          "DiffviewClose",
          -- Close all floating windows
          function()
            local closed_windows = {}
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              local config = vim.api.nvim_win_get_config(win)
              if config.relative ~= "" then  -- is_floating_window?
                vim.api.nvim_win_close(win, false)  -- do not force
                table.insert(closed_windows, win)
              end
            end
          end
        },

        post_restore_cmds = {
          -- Open NvimTree
          "NvimTreeToggle",
        },
      }
    end,
  },

  -- Breadcrumb - https://github.com/utilyre/barbecue.nvim
  -- {
  --   "utilyre/barbecue.nvim",
  --   name = "barbecue",
  --   version = "*",
  --   dependencies = {
  --     "SmiteshP/nvim-navic",
  --     "nvim-tree/nvim-web-devicons", -- optional dependency
  --   },
  -- },

  -- Lazygit - https://github.com/kdheepak/lazygit.nvim
  {
    "kdheepak/lazygit.nvim",
    dependencies =  {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim"
    },
    config = function()
      require("telescope").load_extension("lazygit")
    end,
  },

  -- Telescope live-grep-args - https://github.com/nvim-telescope/telescope-live-grep-args.nvim
  {
    'nvim-telescope/telescope-live-grep-args.nvim',
  },

  -- Telescope vim-bookmarks - https://github.com/tom-anders/telescope-vim-bookmarks.nvim
  {
    "tom-anders/telescope-vim-bookmarks.nvim",
    config = function()
      require('telescope').load_extension('vim_bookmarks')
    end,
  },

  -- nvim-hlslens helps you better glance at matched information - https://github.com/kevinhwang91/nvim-hlslens
  {
    'kevinhwang91/nvim-hlslens',
    lazy = false,
    config = function()
      require('hlslens').setup {
        calm_down = true, -- If calm_down is true, clear all lens and highlighting When the cursor is out of the position range of the matched instance or any texts are changed
        nearest_only = true, -- Only add lens for the nearest matched instance and ignore others
      }
    end
  },

  -- A minimal typescript-language-server integration - https://github.com/jose-elias-alvarez/typescript.nvim
  {
    "jose-elias-alvarez/typescript.nvim",
    event = "LspAttach",
  },

  -- Translate text - https://github.com/potamides/pantran.nvim
  {
    "potamides/pantran.nvim",
    event = "VimEnter",
    config = function()
      require("pantran").setup {
        default_engine = "google",
        engines = {
          google = {
            fallback = {
              default_source = "auto",
              default_target = "fr"
            }
          },
        },
      }
    end
  },

  -- Highlights cursor words and lines - https://github.com/yamatsum/nvim-cursorline
  {
    "yamatsum/nvim-cursorline",
    event = 'BufWinEnter',
    config = function()
     require('nvim-cursorline').setup {
       cursorline = {
         enable = true,
         timeout = 1000,
         number = true,
       },
       cursorword = {
         enable = true,
         min_length = 3,
         hl = { underline = true },
       }
     } 
    end
   },
 
   -- Git blame - https://github.com/f-person/git-blame.nvim
   {
     'f-person/git-blame.nvim',
     event = 'VimEnter',
   },
 
   -- Neovim motions - https://github.com/phaazon/hop.nvim
   {
     'phaazon/hop.nvim',
     event = 'BufWinEnter',
     branch = 'v2', -- optional but strongly recommended
     config = function()
       require'hop'.setup { 
        keys = 'etovxqpdygfblzhckisuran',
        vim.cmd("hi HopNextKey guifg=#00E5AF"),
        vim.cmd("hi HopNextKey1 guifg=#FFFADE"),
        vim.cmd("hi HopNextKey2 guifg=#90D4BD"),
      }
     end
   },
 
   -- Tmux integration - https://github.com/aserowy/tmux.nvim
   {
     "aserowy/tmux.nvim",
     event = 'VimEnter',
     config = function()
       return require("tmux").setup()
     end
   },
 
   -- Auto close and auto rename html tag - https://github.com/windwp/nvim-ts-autotag
   {
     'windwp/nvim-ts-autotag',
     event = 'BufWinEnter',
     config = function()
       require('nvim-ts-autotag').setup()
     end
   },
 
  -- Improve buffer deletion - https://github.com/ojroques/nvim-bufdel
   {
     'ojroques/nvim-bufdel',
     event = 'BufWinEnter',
     config = function()
       require('bufdel').setup {
         quit = false,
       }
     end
   },

   -- Diff view - https://github.com/sindrets/diffview.nvim
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    config = function()
      require("diffview").setup({
        enhanced_diff_hl = true,
      })
    end
  },

  -- Add/change/delete surrounding delimiter pairs - https://github.com/kylechui/nvim-surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({})
    end
  },

  -- Better quickfix window in Neovim - https://github.com/kevinhwang91/nvim-bqf
  {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",
  },

  -- A pretty diagnostics, references, telescope results, quickfix and location list - https://github.com/folke/trouble.nvim
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
   },
   

  -- Snippet engine for Neovim - https://github.com/L3MON4D3/LuaSnip
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({
        include = { "json", "lua", "sql", "html", "typescript", "ruby", "rails" },
      })
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
    end
  },

  -- Improve neovim lsp experience - https://github.com/nvimdev/lspsaga.nvim
  {
    'nvimdev/lspsaga.nvim',
    event = "LspAttach",
    config = function()
        require('lspsaga').setup({})
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    }
  },

  -- Symbol outline - https://github.com/simrat39/symbols-outline.nvim
  {
    'simrat39/symbols-outline.nvim',
    event = "LspAttach",
    config = function()
      require("symbols-outline").setup()
    end,
  }
}

return plugins
