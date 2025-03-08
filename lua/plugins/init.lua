local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

if not (vim.uv or vim.loop).fs_stat(pckr_path) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/lewis6991/pckr.nvim",
    pckr_path,
  })
end

vim.opt.rtp:prepend(pckr_path)

require("pckr").add({
  {
    "slugbyte/lackluster.nvim",
    config = function()
      vim.cmd.colorscheme("lackluster")
    end,
  },
  {
    "mhartington/formatter.nvim",
    config = function()
      local util = require("formatter.util")
      require("formatter").setup({
        logging = true,
        filetype = {
          lua = {
            function()
              return {
                exe = "stylua",
                args = {
                  "--indent-width 2",
                  "--indent-type Spaces",
                  "--search-parent-directories",
                  "--stdin-filepath",
                  util.escape_path(util.get_current_buffer_file_path()),
                  "--",
                  "-",
                },
                stdin = true,
              }
            end,
          },
          typescript = {
            require("formatter.filetypes.typescript").prettierd,
          },
        },
      })

      vim.api.nvim_create_autocmd("BufWritePost", {
        callback = function()
          vim.cmd.FormatWrite()
        end,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local servers = {
        lua_ls = {},
        ts_ls = {},
      }

      local lspconfig = require("lspconfig")
      for server, config in pairs(servers) do
        lspconfig[server].setup(config)
      end
    end,
  },
  { "hrsh7th/cmp-nvim-lsp" },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
  {
    "eoh-bse/minintro.nvim",
    config = function()
      require("minintro").setup({ color = "#E9EAE9" })
    end,
  },
  { "ibhagwan/fzf-lua" },
  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
  },
  { "lervag/wiki.vim" },
})
