-- -------------------------------------------------------------------------- #
-- Neovim lua configuration
-- -------------------------------------------------------------------------- #

vim.opt.termguicolors = true

-- -------------------------------------------------------------------------- #
-- --------------------- symbols ------------------------------------------- #
-- -------------------------------------------------------------------------- #
-- vim.g.symbols_outline = {
--     highlight_hovered_item = true,
--     show_guides = true,
--     auto_preview = true,
--     position = 'right',
--     width = 25,
--     show_numbers = false,
--     show_relative_numbers = false,
--     show_symbol_details = true,
--     preview_bg_highlight = 'Pmenu',
--     keymaps = { -- These keymaps can be a string or a table for multiple keys
--         close = {"<Esc>", "q"},
--         goto_location = "<Cr>",
--         focus_location = "o",
--         hover_symbol = "<C-space>",
--         toggle_preview = "K",
--         rename_symbol = "r",
--         code_actions = "a",
--     },
--     lsp_blacklist = {},
--     symbol_blacklist = {},
--     symbols = {
--         File = {icon = "", hl = "TSURI"},
--         Module = {icon = "", hl = "TSNamespace"},
--         Namespace = {icon = "", hl = "TSNamespace"},
--         Package = {icon = "", hl = "TSNamespace"},
--         Class = {icon = "𝓒", hl = "TSType"},
--         Method = {icon = "ƒ", hl = "TSMethod"},
--         Property = {icon = "", hl = "TSMethod"},
--         Field = {icon = "", hl = "TSField"},
--         Constructor = {icon = "", hl = "TSConstructor"},
--         Enum = {icon = "ℰ", hl = "TSType"},
--         Interface = {icon = "ﰮ", hl = "TSType"},
--         Function = {icon = "", hl = "TSFunction"},
--         Variable = {icon = "", hl = "TSConstant"},
--         Constant = {icon = "", hl = "TSConstant"},
--         String = {icon = "𝓐", hl = "TSString"},
--         Number = {icon = "#", hl = "TSNumber"},
--         Boolean = {icon = "⊨", hl = "TSBoolean"},
--         Array = {icon = "", hl = "TSConstant"},
--         Object = {icon = "⦿", hl = "TSType"},
--         Key = {icon = "🔐", hl = "TSType"},
--         Null = {icon = "NULL", hl = "TSType"},
--         EnumMember = {icon = "", hl = "TSField"},
--         Struct = {icon = "𝓢", hl = "TSType"},
--         Event = {icon = "🗲", hl = "TSType"},
--         Operator = {icon = "+", hl = "TSOperator"},
--         TypeParameter = {icon = "𝙏", hl = "TSParameter"}
--     }
-- }

-- -------------------------------------------------------------------------- #
-- --------------------- Diffview ------------------------------------------- #
-- -------------------------------------------------------------------------- #
-- Lua
-- local cb = require'diffview.config'.diffview_callback
-- require'diffview'.setup {
  -- diff_binaries = false,    -- Show diffs for binaries
  -- file_panel = {
    -- width = 35,
    -- -- use_icons = true        -- Requires nvim-web-devicons
  -- },
  -- key_bindings = {
    -- disable_defaults = false,                   -- Disable the default key bindings
    -- -- The `view` bindings are active in the diff buffers, only when the current
    -- -- tabpage is a Diffview.
    -- view = {
      -- ["<tab>"]     = cb("select_next_entry"),  -- Open the diff for the next file
      -- ["<s-tab>"]   = cb("select_prev_entry"),  -- Open the diff for the previous file
      -- ["<leader>e"] = cb("focus_files"),        -- Bring focus to the files panel
      -- ["<leader>b"] = cb("toggle_files"),       -- Toggle the files panel.
    -- },
    -- file_panel = {
      -- -- ["j"]             = cb("next_entry"),         -- Bring the cursor to the next file entry
      -- -- ["<down>"]        = cb("next_entry"),
      --  ["k"]             = cb("prev_entry"),         -- Bring the cursor to the previous file entry.
      -- ["<up>"]          = cb("prev_entry"),
      -- ["<cr>"]          = cb("select_entry"),       -- Open the diff for the selected entry.
      -- ["o"]             = cb("select_entry"),
      -- ["<2-LeftMouse>"] = cb("select_entry"),
      -- ["-"]             = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
      -- ["S"]             = cb("stage_all"),          -- Stage all entries.
      -- ["U"]             = cb("unstage_all"),        -- Unstage all entries.
      -- ["R"]             = cb("refresh_files"),      -- Update stats and entries in the file list.
      -- ["<tab>"]         = cb("select_next_entry"),
      -- ["<s-tab>"]       = cb("select_prev_entry"),
      -- ["<leader>e"]     = cb("focus_files"),
      -- ["<leader>b"]     = cb("toggle_files"),
    -- }
  -- }
-- }


-- -------------------------------------------------------------------------- #
-- ----------------- \<qf_helper\> -------------------------------------------- #
-- -------------------------------------------------------------------------- #
require'qf_helper'.setup({
  -- prefer_loclist = true,       -- Used for QNext/QPrev (see Commands below)
  -- sort_lsp_diagnostics = true, -- Sort LSP diagnostic results
  -- quickfix = {
  --   autoclose = true,          -- Autoclose qf if it's the only open window
  --   default_bindings = true,   -- Set up recommended bindings in qf window
  --   default_options = true,    -- Set recommended buffer and window options
  --   max_height = 10,           -- Max qf height when using open() or toggle()
  --   min_height = 1,            -- Min qf height when using open() or toggle()
  --   track_location = 'cursor', -- Keep qf updated with your current location
  --                              -- Use `true` to update position as well
  -- },
  -- loclist = {                  -- The same options, but for the loclist
  --   autoclose = true,
  --   default_bindings = true,
  --   default_options = true,
  --   max_height = 10,
  --   min_height = 1,
  --   track_location = 'cursor',
  -- },
})


-- -------------------------------------------------------------------------- #
-- ----------------- spellsitter -------------------------------------------- #
-- -------------------------------------------------------------------------- #
-- require('spellsitter').setup()

---------------------------------------------------------------------------------
---- TELESCOPE
---- ----------------------------------------------------------------------------
local actions = require("telescope.actions")
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      -- '--smart-case'
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      }
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    theme = "dropdown",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "center",
    -- pickers = {
    --     git_files = {
    --       theme = "dropdown",
    --     }
    -- },
    layout_config = {
      -- horizontal = {
      --   prompt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_position = "top",
      --   preview_width = 0.55,
      --   results_width = 0.8,
      -- },
      -- vertical = {
      --   mirror = false,
      -- },
      -- vertical = {width = 0.94},
      width = 0.80,
      height = 0.80,
      preview_cutoff = 120,
    },
    -- file_sorter = require'telescope.sorters'.get_fuzzy_file,
    -- file_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
    -- file_sorter = require'telescope.sorters'.get_fzy_sorter,
    file_ignore_patterns = {
      '.pyc',
      '.pyi',
      'venv/.*',
      'site-packages/.*',
      'node_modules-packages'
    },
     path_display = { "truncate" },
    generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    -- width = 0.75,
    -- preview_cutoff = 120,
    -- results_height = 1,
    -- results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
      -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
    -- use_less = false,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
  }
}

-- -------------------------------------------------------------------------- #
--  ----------------- blankline indent -------------------------------------- #
-- -------------------------------------------------------------------------- #
require("indent_blankline").setup {
    -- space_char_blankline = " ",
    -- show_trailing_blankline_indent = false,
    show_current_context = true,
    -- show_current_context_start = false,
    -- show_end_of_line = false,
    -- use_treesitter = false,
    filetype_exclude = {
      "help",
      "terminal",
      "packer",
      "NvimTree",
      "startify"
    },
    buftype_exclude = { "terminal" },
}

-- -------------------------------------------------------------------------- #
--  ----------------- treesitter-context --------------------------------------- #
-- -------------------------------------------------------------------------- #
require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            'class',
            'function',
            'method',
            'for', -- These won't appear in the context
            'while',
            'if',
            'switch',
            'case',
        },
        -- Example for a specific filetype.
        -- If a pattern is missing, *open a PR* so everyone can benefit.
        --   rust = {
        --       'impl_item',
        --   },
    },
    exact_patterns = {
        -- Example for a specific filetype with Lua patterns
        -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
        -- exactly match "impl_item" only)
        -- rust = true,
    },

    -- [!] The options below are exposed but shouldn't require your attention,
    --     you can safely ignore them.

    zindex = 20, -- The Z-index of the context window
}

-- -------------------------------------------------------------------------- #
--  ----------------- kommentary -------------------------------------------- #
-- -------------------------------------------------------------------------- #
-- require('kommentary.config')
require('Comment').setup(
    -- toggler = {
    --     ---line-comment keymap
    --     line = 'cl',
    --     ---block-comment keymap
    --     block = 'cb',
    -- },
    -- opleader = {
    --     ---line-comment keymap
    --     line = 'cc',
    --     ---block-comment keymap
    --     block = 'gb',
    -- },
)

-- -------------------------------------------------------------------------- #
--  ----------------- lua snip ---------------------------------------------- #
-- -------------------------------------------------------------------------- #
local function prequire(...)
local status, lib = pcall(require, ...)
if (status) then return lib end
    return nil
end

local luasnip = prequire('luasnip')
local cmp = prequire("cmp")

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()

local ls = require "luasnip"
local types = require "luasnip.util.types"
ls.config.set_config {
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = false,

  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = "TextChanged,TextChangedI",

  -- Autosnippets:
  enable_autosnippets = false,

  -- Crazy highlights!!
  -- #vid3
  -- ext_opts = nil,
  -- ext_opts = {
  --   [types.choiceNode] = {
  --     active = {
  --       virt_text = { { " <- Current Choice", "NonTest" } },
  --     },
  --   },
  -- },
}

-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- <c-j> is my jump backwards key.
-- this always moves to the previous item within the snippet
vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes (introduced in the forthcoming episode 2)
vim.keymap.set("i", "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

vim.keymap.set("i", "<c-u>", require "luasnip.extras.select_choice")

-- shorcut to source my luasnips file again, which will reload my snippets
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")



-- -------------------------------------------------------------------------- #
--  ----------------- nvim-cmp ---------------------------------------------- #
-- -------------------------------------------------------------------------- #
local lsp_symbols = {
    Text = "   (Text) ",
    Method = "   (Method)",
    Function = "   (Function)",
    Constructor = "   (Constructor)",
    Field = " ﴲ  (Field)",
    Variable = "[] (Variable)",
    Class = "   (Class)",
    Interface = " ﰮ  (Interface)",
    Module = "   (Module)",
    Property = " 襁 (Property)",
    Unit = "   (Unit)",
    Value = "   (Value)",
    Enum = " 練 (Enum)",
    Keyword = "   (Keyword)",
    Snippet = "   (Snippet)",
    Color = "   (Color)",
    File = "   (File)",
    Reference = "   (Reference)",
    Folder = "   (Folder)",
    EnumMember = "   (EnumMember)",
    Constant = " ﲀ  (Constant)",
    Struct = " ﳤ  (Struct)",
    Event = "   (Event)",
    Operator = "   (Operator)",
    TypeParameter = "   (TypeParameter)",
}

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

local cmp = require'cmp'

cmp.setup({

  completion = {
    --completeopt = 'menu,menuone,noinsert',
  },

 -- snippet = {
 --      expand = function(args)
 --        require('luasnip').lsp_expand(args.body)
 --      end,
 --  },

  formatting = {
        format = function(entry, item)
            item.kind = lsp_symbols[item.kind]
            item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                -- luasnip = "[Snippet]",
                neorg = "[Neorg]",
            })[entry.source.name]

            return item
        end,
    },
  sources = {
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
      { name = 'path' },
      { name = 'luasnip' },
      -- { name = 'ultisnips' },
      { name = 'buffer', keyword_length=1 },
      { name = 'calc' },
    },

  experimental = {
      ghost_text = true,
  },

})

-- Require function for tab to work with LUA-SNIP
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
-- local luasnip = require("luasnip")


cmp.setup({
  -- documentation = {
  --   -- border = "rounded",
  --   winhighlight = "Normal:CmpDocumentation,FloatBorder:CmpDocumentationBorder",
  --   -- maxwidth = require('core.utils').fix_width(0, 0.9),
  --   -- maxheight = require('core.utils').fix_height(0, 0.9)
  -- },
  mapping = {
    -- ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    -- ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

   ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                -- elseif luasnip.expand_or_jumpable() then
                --   luasnip.expand_or_jump()
                elseif has_words_before() then
                  cmp.complete()
                else
                  fallback()
                end
              end, { "i", "s" }
    ),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                  luasnip.jump(-1)
                else
                  fallback()
                end
              end, { "i", "s" }
    ),

  }
})


-- -------------------------------------------------------------------------- #
--  ----------------- gps --------------------------------------------------- "
-- -------------------------------------------------------------------------- #
require("nvim-gps").setup()

-- -------------------------------------------------------------------------- #
-- -----------------< lsp >-------------------------------------------------- #
-- -------------------------------------------------------------------------- #
local lsp_installer = require("nvim-lsp-installer")

-- Provide settings first!
lsp_installer.settings {
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗",
        },
    },

    -- Limit for the maximum amount of servers to be installed at the same time. Once this limit is reached, any further
    -- servers that are requested to be installed will be put in a queue.
    max_concurrent_installers = 4,
}

local function make_server_ready(attach)
  lsp_installer.on_server_ready(function(server)
      local opts = {}
      opts.on_attach = attach

      -- for lua
      if server.name == "sumneko_lua" then
        -- only apply these settings for the "sumneko_lua" server
          opts.settings = {
            Lua = {
              diagnostics = {
                -- Get the language server to recognize the 'vim', 'use' global
                globals = {'vim', 'use', 'require'},
              },
              workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
              },
              -- Do not send telemetry data containing a randomized but unique identifier
              telemetry = {
                enable = false,
              },
            },
          }
      end

      -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
      server:setup(opts)
      vim.cmd [[ do User LspAttachBuffers ]]
  end)
end

local function install_server(server)
  local lsp_installer_servers = require'nvim-lsp-installer.servers'
  local ok, server_analyzer = lsp_installer_servers.get_server(server)
  if ok then
    if not server_analyzer:is_installed() then
      server_analyzer:install(server)   -- will install in background
      -- lsp_installer.install(server)     -- install window will popup
    end
  end
end

local servers = {
  "sumneko_lua",        -- for Lua
  "pyright",            -- for Python
  "pylsp",            -- for Python
  "vimls",            -- for Python
  "clangd",             -- for C/C++
  "bashls",             -- for Bash
  "jsonls",             -- for Bash
  "sqlls",             -- for Bash
}

local On_attach = function(client, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'ga', '<cmd>lua vim.diagnostic.open_float()<CR>',  opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<Leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gv', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap("n", "<space>f", '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  -- code action is integrated with telescope, for more see "telescope.lua" file
  -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workleader_folder()<CR>', opts)
  -- buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workleader_folder()<CR>', opts)
  -- buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workleader_folders()))<CR>', opts)
end

-- setup the LS
require "lspconfig"
make_server_ready(On_attach)    -- LSP mappings

-- install the LS
for _, server in ipairs(servers) do
  install_server(server)
end

-- local nvim_lsp=require('lspconfig')
local on_attach=function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	-- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
	-- Mappings.
	local opts={noremap=true, silent=true }
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	-- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	-- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', 'gv', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	-- buf_set_keymap('n', 'gwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	-- buf_set_keymap('n', 'gwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	-- buf_set_keymap('n', 'gwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	-- buf_set_keymap('n', 'gv', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	-- buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	-- buf_set_keymap('n', 'gra', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', 'ga', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '<Leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	-- buf_set_keymap("n", "<Leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- local coq = require("coq")
-- nvim_lsp.pyright.setup(coq.lsp_ensure_capabilities())

-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- nvim_lsp.pyright.setup{
--     capabilities = capabilities
-- }
-- nvim_lsp.cmake.setup{
--     capabilities = capabilities
-- }

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    signs = true,
    update_in_insert = false,
    -- virtual_text = {true},
  }
)
vim.diagnostic.config({
  virtual_text = false,
})

-- show diagnostic on float window(like auto complete)
-- vim.api.nvim_command [[ autocmd CursorHold  *.lua,*.sh,*.bash,*.dart,*.py,*.cpp,*.c,js lua vim.lsp.diagnostic.show_line_diagnostics() ]]

-- se LSP diagnostic symbols/signs
--─────────────────────────────────────────────────--
vim.api.nvim_command [[ sign define DiagnosticSignError text=✗ texthl=DiagnosticSignError linehl= numhl= ]]
vim.api.nvim_command [[ sign define DiagnosticSignWarn  text=⚠ texthl=DiagnosticSignWarn  linehl= numhl= ]]
vim.api.nvim_command [[ sign define DiagnosticSignInfo  text= texthl=DiagnosticSignInfo  linehl= numhl= ]]
vim.api.nvim_command [[ sign define DiagnosticSignHint  text= texthl=DiagnosticSignHint  linehl= numhl= ]]

-- vim.api.nvim_command [[ hi DiagnosticUnderlineError cterm=underline gui=underline guisp=#840000]]
-- vim.api.nvim_command [[ hi DiagnosticUnderlineHint cterm=underline  gui=underline guisp=#17D6EB ]]
-- vim.api.nvim_command [[ hi DiagnosticUnderlineWarn cterm=underline  gui=underline guisp=#2f2905 ]]

-- Auto-format files prior to saving them
--vim.api.nvim_command[[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)]]

--[[
   " to change colors, it's better to define in color scheme
   " highlight LspDiagnosticsUnderlineError         guifg=#EB4917 gui=undercurl
   " highlight LspDiagnosticsUnderlineWarning       guifg=#EBA217 gui=undercurl
   " highlight LspDiagnosticsUnderlineInformation   guifg=#17D6EB gui=undercurl
   " highlight LspDiagnosticsUnderlineHint          guifg=#17EB7A gui=undercurl
--]]

-- -------------------------------------------------------------------------- #
--  ----------------- lsp signature ----------------------------------------- #
-- -------------------------------------------------------------------------- #
-- cfg = {
--   bind = true, -- This is mandatory, otherwise border config won't get registered.
--                -- If you want to hook lspsaga or other signature handler, pls set to false
--   doc_lines = 2, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
--                  -- set to 0 if you do not want any API comments be shown
--                  -- This setting only take effect in insert mode, it does not affect signature help in normal
--                  -- mode
--
--   hint_enable = true, -- virtual hint enable
--   hint_prefix = "",  -- Panda for parameter
--   hint_scheme = "String",
--   use_lspsaga = true,  -- set to true if you want to use lspsaga popup
--   handler_opts = {
--     border = "shadow"   -- double, single, shadow, none
--   },
--   decorator = {"`", "`"}  -- decoractor can be `decorator = {"***", "***"}`  `decorator = {"**", "**"}` `decorator = {"**_", "_**"}`
--                           -- `decorator = {"*", "*"} see markdown help for more details
--                           -- <u></u> ~ ~ does not supported by nvim
--
-- }
-- require'lsp_signature'.on_attach(cfg)


-- -------------------------------------------------------------------------- #
--  ----------------- lightspeed -------------------------------------------- "
-- -------------------------------------------------------------------------- #

require'lightspeed'.setup {
  ignore_case = true,
  repeat_ft_with_target_char = true,
  -- exit_after_idle_msecs = { unlabeled = 500, labeled = nil },

}

-- -------------------------------------------------------------------------- #
-- trouble ------------------------------------------------------------------ #
-- -------------------------------------------------------------------------- #
require("trouble").setup {
	-- position = 'right',
	-- keymaps = {
		-- position = "bottom", -- position of the list can be: bottom, top, left, right
		-- height = 10, -- height of the trouble list when position is top or bottom
    -- width = 50, -- width of the list when position is left or right
    -- icons = true, -- use devicons for filenames
    -- mode = "lsp_workspace_diagnostics", -- "lsp_workspace_diagnostics", "lsp_document_diagnostics", "quickfix", "lsp_references", "loclist"
    -- fold_open = "", -- icon used for open folds
    -- fold_closed = "", -- icon used for closed folds
    -- action_keys = { -- key mappings for actions in the trouble list
    --     close = "q", -- close the list
    --     cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
    --     refresh = "r", -- manually refresh
    --     jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
    --     open_split = { "x" }, -- open buffer in new split
    --     open_vsplit = { "v" }, -- open buffer in new vsplit
    --     open_tab = { "t" }, -- open buffer in new tab
    --     jump_close = {"o"}, -- jump to the diagnostic and close the list
    --     toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
    --     toggle_preview = "P", -- toggle auto_preview
    --     hover = "K", -- opens a small poup with the full multiline message
    --     preview = "p", -- preview the diagnostic location
    --     close_folds = {"zM", "zm"}, -- close all folds
    --     open_folds = {"zR", "zr"}, -- open all folds
    --     toggle_fold = {"zA", "za"}, -- toggle fold of current file
    --     previous = "k", -- preview item
    --     next = "j" -- next item
    -- },
    -- indent_lines = true, -- add an indent guide below the fold icons
    -- auto_open = false, -- automatically open the list when you have diagnostics
    -- auto_close = false, -- automatically close the list when you have no diagnostics
    auto_preview = false, -- automatyically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_fold = true, -- automatically fold a file trouble list at creation
    -- use_lsp_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
	-- },
    -- lsp_blacklist = {}
}

-- -------------------------------------------------------------------------- #
-- ---------------- colorizer ----------------------------------------------- #
-- -------------------------------------------------------------------------- #
require('colorizer').setup()


-------------------------------------------------------------------------------
-- LUA TREE
-- ----------------------------------------------------------------------------
require'nvim-tree'.setup {
  -- disables netrw completely
  disable_netrw       = true,
  -- hijack netrw window on startup
  hijack_netrw        = true,
  -- open the tree when running this setup function
  open_on_setup       = false,
  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup  = {},
  -- closes neovim automatically when the tree is the last **WINDOW** in the view
  auto_close          = false,
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab         = false,
  -- hijacks new directory buffers when they are opened.
  update_to_buf_dir   = {
    -- enable the feature
    enable = true,
    -- allow to open the tree if it was previously closed
    auto_open = true,
  },
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor       = false,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd          = false,
  -- show lsp diagnostics in the signcolumn

  diagnostics = {
    enable = false,
  },
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable      = true,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd  = ture,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {
      '.git',
      'node_modules',
      '.cache',
      '.pyc',
      '__pycache__',
      '.DS_Store',
      'tags',
      '.idea',
      '.sass-cache',
      '.aux',
      '.fls',
      '.log',
      '.nav',
      '.out',
      '.snm',
      '.synctex.gz',
      '.toc',
      '.vrb'
    }
  },
  -- configuration options for the system open command (`s` in the tree by default)
  -- system_open = {
    -- the command to run this, leaving nil should work in most cases
    -- cmd  = nil,
    -- the command arguments as a list
    -- args = {}
  -- },
  view = {
    -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
    width = 30,
    -- height of the window, can be either a number (columns) or a string in `%`, for top or bottom side placement
    -- height = 30,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    -- if true the tree will resize itself after opening a file
    auto_resize = true,
    -- mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      -- custom_only = false,
      -- list of mappings to set on the tree manually
      -- list = {}
    }
}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local list = {
  { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
  { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
  { key = "v",                        cb = tree_cb("vsplit") },
  { key = "i",                        cb = tree_cb("split") },
  { key = "t",                        cb = tree_cb("tabnew") },
  { key = "<",                            cb = tree_cb("prev_sibling") },
  { key = ">",                            cb = tree_cb("next_sibling") },
  { key = "P",                            cb = tree_cb("parent_node") },
  { key = "<BS>",                         cb = tree_cb("close_node") },
  { key = "<S-CR>",                       cb = tree_cb("close_node") },
  { key = "<Tab>",                        cb = tree_cb("preview") },
  { key = "K",                            cb = tree_cb("first_sibling") },
  { key = "J",                            cb = tree_cb("last_sibling") },
  { key = "I",                            cb = tree_cb("toggle_ignored") },
  { key = "H",                            cb = tree_cb("toggle_dotfiles") },
  { key = "R",                            cb = tree_cb("refresh") },
  { key = "a",                            cb = tree_cb("create") },
  { key = "d",                            cb = tree_cb("remove") },
  { key = "r",                            cb = tree_cb("rename") },
  { key = "<C-r>",                        cb = tree_cb("full_rename") },
  { key = "x",                            cb = tree_cb("cut") },
  { key = "c",                            cb = tree_cb("copy") },
  { key = "p",                            cb = tree_cb("paste") },
  { key = "y",                            cb = tree_cb("copy_name") },
  { key = "Y",                            cb = tree_cb("copy_path") },
  { key = "gy",                           cb = tree_cb("copy_absolute_path") },
  { key = "[c",                           cb = tree_cb("prev_git_item") },
  { key = "]c",                           cb = tree_cb("next_git_item") },
  { key = "-",                            cb = tree_cb("dir_up") },
  { key = "s",                            cb = tree_cb("system_open") },
  { key = "q",                            cb = tree_cb("close") },
  { key = "g?",                           cb = tree_cb("toggle_help") },
}

-- -------------------------------------------------------------------------- #
-- ----------------- ayu ---------------------------------------------------- #
-- -------------------------------------------------------------------------- #
require('ayu').setup({
  mirage=true,
  overrides = {
    Comment = {fg = '#707A8C'},
    String = {fg = '#E6BA7E'},
    LineNr = {fg = '#465742'},
    CursorLineNr = {fg = '#E6BA7E', bg = '#0D1016'},
    -- Search = {fg = '#7CB0E6', bg = '#33415E'},
    Search = {fg = '#0D1016', bg = '#707A8C'},
    -- IncSearch = {fg = '#E6BA7E', bg = '#0D1016'},
  }
})

-- -------------------------------------------------------------------------- #
-- ----------------- kanagawa ---------------------------------------------------- #
-- -------------------------------------------------------------------------- #
require('kanagawa').setup({
    undercurl = true,           -- enable undercurls
    -- commentStyle = "italic",
    -- functionStyle = "NONE",
    -- keywordStyle = "italic",
    -- statementStyle = "bold",
    -- typeStyle = "NONE",
    -- variablebuiltinStyle = "italic",
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords
    transparent = true,        -- do not set background color
    colors = {},
    overrides = {
      -- override existing hl-groups, the new keywords are merged with existing ones
      VertSplit  = {
        -- fg = '#2D4F67',
        fg = '#2A2A37',
        bg = "NONE"
      },
      Search = {bg = '#33415E'},
      -- CursorLine = {bg = '#1F1F28'},
      -- ColorColumn = {bg = '#0F0F14'},
      -- StatusLine = {bg = '#0F0F14'},
    },
})

-- setup must be called before loading
-- vim.cmd("colorscheme kanagawa")

-- -------------------------------------------------------------------------- #
-- ----------------- material ----------------------------------------------- #
-- -------------------------------------------------------------------------- #

-- -- ----------------- theme -------------------------------------------------- #
-- require('material').setup({
        -- contrast = true, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree
        -- borders = true, -- Enable borders between verticaly split windows
        -- popup_menu = "dark", -- Popup menu style ( can be: 'dark', 'light', 'colorful' or 'stealth' )
        -- italics = {
                -- comments = false, -- Enable italic comments
                -- keywords = true, -- Enable italic keywords
                -- functions = false, -- Enable italic functions
                -- strings = false, -- Enable italic strings
                -- variables = false -- Enable italic variables
        -- },
        -- text_contrast = {
                -- lighter = true, -- Enable higher contrast text for lighter style
                -- darker = true -- Enable higher contrast text for darker style
        -- },
        -- disable = {
                -- background = true, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
                -- term_colors = false, -- Prevent the theme from setting terminal colors
                -- eob_lines = false -- Hide the end-of-buffer lines
        -- },
        -- custom_highlights = {
                -- CursorLine = '#0000FF',
                -- LineNr = '#0000FF'
            -- line_numbers = '#0000FF'
        -- }
-- })

-- ----------------- git-worktree ------------------------------------------- #
-- require("git-worktree").setup({
--     -- update_on_change = <boolean> -- default: true,
--     -- update_on_change_command = <str> -- default: "e .",
--     -- clearjumps_on_change = <boolean> -- default: true,
--     autopush = false
-- })

-- ----------------- git-sign ----------------------------------------------- #
require('gitsigns').setup()
-- require('gitsigns').setup {
  -- signs = {
  --   add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
  --   change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  --   delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
  --   topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
  --   changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  -- },
  -- numhl = false,
  -- linehl = false,
  -- keymaps = {
  --   -- Default keymap options
  --   noremap = true,

  --   ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
  --   ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},

  --   ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
  --   ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
  --   ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
  --   ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
  --   ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
  --   ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
  --   ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
  --   ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',

  --   -- Text objects
  --   ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
  --   ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
  -- },
  -- watch_index = {
  --   interval = 1000,
  --   follow_files = true
  -- },
  -- current_line_blame = false,
  -- current_line_blame_delay = 1000,
  -- current_line_blame_position = 'eol',
  -- sign_priority = 6,
  -- update_debounce = 100,
  -- status_formatter = nil, -- Use default
  -- word_diff = false,
  -- use_decoration_api = true,
  -- use_internal_diff = true,  -- If luajit is present
-- }

-- -------------------------------------------------------------------------- #
-- ----------------- \<igs\> -------------------------------------------- #
-- -------------------------------------------------------------------------- #
-- require('igs').setup {
--   debug = false, -- print debug logs
--   log_level = "info", -- log level for igs
--   run_copen = true, -- run copen after qf commands
--   default_mappings = false, -- set default mappings
-- }

-- -------------------------------------------------------------------------- #
-- ----------------- \<windline\> -------------------------------------------- #
-- -------------------------------------------------------------------------- #
-- require('wlsample.mybubble')
-- require('wlsample.bubble')
local windline = require('windline')
local helper = require('windline.helpers')
local sep = helper.separators
local vim_components = require('windline.components.vim')

local b_components = require('windline.components.basic')
local state = _G.WindLine.state

local lsp_comps = require('windline.components.lsp')
local git_comps = require('windline.components.git')

local hl_list = {
    Inactive = { 'InactiveFg', 'InactiveBg' },
    Active = { 'ActiveFg', 'ActiveBg' },
}
local basic = {}

basic.divider = { b_components.divider, '' }
basic.file_name_inactive = { b_components.full_file_name, hl_list.Inactive }
basic.line_col_inactive = { b_components.line_col, hl_list.Inactive }
basic.progress_inactive = { b_components.progress, hl_list.Inactive }

basic.file = {
    name = 'file',
    hl_colors = {
        sep_before = { 'NormalFg', 'ActiveBg' },
        sep_after = { 'NormalFg', 'ActiveBg' },
        text = { 'ActiveBg', 'NormalFg' },
    },
    text = function()
        return {
            { sep.left_rounded, 'sep_before' },
            {b_components.cache_file_icon({ default = '' }), 'text'},
            { ' ', 'text' },
            { b_components.cache_file_name('[No Name]', 'text') },
            { b_components.file_modified(' ')},
            { sep.right_rounded, 'sep_after'},
        }
    end,
    width = 150,
}
basic.file_inac = {
    name = 'file',
    hl_colors = {
        text = { 'NormalFg', 'ActiveBg' },
    },
    text = function()
        return {
            { b_components.cache_file_name('[No Name]', 'text') },
            { b_components.file_modified(' ')},
        }
    end,
}
basic.gps = {
    name = 'gps',
    hl_colors = {
        sep_before = { 'magenta_light', 'ActiveBg' },
        sep_after = { 'magenta_light', 'ActiveBg' },
        text = { 'ActiveBg', 'magenta_light' },
    },
    text = function()
      if require("nvim-gps").is_available() then
        if (require("nvim-gps").get_location() == "") then
          return { }
        else
          return {
            { sep.left_rounded, 'sep_before' },
            {require("nvim-gps").get_location(), 'text'},
            { sep.right_rounded, 'sep_after'},
          }
        end
      else
        return { }
      end
    end
}
basic.tabe = {
    name = 'gps',
    hl_colors = {
        sep_before = { 'yellow', 'ActiveBg' },
        sep_after = { 'yellow', 'ActiveBg' },
        text = { 'ActiveBg', 'yellow' },
    },
    text = function()
      return {
        { sep.left_rounded, 'sep_before' },
        {"Tab " .. vim.fn.tabpagenr() .. '/' .. vim.fn.tabpagenr('$'), 'text' },
        { sep.right_rounded, 'sep_after'},
      }
    end
}
basic.git_branch = {
    name = 'gps',
    hl_colors = {
        sep_after = { 'NormalFg', 'ActiveBg' },
    },
    text = function()
      return {
        { git_comps.git_branch({ icon = '  ' }), { 'green', 'ActiveBg' }, 90 },
      }
    end,
    width = 150,
}


local default = {
    filetypes = { 'default' },
    active = {
        { ' ', 'ActiveBg' },
        basic.tabe,
        { ' ', 'ActiveBg' },
        basic.gps,
        { ' ', 'ActiveBg' },
        basic.divider,
        basic.file,
        basic.git_branch,
        { ' ', 'ActiveBg' },
        { ' ', 'ActiveBg' },
    },
    inactive = {
        basic.file_inac,
        basic.divider,
    },
}

local quickfix = {
    filetypes = { 'qf', 'Trouble' },
    active = {
        { ' Quickfix ', { 'NormalFg', 'ActiveBg' } },
        { sep.left_rounded, { 'NormalFg', 'ActiveBg' } },
        {
            function()
                return vim.fn.getqflist({ title = 0 }).title
            end,
            { 'ActiveBg', 'NormalFg' },
        },
        { ' Total : %L ', { 'ActiveBg', 'NormalFg' } },
        { sep.right_rounded, { 'NormalFg', 'ActiveBg' } },
        { ' ', { 'NormalFg', 'ActiveBg' } },
        basic.divider,
    },
    always_active = true,
    show_last_status = true
}

local explorer = {
    filetypes = { 'fern', 'NvimTree', 'lir' },
    active = {
        { b_components.divider, '' },
        { b_components.file_name(''), { 'NormalFg', 'ActiveBg' } },
    },
    always_active = true,
    show_last_status = true
}

windline.setup({
    colors_name = function(colors)
        -- ADD MORE COLOR HERE ----
        return colors
    end,
    statuslines = {
        default,
        explorer,
        quickfix,
    },
})


-- -------------------------------------------------------------------------- #
--  ----------------- comment box -------------------------------------------- "
-- -------------------------------------------------------------------------- #
require('comment-box').setup({
	-- doc_width = 80, -- width of the document
	-- box_width = 60, -- width of the boxes
  outer_blank_lines = true, -- insert a blank line above and below the box
  inner_blank_lines = false, -- insert a blank line above and below the text
})

-- -------------------------------------------------------------------------- #
--  ----------------- cokeline -------------------------------------------- "
-- -------------------------------------------------------------------------- #
local get_hex = require('cokeline/utils').get_hex
--
require('cokeline').setup({
  default_hl = {
    -- bg = get_hex('Normal', 'fg'),
    -- bg = get_hex('Normal', 'fg'),
    -- fg = "#0F0F14",
    bg = "#1F2430",
--    focused = {
--    },
--    unfocused = {
--      fg = get_hex('Comment', 'fg'),
--      bg = "none",
--    },
  },

  components = {
    {
      text = '',
      -- hl = {
      fg = function(buffer)
          if (buffer.is_focused and buffer.is_modified) then
              return "#BAE67E"
          elseif buffer.is_focused then
              return "#CBCCC6"
          elseif (not buffer.is_focused and buffer.is_modified) then
              return "#575F66"
          else
              return "#0F0F14"
          end
      end,
      bg = function(buffer)
          if buffer.is_focused then
              return "#0F0F14"
          else
              return "#0F0F14"
          end
          if buffer.is_modified then
              return "#BAE67E"
          end
      end,
      -- },
    },
    {
      text = function(buffer)
        if (buffer.index == 1) then return     ' ' .. "q" .. ':'
        elseif (buffer.index == 2) then return ' ' .. "w" .. ':'
        elseif (buffer.index == 3) then return ' ' .. "e" .. ':'
        elseif (buffer.index == 4) then return ' ' .. "r" .. ':'
        elseif (buffer.index == 5) then return ' ' .. "t" .. ':'
        elseif (buffer.index == 6) then return ' ' .. "y" .. ':'
        elseif (buffer.index == 7) then return ' ' .. "u" .. ':'
        elseif (buffer.index == 8) then return ' ' .. "i" .. ':'
        elseif (buffer.index == 9) then return ' ' .. "o" .. ':'
        else return ' ' .. buffer.index .. ': '
        end
      end,

      -- hl = {
      bg = function(buffer)
          if (buffer.is_focused and buffer.is_modified) then
              return "#BAE67E"
          elseif buffer.is_focused then
              return "#CBCCC6"
          elseif (not buffer.is_focused and buffer.is_modified) then
              return "#575F66"
          else
              return "#0F0F14"
          end
      end,
      fg = function(buffer)
          if buffer.is_focused then
              return "#0F0F14"
          elseif (not buffer.is_focused and buffer.is_modified) then
              return "#BAE67E"
          else
              return "#707A8C"
          end
          if buffer.is_modified then
              return "#BAE67E"
          end
      end,
      -- },
    },
    {
      text = function(buffer) return buffer.unique_prefix end,
      -- hl = {
      bg = function(buffer)
          if buffer.is_modified then
              return "#BAE67E"
          elseif buffer.is_focused then
              return "#CBCCC6"
          else
              return "#0F0F14"
          end
      end,
      fg = function(buffer)
          if buffer.is_focused then
              return "#0F0F14"
          elseif (not buffer.is_focused and buffer.is_modified) then
              return "#BAE67E"
          else
              return "#707A8C"
          end
          if buffer.is_modified then
              return "#BAE67E"
          end
      end,
      -- },
    },
    {
      text = function(buffer)
          return buffer.filename .. ' '
      end,
      -- hl = {
      bg = function(buffer)
          if (buffer.is_focused and buffer.is_modified) then
              return "#BAE67E"
          elseif buffer.is_focused then
              return "#CBCCC6"
          elseif (not buffer.is_focused and buffer.is_modified) then
              return "#575F66"
          else
              return "#0F0F14"
          end
      end,
      fg = function(buffer)
          if buffer.is_focused then
              return "#0F0F14"
          elseif (not buffer.is_focused and buffer.is_modified) then
              return "#BAE67E"
          else
              return "#707A8C"
          end
          if buffer.is_modified then
              return "#BAE67E"
              end
      end,
      -- }
    },
    {
      text = function(buffer)
        if buffer.is_readonly then
          return "[🔒] "
        end
        if buffer.is_modified then
          return "[+] "
        end
          return ""
      end,
      -- hl = {
      bg = function(buffer)
          if (buffer.is_focused and buffer.is_modified) then
              return "#BAE67E"
          elseif buffer.is_focused then
              return "#CBCCC6"
          elseif (not buffer.is_focused and buffer.is_modified) then
              return "#575F66"
          else
              return "#0F0F14"
          end
      end,
      fg = function(buffer)
          if buffer.is_focused then
              return "#0F0F14"
          elseif (not buffer.is_focused and buffer.is_modified) then
              return "#BAE67E"
          else
              return "#707A8C"
          end
          if buffer.is_modified then
              return "#BAE67E"
          end
      end,
      -- }
    },
    {
      text = '',
      -- text = '',
      -- content = "%{T3}%{T-}"
      -- content = "%{T3}%{T-}"
      -- content = "%{T3}%{T-}"
      -- content = "%{T3}%{T-}"
      -- hl = {
      fg = function(buffer)
          if (buffer.is_focused and buffer.is_modified) then
              return "#BAE67E"
          elseif buffer.is_focused then
              return "#CBCCC6"
          elseif (not buffer.is_focused and buffer.is_modified) then
              return "#575F66"
          else
              return "#0F0F14"
          end
      end,
      bg = function(buffer)
          if buffer.is_focused then
              return "#0F0F14"
          else
              return "#0F0F14"
          end
          if buffer.is_modified then
              return "#BAE67E"
          end
      end,
      -- },
    },
  },
})


-- -------------------------------------------------------------------------- #
--  -----------------<< fine-cmdline >>------------------------------------------- #
-- -------------------------------------------------------------------------- #
-- require('fine-cmdline').setup({
--   cmdline = {
--     enable_keymaps = true,
--     smart_history = true
--   },
--   popup = {
--     position = {
--       row = '50%',
--       col = '50%',
--     },
--     size = {
--       width = '40%',
--       height = 1
--     },
--     border = {
--         -- highlight = "FloatBorder",
--         highlight = "Comment",
--         -- style = 'rounded',
--         style = 'double',
--         -- border = { style = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, },
--       --   padding = {
--       --     top = 2,
--       --     bottom = 2,
--       --     left = 3,
--       --     right = 3,
--       -- },
--     },
--     relative = "editor",
--     -- relative = "cursor",
--     win_options = {
--       winhighlight = 'Normal:Normal',
--     },
--   },
-- })

-- --------------------------------------------------------------
-- notify
-- --------------------------------------------------------------
-- local present, Popup = pcall(require, "nui.popup")
-- if not present then return end
--
-- local M = {}
-- local default_width = 30
-- local default_height = 2
--
-- local note = Popup({
--   enter = false,
--   focusable = false,
--   position = { row = 1,  col = "100%" },
--   border = { style = "none", padding = { 1, 2 } },
--   size = { width = default_width, height = default_height },
--   buf_options = {
--     modifiable = true,
--     readonly = false,
--   },
-- })
--
-- local notify = function(title, content, dismiss, type, width, height)
--   local heading = title
--   local body = content
--
--   local size = { width = width and width or default_width, height = height and height or default_height }
--
--   note:set_size(size)
--
--   if (string.len(title) > size.width) then
--     heading = '...'..string.sub(title, -1*(size.width-3))
--   end
--
--   if (string.len(content) > size.width) then
--     body = '...'..string.sub(content, -1*(size.width-3))
--   end
--
--   note:mount()
--   vim.defer_fn(function() note:unmount() end, dismiss or 2000)
--   vim.api.nvim_buf_set_lines(note.bufnr, 0, 2, false, { heading, body })
--   vim.api.nvim_buf_add_highlight(note.bufnr, -1, type, 0, 0, size.width)
--   vim.api.nvim_buf_add_highlight(note.bufnr, -1, 'NotifyBody', 1, 0, size.width)
-- end
--
-- M.info = function(title, content, dismiss, width, height) notify(title, content, dismiss, 'NotifyInfo', width, height) end
-- M.error = function(title, content, dismiss, width, height) notify(title, content, dismiss, 'NotifyError', width, height) end
-- M.success = function(title, content, dismiss, width, height) notify(title, content, dismiss, 'NotifySuccess', width, height) end
-- vim.notify = M
--
-- return M

-- -------------------------------------------------------------------------- #
--  ----------------- treesitter-textobjects -------------------------------- #
-- -------------------------------------------------------------------------- #
require('nvim-treesitter.configs').setup {
  ensure_installed = { "python", "lua"},
  ensure_installed = "maintained",

  highlight = {
    enable = false,
    additional_vim_regex_highlighting = false,
  },

  textobjects = {
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["mj"] = "@function.outer",
        ["]]"] = "@class.outer",
        ["qj"] = "@conditional.outer",
        ["'j"] = "@loop.outer",
        -- ["cj"] = "@comment.outer",
      },
      goto_next_end = {
        ["Mj"] = "@function.outer",
        ["]["] = "@class.outer",
        -- ["cJ"] = "@comment.outer",
      },
      goto_previous_start = {
        ["mk"] = "@function.outer",
        ["[["] = "@class.outer",
        ["qk"] = "@conditional.outer",
        ["'k"] = "@loop.outer",
        -- ["ck"] = "@comment.outer",
      },
      goto_previous_end = {
        ["Mk"] = "@function.outer",
        -- ["[]"] = "@class.outer",
        -- ["cK"] = "@comment.outer",
      },
    },
    -- swap = {
    --   enable = true,
    --   swap_next = {
    --     ["<leader>a"] = "@parameter.inner",
    --   },
    --   swap_previous = {
    --     ["<leader>A"] = "@parameter.inner",
    --   },
    -- },
    select = {
      -- enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      -- lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["qa"] = "@conditional.outer",
        ["'a"] = "@loop.outer",
        -- ["cc"] = "@comment.outer",
      },
    },
  },

  -- indent = {
  --   enable = true
  -- },

  -- rainbow = {
  --   enable = true,
  --   extended_mode = false,
  --   colors = {'#FFCC00', '#82AAFF', '#fe8019'},
  -- },

}


-- -------------------------------------------------------------------------- #
--  ----------------- nvim-autopair ----------------------------------------- #
-- -------------------------------------------------------------------------- #
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})
-- local Rule = require('nvim-autopairs.rule')
-- local npairs = require('nvim-autopairs')
--
-- npairs.add_rule(Rule("$$","$$","tex"))
--
-- -- you can use some built-in conditions
--
-- local cond = require('nvim-autopairs.conds')
-- print(vim.inspect(cond))
--
-- npairs.setup({
--     check_ts = true,
--     ts_config = {
--         lua = {'string'},-- it will not add a pair on that treesitter node
--         javascript = {'template_string'},
--         java = false,-- don't check treesitter on java
--     }
-- })
--
-- local ts_conds = require('nvim-autopairs.ts-conds')
--
--
-- -- press % => %% only while inside a comment or string
-- npairs.add_rules({
--   Rule("%", "%", "lua")
--     :with_pair(ts_conds.is_ts_node({'string','comment'})),
--   Rule("$", "$", "lua")
--     :with_pair(ts_conds.is_not_ts_node({'function'}))
-- })
