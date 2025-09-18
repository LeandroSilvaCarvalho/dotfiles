return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'williamboman/mason.nvim',
    },
    { 'williamboman/mason-lspconfig.nvim', version = '1.29.0' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'L3MON4D3/LuaSnip' },
    { 'elixir-tools/elixir-tools.nvim' },
    { 'mrcjkb/rustaceanvim', lazy = false },
    { 'luckasRanarison/tailwind-tools.nvim' },
  },
  config = function()
    local managed_servers_list = {
      'astro',
      'cssls',
      'docker_compose_language_service',
      'dockerls',
      'eslint',
      'html',
      'jsonls',
      'lua_ls',
      'pyright',
      'svelte',
      'volar',
      'yamlls',
      'vtsls',
    }

    local manual_servers_list = {
      'ocamllsp',
      'tailwindcss',
      'gleam',
      'prismals', -- Prisma ajouté ici
    }

    local servers_list = {}
    table.move(managed_servers_list, 1, #managed_servers_list, 1, servers_list)
    table.move(
      manual_servers_list,
      1,
      #manual_servers_list,
      #servers_list + 1,
      servers_list
    )

    require('mason').setup()
    require('mason-lspconfig').setup {
      ensure_installed = managed_servers_list,
      automatic_installation = false,
    }

    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lsp_config = require 'lspconfig'
    local utils = require 'lspconfig.util'

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
      }),
    }

    vim.diagnostic.config {
      float = {
        source = true,
        border = 'rounded',
      },
    }

    vim.keymap.set(
      'n',
      'ge',
      vim.diagnostic.open_float,
      { desc = 'open diagnostic popup' }
    )
    vim.keymap.set(
      'n',
      '[d',
      vim.diagnostic.goto_prev,
      { desc = 'Go to previous diagnostic' }
    )
    vim.keymap.set(
      'n',
      ']d',
      vim.diagnostic.goto_next,
      { desc = 'Go to next diagnostic' }
    )

    local border = {
      { '╭', 'FloatBorder' },
      { '─', 'FloatBorder' },
      { '╮', 'FloatBorder' },
      { '│', 'FloatBorder' },
      { '╯', 'FloatBorder' },
      { '─', 'FloatBorder' },
      { '╰', 'FloatBorder' },
      { '│', 'FloatBorder' },
    }

    local handlers = {
      ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = border,
      }),
    }

    local on_attach_callback = function(client, buffer)
      vim.keymap.set(
        'n',
        'gD',
        vim.lsp.buf.declaration,
        { desc = 'Go to declaration', buffer = buffer }
      )
      -- vim.keymap.set(
      --   'n',
      --   'gd',
      --   vim.lsp.buf.definition,
      --   { desc = 'Go to definition', buffer = buffer }
      -- )

      vim.keymap.set('n', 'gd', function()
        vim.lsp.buf_request(
          0,
          'textDocument/definition',
          vim.lsp.util.make_position_params(),
          function(_, result)
            if not result or vim.tbl_isempty(result) then
              vim.notify('No definition found', vim.log.levels.WARN)
              return
            end

            local location = vim.tbl_islist(result) and result[1] or result
            vim.lsp.util.jump_to_location(location, 'utf-8')
          end
        )
      end, { desc = 'Go to Definition (no quickfix)', buffer = buffer })
      vim.keymap.set(
        'n',
        'K',
        vim.lsp.buf.hover,
        { desc = 'Hover', buffer = buffer }
      )
      vim.keymap.set(
        'n',
        'gi',
        vim.lsp.buf.implementation,
        { desc = 'Go to implementation', buffer = buffer }
      )
      vim.keymap.set(
        'n',
        '<leader>rn',
        vim.lsp.buf.rename,
        { desc = 'Rename', buffer = buffer }
      )
      vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, { desc = 'List workspace folders', buffer = buffer })
      vim.keymap.set(
        'n',
        '<leader>D',
        vim.lsp.buf.type_definition,
        { desc = 'Go to type definition', buffer = buffer }
      )
      vim.keymap.set(
        { 'n', 'v' },
        '<leader>ca',
        vim.lsp.buf.code_action,
        { desc = 'Code action', buffer = buffer }
      )
      vim.keymap.set(
        'n',
        'gr',
        vim.lsp.buf.references,
        { desc = 'Check references', buffer = buffer }
      )
    end

    for _, value in pairs(servers_list) do
      local server = lsp_config[value]

      if value == 'prismals' then
        server.setup {
          capabilities = capabilities,
          on_attach = on_attach_callback,
          handlers = handlers,
          filetypes = { 'prisma' },
        }
      else
        server.setup {
          capabilities = capabilities,
          on_attach = on_attach_callback,
          handlers = handlers,
        }
      end
    end

    local elixir = require 'elixir'
    local elixirls = require 'elixir.elixirls'

    elixir.setup {
      nextls = {
        enable = false,
        on_attach = on_attach_callback,
        handlers = handlers,
        init_options = {
          mix_env = 'dev',
          mix_target = 'host',
          experimental = {
            completions = {
              enable = true,
            },
          },
        },
      },
      credo = {},
      elixirls = {
        enable = true,
        settings = elixirls.settings {
          dialyzerEnabled = false,
          enableTestLenses = false,
        },
        on_attach = on_attach_callback,
        handlers = handlers,
      },
    }

    lsp_config.tailwindcss.setup(vim.tbl_extend('force', {
      capabilities = capabilities,
      handlers = handlers,
    }, {
      filetypes = { 'html', 'elixir', 'eelixir', 'heex' },
      init_options = {
        userLanguages = {
          elixir = 'html-eex',
          eelixir = 'html-eex',
          heex = 'html-eex',
        },
      },
    }))

    vim.g.rustaceanvim = {
      server = {
        on_attach = on_attach_callback,
        handlers = handlers,
      },
    }
  end,
}
