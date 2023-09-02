local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- add breadcrumb on all buffers
-- autocmd({
--     -- "WinResized",
--     "BufWinEnter",
--     "CursorHold",
--     "InsertLeave",
--     "BufModifiedSet",
--   }, {
--     group = vim.api.nvim_create_augroup("barbecue.updater", {}),
--     callback = function()
--       require("barbecue.ui").update()
--     end,
-- })

-- lazygit
autocmd({
    "BufEnter",
  },{
    group = vim.api.nvim_create_augroup("lazigit.utils", {}),
    callback = function()
      require('lazygit.utils').project_root_dir()
    end,
  })

  