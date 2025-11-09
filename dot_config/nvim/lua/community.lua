-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- Packs
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.elixir-phoenix" },
  { import = "astrocommunity.pack.eslint" },
  { import = "astrocommunity.pack.prettier" },
  { import = "astrocommunity.pack.astro" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.ruby" },
  { import = "astrocommunity.pack.toml" },

  -- Scrolling
  { import = "astrocommunity.scrolling.mini-animate" },

  -- Completion
  { import = "astrocommunity.completion.codex-nvim" },

  --Colorscheme
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },
  { import = "astrocommunity.colorscheme.catppuccin" },

  --Ai
  { import = "astrocommunity.recipes.ai" },
  { import = "astrocommunity.completion.supermaven-nvim" },
  -- import/override with your plugins folder
}
