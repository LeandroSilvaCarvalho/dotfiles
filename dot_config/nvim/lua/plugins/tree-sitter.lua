return {
  "nvim-treesitter/nvim-treesitter",
  tag = "v0.9.2",
  dependencies = {
    { "windwp/nvim-ts-autotag", commit = "8515e48a277a2f4947d91004d9aa92c29fdc5e18" },
  },
  main = "nvim-treesitter.configs",
  opts = {
    auto_install = true,
    ensure_installed = {
      "lua",
      "javascript",
      "typescript",
      "css",
      "html",
      "elixir",
      "php",
      "go",
      "rust",
      "jsdoc",
      "json",
      "markdown",
      "sql",
      "toml",
      "yaml",
      "tsx",
      "vue",
      "svelte",
      "zig",
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    autotag = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  },
}
