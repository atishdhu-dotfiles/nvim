---@type MappingsTable
local M = {}

-- In order to disable a default keymap, use
M.disabled = {
  n = {
    ["<leader>th"] = "", -- Nvchad themes
    ["<leader>fw"] = "", -- Live grep
    ["<leader>fo"] = "", -- Find oldfiles
    ["<leader>fb"] = "", -- Find buffers
    ["<leader>cm"] = "", -- Git commits
    ["<leader>gt"] = "", -- Git status,
    ["<leader>x"] = "",
    ["<A-h>"] = "", -- Horizontal Terminal
  },

  i = {
      ["<A-h>"] = "", -- Horizontal Terminal
  },
}

M.general = {
  n = {
    ["dd"] = { '"_dd', "Line delete without updating default register", opts = {noremap = true} },
    ["tx"] = { '"*yy"_dd', "Cuts line", opts = {noremap = true} },
    ["dw"] = { '"_dw', "Word delete without updating default register", opts = {noremap = true} },
    ["dW"] = { '"_dW', "Word delete without updating default register", opts = {noremap = true} },
    ["tw"] = { '"*yiwdw', "Cuts word" },
    ["tW"] = { '"*yiWdW', "Cuts word" },

    ["<Up>"] = { "" },
    ["<Down>"] = { "" },
    ["<Left>"] = { "" },
    ["<Right>"] = { "" },

    ["<C-Left>"] = { "" },
    ["<C-Right>"] = { "" },

    ["<A-h>"] = { "<C-w>h", "Window left" },
    ["<A-l>"] = { "<C-w>l", "Window right" },
    ["<A-j>"] = { "<C-w>j", "Window down" },
    ["<A-k>"] = { "<C-w>k", "Window up" },

    ["<C-d>"] = { "<C-d>z.", "Scroll forward center cursor" },
    ["<C-u>"] = { "<C-u>z.", "Scroll backward center cursor" },

    ["ZZ"] = { "<cmd> qa <CR>", "Quit nvim" },

    ["<C-z>"] = { ":undo <CR>", "Undo", opts = {noremap = true} },

    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    ["<leader>tc"] = { "<cmd> tabclose <CR>", "Close tab" },
    
    ["<leader>dd"] = { "<cmd> lua vim.diagnostic.disable() <CR>", "Disable diagnostics" },
    ["<leader>ed"] = { "<cmd> lua vim.diagnostic.enable() <CR>", "Enable diagnostics" },

    ["<C-]>"] = { "<cmd> HopLine <CR>", "HopLine" },
    ["<C-\\>"] = { "<cmd> HopAnywhere <CR>", "HopAnywhere" },

    ["<leader>11"] = {
      function()
        local file_type = vim.bo.filetype
        if file_type == 'ruby' then
          vim.api.nvim_put({
            "puts '*' * 100",
            "puts \" #{} \""
          }, '', true, true)
        elseif file_type == 'typescript' then
          vim.api.nvim_put({
            "console.log('');"
          }, '', true, true)
        elseif file_type == 'handlebars' then
          vim.api.nvim_put({
            "{{log ''}}"
          }, '', true, true)
        else
          print("Unknown filetype, mapping not defined.")
        end
      end,
      "Logger"
    },

    ["<leader>12"] = {
      function()
        local file_type = vim.bo.filetype
        if file_type == 'ruby' then
          vim.api.nvim_put({
            "sleep 1000",
          }, '', true, true)
        elseif file_type == 'typescript' then
          vim.api.nvim_put({
            "// eslint-disable-next-line ember/no-pause-test",
            "await this.pauseTest();"
          }, '', true, true)
        else
          print("Unknown filetype, mapping not defined.")
        end
      end,
      "Pause Test"
    },

    ["<leader>13"] = {
      function()
        local file_type = vim.bo.filetype
        if file_type == 'ruby' then
          vim.api.nvim_put({
            "puts '*' * 100",
            "puts caller"
          }, '', true, true)
        elseif file_type == 'typescript' then
          vim.api.nvim_put({
            "console.trace();"
          }, '', true, true)
        else
          print("Unknown filetype, mapping not defined.")
        end
      end,
      "Stacktrace"
    }
  },

  i = {
    ["<Up>"] = { "" },
    ["<Down>"] = { "" },
    ["<Left>"] = { "" },
    ["<Right>"] = { "" },

    ["<C-Left>"] = { "" },
    ["<C-Right>"] = { "" },

    ["<A-h>"] = { "<C-w>h", "Window left" },
    ["<A-l>"] = { "<C-w>l", "Window right" },
    ["<A-j>"] = { "<C-w>j", "Window down" },
    ["<A-k>"] = { "<C-w>k", "Window up" },

    ["<C-]>"] = { "<cmd> HopLine <CR>", "HopLine" },
    ["<C-\\>"] = { "<cmd> HopAnywhere <CR>", "HopAnywhere" },

    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },
    ["<C-z>"] = { "<C-o>u", "Undo", opts = {noremap = true} },
    ["<C-r>"] = { "<C-o><C-r>", "Redo", opts = {noremap = true} },
  },

  v = {
    ["<A-h>"] = { "<C-w>h", "Window left" },
    ["<A-l>"] = { "<C-w>l", "Window right" },
    ["<A-j>"] = { "<C-w>j", "Window down" },
    ["<A-k>"] = { "<C-w>k", "Window up" },

    ["<C-]>"] = { "<cmd> HopLine <CR>", "HopLine" },
    ["<C-\\>"] = { "<cmd> HopAnywhere <CR>", "HopAnywhere" },
  },

  t = {
    ["<M-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
  },
}

M.telescope = {
  n = {
    -- Files
    ["<leader>fb"] = { "<cmd> Telescope marks <CR>", "Bookmarks" },
    ["<leader>fc"] = { "<cmd> Telescope pickers <CR>", "Find pickers" },
    ["<leader>fg"] = { "<cmd> Telescope resume <CR>", "Resume" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help" },
    -- ["<leader>fm"] = { "<cmd> Telescope man_pages <CR>", "Man Pages" },
    ["<leader>fo"] = { "<cmd> Telescope buffers <CR>", "Find opened buffers" },
    ["<leader>fp"] = { "<cmd> Telescope registers <CR>", "Registers" },
    ["<leader>fr"] = { "<cmd> Telescope oldfiles <CR>", "Find recent files" },
    ["<leader>fw"] = { "<cmd> lua require('telescope').extensions.live_grep_args.live_grep_args() <CR>", "Live grep args" },
    
    -- LSP
    ["<leader>fs"] = { "<cmd> Telescope lsp_document_symbols <CR>", "Document Symbols" },
    ["<leader>fd"] = { "<cmd> Telescope diagnostics <CR>", "Diagnostics" },
    
    -- Theme
    ["<leader>ft"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },
  },
}

M.git = {
  n = {
    ["<leader>gb"] = { "<cmd> GitBlameOpenCommitURL <CR>", "Git Blame" },
    ["<leader>gd"] = { "<cmd> DiffviewOpen <CR>", "Open diff view" },
    ["<leader>gs"] = { "<cmd> lua require('telescope').extensions.lazygit.lazygit() <CR>", "Lazygit" },
    ["<leader>gh"] = { "<cmd> DiffviewFileHistory % <CR>", "Open diff view file history" },
  }
}

M.hlsens = {
  n = {
    ["n"] = { "<cmd> execute('normal! ' . v:count1 . 'n') <CR><Cmd> lua require('hlslens').start() <CR>", "Next search result" },
    ["N"] = { "<cmd> execute('normal! ' . v:count1 . 'N') <CR><Cmd> lua require('hlslens').start() <CR>", "Previous search result" },
  }
}

M.typescript = {
  n = {
    ["<leader>ti"] = { "<cmd> lua require('typescript').actions.addMissingImports() <CR>", "Add missing imports" },
    ["<leader>to"] = { "<cmd> lua require('typescript').actions.organizeImports() <CR>", "Organize imports" },
    ["<leader>tu"] = { "<cmd> lua require('typescript').actions.removeUnused() <CR>", "Remove unused variables" },
    ["<leader>ta"] = { "<cmd> lua require('typescript').actions.fixAll() <CR>", "Fix all" },
  }
}

M.lsp_saga = {
  n = {
    ["gn"] = { "<cmd> Lspsaga diagnostic_jump_next <CR>", "Jump to next diagnostics" },
    ["gp"] = { "<cmd> Lspsaga diagnostic_jump_prev <CR>", "Jump to previous diagnostics" },
    ["ga"] = { "<cmd> Lspsaga code_action <CR>", "Code action" },
    ["gf"] = { "<cmd> Lspsaga peek_definition <CR>", "Peek definition" },
    ["gh"] = { "<cmd> Lspsaga hover_doc <CR>", "Hover documentation" },
    ["gar"] = { "<cmd> Lspsaga rename <CR>", "LSP Rename" },
  },
}

M.symbol_outline = {
  n = {
    ["gs"] = { "<cmd> SymbolsOutline <CR>", "Open symbol outline" },
  },
}

M.pantran = {
  n = {
    ["<leader>tr"] = { ":Pantran <CR>", "Translate text" },
  }
}

M.buffdel = {
  n = {
    ["<leader>x"] = { ":BufDel <CR>", "Delete current buffer" },
    ["<leader>da"] = { ":BufDelAll <CR>", "Delete all buffers" },
    ["<leader>do"] = { ":BufDelOthers <CR>", "Delete all other buffers" },
  }
}

M.json = {
  n = {
    ["<leader>jp"] = {"<cmd> %!jq <CR>", "Prettify JSON"}
  }
}

return M
