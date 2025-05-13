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
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "c",
          "cpp",
          "lua",
          "vim",
          "vimdoc",
          "javascript",
          "typescript",
          "css",
          "cpp",
          "html",
          "markdown",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    "mhartington/formatter.nvim",
    config = function()
      local util = require("formatter.util")
      require("formatter").setup({
        logging = true,
        filetype = {
          cpp = { require("formatter.filetypes.cpp").clangformat },
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
          javascript = {
            require("formatter.filetypes.javascript").prettierd,
          },
          html = { require("formatter.filetypes.html").prettierd },
          css = {
            require("formatter.filetypes.css").prettierd,
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
        lua_ls = {
          filetypes = { "lua" },
          settings = { Lua = { workspace = { library = {
            "${3rd}/love2d/library",
          } } } },
        },
        ts_ls = {},
        emmet_language_server = {},
        clangd = {},
        sqlls = { filetypes = { "sql", "javascript", "typescript" } },
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
  { "sindrets/diffview.nvim" },
  { "wellle/targets.vim" },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
  { "ibhagwan/fzf-lua" },
  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
  },
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({ preset = "helix" })
    end,
  },
  {
    "folke/persistence.nvim",
    config = function()
      require("persistence").setup()
    end,
  },
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").create_default_mappings()
    end,
    requires = { "tpope/vim-repeat" },
  },
  {
    "ggandor/flit.nvim",
    config = function()
      require("flit").setup()
    end,
  },
  { "HiPhish/rainbow-delimiters.nvim" },
  {
    "aliqyan-21/darkvoid.nvim",
    config = function()
      vim.cmd.colorscheme("darkvoid")
    end,
  },
  {
    "jiaoshijie/undotree",
    config = function()
      require("undotree").setup()
      -- Undotree
      vim.keymap.set("n", "<leader>uu", require("undotree").toggle, { noremap = true, silent = true })
    end,
    requires = {
      "nvim-lua/plenary.nvim",
    },
  },
})
