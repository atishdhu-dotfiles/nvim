local M = {}

M.treesitter = {
  ensure_installed = {
    "css",
    "dart",
    "diff",
    "dockerfile",
    "glimmer",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "regex",
    "ruby",
    "scss",
    "sql",
    "typescript",
    "vim",
    "yaml",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    "angular-language-server",
    "codespell",
    "cspell",
    "css-lsp",
    "deno",
    "docker-compose-language-service",
    "dockerfile-language-server",
    "ember-language-server",
    "erb-lint",
    "eslint-lsp",
    "fixjson",
    "grammarly-languageserver",
    "htmlbeautifier",
    "html-lsp",
    "js-debug-adapter",
    "json-lsp",
    "jsonlint",
    "lua-language-server",
    "markdownlint",
    "prettierd",
    "quick-lint-js",
    "rubocop",
    "ruby-lsp",
    "rubyfmt",
    "sql-formatter",
    "sqlfluff",
    "sqlfmt",
    "sqlls",
    "stylelint",
    "stylelint-lsp",
    "stylua",
    "textlint",
    "typesript-language-server",
    "yaml-language-server",
    "yamlfix",
    "yamlfmt",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.telescope = {
  defaults = {
    cache_picker = { num_pickers = 5 },
    mappings = {
      n = { ["<C-l>"] = false },
      i = { ["<C-l>"] = false },
    },
  },
}

return M
