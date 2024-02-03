-- -------------------------------------------------------------------------- #
-- Neovim lua configuration
-- -------------------------------------------------------------------------- #

vim.opt.termguicolors = true


-- When deleting empty line don't copy content
local function delete_special()
	local line_data = vim.api.nvim_win_get_cursor(0) -- returns {row, col}
	local current_line = vim.api.nvim_buf_get_lines(0, line_data[1]-1, line_data[1], false)
	if current_line[1] == "" then
		return '"_dd'
	else
		return 'dd'
	end
end
vim.keymap.set( "n", "dd", delete_special, { noremap = true, expr = true } )

-- -- -------------------------------------------------------------------------- #
-- -- --------------------- symbols ------------------------------------------- #
-- -- -------------------------------------------------------------------------- #
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

-- local actions = require("diffview.actions")

-- require("diffview").setup()
--   diff_binaries = false,    -- Show diffs for binaries
--   enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
--   git_cmd = { "git" },      -- The git executable followed by default args.
--   use_icons = true,         -- Requires nvim-web-devicons
--   icons = {                 -- Only applies when use_icons is true.
--     folder_closed = "",
--     folder_open = "",
--   },
--   signs = {
--     fold_closed = "",
--     fold_open = "",
--   },
--   file_panel = {
--     listing_style = "tree",             -- One of 'list' or 'tree'
--     tree_options = {                    -- Only applies when listing_style is 'tree'
--       flatten_dirs = true,              -- Flatten dirs that only contain one single dir
--       folder_statuses = "only_folded",  -- One of 'never', 'only_folded' or 'always'.
--     },
--     win_config = {                      -- See ':h diffview-config-win_config'
--       position = "left",
--       width = 35,
--     },
--   },
--   file_history_panel = {
--     log_options = {   -- See ':h diffview-config-log_options'
--       single_file = {
--         diff_merges = "combined",
--       },
--       multi_file = {
--         diff_merges = "first-parent",
--       },
--     },
--     win_config = {    -- See ':h diffview-config-win_config'
--       position = "bottom",
--       height = 16,
--     },
--   },
--   commit_log_panel = {
--     win_config = {},  -- See ':h diffview-config-win_config'
--   },
--   default_args = {    -- Default args prepended to the arg-list for the listed commands
--     DiffviewOpen = {},
--     DiffviewFileHistory = {},
--   },
--   hooks = {},         -- See ':h diffview-config-hooks'
--   keymaps = {
--     disable_defaults = false, -- Disable the default keymaps
--     view = {
--       -- The `view` bindings are active in the diff buffers, only when the current
--       -- tabpage is a Diffview.
--       ["<tab>"]      = actions.select_next_entry, -- Open the diff for the next file
--       ["<s-tab>"]    = actions.select_prev_entry, -- Open the diff for the previous file
--       ["gf"]         = actions.goto_file,         -- Open the file in a new split in the previous tabpage
--       ["<C-w><C-f>"] = actions.goto_file_split,   -- Open the file in a new split
--       ["<C-w>gf"]    = actions.goto_file_tab,     -- Open the file in a new tabpage
--       ["<leader>e"]  = actions.focus_files,       -- Bring focus to the files panel
--       ["<leader>b"]  = actions.toggle_files,      -- Toggle the files panel.
--     },
--     file_panel = {
--       ["j"]             = actions.next_entry,         -- Bring the cursor to the next file entry
--       ["<down>"]        = actions.next_entry,
--       ["k"]             = actions.prev_entry,         -- Bring the cursor to the previous file entry.
--       ["<up>"]          = actions.prev_entry,
--       ["<cr>"]          = actions.select_entry,       -- Open the diff for the selected entry.
--       ["o"]             = actions.select_entry,
--       ["<2-LeftMouse>"] = actions.select_entry,
--       ["-"]             = actions.toggle_stage_entry, -- Stage / unstage the selected entry.
--       ["S"]             = actions.stage_all,          -- Stage all entries.
--       ["U"]             = actions.unstage_all,        -- Unstage all entries.
--       ["X"]             = actions.restore_entry,      -- Restore entry to the state on the left side.
--       ["R"]             = actions.refresh_files,      -- Update stats and entries in the file list.
--       ["L"]             = actions.open_commit_log,    -- Open the commit log panel.
--       ["<c-b>"]         = actions.scroll_view(-0.25), -- Scroll the view up
--       ["<c-f>"]         = actions.scroll_view(0.25),  -- Scroll the view down
--       ["<tab>"]         = actions.select_next_entry,
--       ["<s-tab>"]       = actions.select_prev_entry,
--       ["gf"]            = actions.goto_file,
--       ["<C-w><C-f>"]    = actions.goto_file_split,
--       ["<C-w>gf"]       = actions.goto_file_tab,
--       ["i"]             = actions.listing_style,        -- Toggle between 'list' and 'tree' views
--       ["f"]             = actions.toggle_flatten_dirs,  -- Flatten empty subdirectories in tree listing style.
--       ["<leader>e"]     = actions.focus_files,
--       ["<leader>b"]     = actions.toggle_files,
--     },
--     file_history_panel = {
--       ["g!"]            = actions.options,          -- Open the option panel
--       ["<C-A-d>"]       = actions.open_in_diffview, -- Open the entry under the cursor in a diffview
--       ["y"]             = actions.copy_hash,        -- Copy the commit hash of the entry under the cursor
--       ["L"]             = actions.open_commit_log,
--       ["zR"]            = actions.open_all_folds,
--       ["zM"]            = actions.close_all_folds,
--       ["j"]             = actions.next_entry,
--       ["<down>"]        = actions.next_entry,
--       ["k"]             = actions.prev_entry,
--       ["<up>"]          = actions.prev_entry,
--       ["<cr>"]          = actions.select_entry,
--       ["o"]             = actions.select_entry,
--       ["<2-LeftMouse>"] = actions.select_entry,
--       ["<c-b>"]         = actions.scroll_view(-0.25),
--       ["<c-f>"]         = actions.scroll_view(0.25),
--       ["<tab>"]         = actions.select_next_entry,
--       ["<s-tab>"]       = actions.select_prev_entry,
--       ["gf"]            = actions.goto_file,
--       ["<C-w><C-f>"]    = actions.goto_file_split,
--       ["<C-w>gf"]       = actions.goto_file_tab,
--       ["<leader>e"]     = actions.focus_files,
--       ["<leader>b"]     = actions.toggle_files,
--     },
--     option_panel = {
--       ["<tab>"] = actions.select_entry,
--       ["q"]     = actions.close,
--     },
--   },
-- })


-- -------------------------------------------------------------------------- #
-- ----------------- \<qf_helper\> -------------------------------------------- #
-- -------------------------------------------------------------------------- #
require'qf_helper'.setup({
  -- prefer_loclist = true,       -- Used for QNext/QPrev (see Commands below)
  -- sort_lsp_diagnostics = true, -- Sort LSP diagnostic results
  -- quickfix = {
    autoclose = true,          -- Autoclose qf if it's the only open window
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
        ['<C-q>'] = actions.smart_add_to_qflist + actions.open_qflist,
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
      width = 0.70,
      height = 0.70,
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
-- require("indent_blankline").setup {
--     -- space_char_blankline = " ",
--     -- show_trailing_blankline_indent = false,
--     show_current_context = true,
--     -- show_current_context_start = false,
--     -- show_end_of_line = false,
--     -- use_treesitter = false,
--     filetype_exclude = {
--       "help",
--       "terminal",
--       "packer",
--       "NvimTree",
--       "startify"
--     },
--     buftype_exclude = { "terminal" },
-- }
local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
  end)

require("ibl").setup{
  indent = { highlight = highlight }
  -- filetype_exclude = {
  --   "help",
  --   "terminal",
  --   "packer",
  --   "NvimTree",
  --   "startify"
  -- },
  -- buftype_exclude = { "terminal" },
}



-- -------------------------------------------------------------------------- #
--  ----------------- rgflow ------------------------------------------------ #
-- -------------------------------------------------------------------------- #
require('rgflow').setup(
    {
      -- Set the default rip grep flags and options for when running a search via
      -- RgFlow. Once changed via the UI, the previous search flags are used for
      -- each subsequent search (until Neovim restarts).
      cmd_flags = "--smart-case --fixed-strings --ignore --max-columns 200",

      -- Mappings to trigger RgFlow functions
      default_trigger_mappings = true,
      -- These mappings are only active when the RgFlow UI (panel) is open
      default_ui_mappings = true,
      -- QuickFix window only mapping
      default_quickfix_mappings = true,

      --[[
      mappings = {
        trigger = {
            -- Normal mode maps
            n = {
                ["<leader>rG"] = "open_blank", -- open UI - search pattern = blank
                ["<leader>rg"] = "open_cword", -- open UI - search pattern = <cword>
                ["<leader>rp"] = "open_paste", -- open UI - search pattern = First line of unnamed register as the search pattern
                ["<leader>ra"] = "open_again", -- open UI - search pattern = Previous search pattern
                ["<leader>rx"] = "abort",      -- close UI / abort searching / abortadding results
                ["<leader>rc"] = "print_cmd",  -- Print a version of last run rip grep that can be pasted into a shell
                ["<leader>r?"] = "print_status",  -- Print info about the current state of rgflow (mostly useful for deving on rgflow)
            },
            -- Visual/select mode maps
            x = {
                ["<leader>rg"] = "open_visual", -- open UI - search pattern = current visual selection
            },
        },
        -- Mappings that are local only to the RgFlow UI
        ui = {
            -- Normal mode maps
            n = {
                ["<CR>"]  = "start", -- With the ui open, start a search with the current parameters
                ["<ESC>"] = "close", -- With the ui open, discard and close the UI window
                ["?"]     = "show_rg_help", -- Show the rg help in a floating window, which can be closed with q or <ESC> or the usual <C-W><C-C>
                ["<BS>"]  = "nop",   -- No operation
                ["<C-^>"] = "nop",   -- No operation
                ["<C-6>"] = "nop",   -- No operation
            },
            -- Insert mode maps i = {
                ["<CR>"]  = "start", -- With the ui open, start a search with the current parameters (from insert mode)
                ["<TAB>"] = "auto_complete", -- start autocomplete if PUM not visible, if visible use own hotkeys to select an option
                ["<C-N>"] = "auto_complete", -- start autocomplete if PUM not visible, if visible use own hotkeys to select an option
                ["<C-P>"] = "auto_complete", -- start autocomplete if PUM not visible, if visible use own hotkeys to select an option
            },
        },
        -- Mapping that are local only to the QuickFix window
        quickfix = {
            -- Normal
            n = {
                ["d"] = "qf_delete",        -- QuickFix normal mode delete operator
                ["dd"] = "qf_delete_line",  -- QuickFix delete a line from quickfix
                ["<TAB>"] = "qf_mark",      -- QuickFix mark a line in the quickfix
                ["<S-TAB>"] = "qf_unmark",  -- QuickFix unmark a line in the quickfix window
                ["<BS>"]  = "nop", -- No operation
                ["<C-^>"] = "nop", -- No operation - Probably don't want to switch to a buffer in the little quickfix window
                ["<C-6>"] = "nop", -- No operation
            },
            -- Visual/select mode maps
            x = {
                ["d"] = "qf_delete_visual",       -- QuickFix visual mode delete operator
                ["<TAB>"] = "qf_mark_visual",     -- QuickFix visual mode mark operator
                ["<S-TAB>"] = "qf_unmark_visual", -- QuickFix visual mode unmark operator
            }
        },
      --]]

    }
)

-- -------------------------------------------------------------------------- #
--  ----------------- treesitter-context --------------------------------------- #
-- -------------------------------------------------------------------------- #
require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 5, -- How many lines the window should span. Values <= 0 mean no limit.
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            'for', -- These won't appear in the context
            'while',
            'if',
            'switch',
            'case',
            'class',
            'function',
            'method',
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
    mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,

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
-- See: https://github.com/neovim/nvim-lspconfig/tree/54eb2a070a4f389b1be0f98070f81d23e2b1a715#suggested-configuration
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end





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
    completeopt = 'menu,menuone,noinsert',
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



local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['pylsp'].setup {
  capabilities = capabilities
}


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
    -- ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
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
-- require("nvim-gps").setup()

-- -------------------------------------------------------------------------- #
-- -----------------< lsp >-------------------------------------------------- #
-- -------------------------------------------------------------------------- #

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup()



-- local lsp_installer = require("nvim-lsp-installer")

-- Provide settings first!
-- lsp_installer.settings {
--     ui = {
--         icons = {
--             server_installed = "✓",
--             server_pending = "➜",
--             server_uninstalled = "✗",
--         },
--     },
--
--     -- Limit for the maximum amount of servers to be installed at the same time. Once this limit is reached, any further
--     -- servers that are requested to be installed will be put in a queue.
--     max_concurrent_installers = 4,
-- }
--

-- local servers = {
--   "sumneko_lua",        -- for Lua
--   "pyright",            -- for Python
--   "pylsp",            -- for Python
--   "vimls",            -- for Python
--   "clangd",             -- for C/C++
--   "bashls",             -- for Bash
--   "jsonls",             -- for Bash
--   "sqlls",             -- for Bash
-- }

-- Setup language servers.
local lspconfig = require('lspconfig')





local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)



-- lspconfig.pyright.setup {}
-- lspconfig.clangd.setup {}
-- lspconfig.bashls.setup {}
-- require'lspconfig'.jsonls.setup{}
-- lspconfig.sqlls.setup {}
-- require'lspconfig'.jedi_language_server.setup{}
-- require'lspconfig'.pylsp.setup{
-- require'lspconfig'.pylsp.setup{
-- settings = {
    -- pylsp = {
      -- plugins = {
        -- -- pycodestyle = {
        -- --   ignore = {'W391'},
        -- --   maxLineLength = 100
        -- -- }
        -- autopep8 = {
          -- enabled  = false
        -- },
        -- -- jedi_completion = {
        -- --   fuzzy  = true
        -- -- },
        -- pyflakes = {
          -- enabled  = false
        -- },
      -- }
    -- }
  -- }
-- }

-- require'lspconfig'.pyright.setup{
--   settings = {
--       python = {
--         analysis = {
--           autoSearchPaths = true,
--           useLibraryCodeForTypes = true,
--           diagnosticMode = 'openFilesOnly',
--         },
--       },
--     },
--   }


-- Configure `ruff-lsp`.
-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff_lsp
-- For the default config, along with instructions on how to customize the settings
require('lspconfig').ruff_lsp.setup {
   on_attach = on_attach,
   init_options = {
     settings = {
       -- Any extra CLI arguments for `ruff` go here.
       args = {},
    }
  }
}


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'fj', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    -- vim.keymap.set('n', '<space>f', function()
    --   vim.lsp.buf.format { async = true }
    -- end, opts)
  end,
})

-- local nvim_lsp=require('lspconfig')
-- local coq = require("coq")
-- nvim_lsp.pyright.setup(coq.lsp_ensure_capabilities())

-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- nvim_lsp.pylsp.setup{
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
    -- virtual_text = {false},
  }
)

vim.diagnostic.config({
  underline = false,
  signs = true,
  virtual_text = true,
  update_in_insert = true,
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
-- -----------------< mason-tool-installer >-------------------------------------------------- #
-- -------------------------------------------------------------------------- #
require('mason-tool-installer').setup {}

local DEFAULT_SETTINGS = {
    -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
    -- This setting has no relation with the `automatic_installation` setting.
    ---@type string[]
    ensure_installed = {
      -- you can turn off/on auto_update per tool
      -- { 'pyright', auto_update = true },
      -- { 'pylsp', auto_update = true },
      -- { 'bash-language-server', auto_update = true },

      -- 'lua-language-server',
      -- 'vim-language-server',
      -- 'r-language-server',
      -- 'gopls',
      -- 'stylua',
      -- 'shellcheck',
      -- 'editorconfig-checker',
      -- 'gofumpt',
      -- 'golines',
      -- 'gomodifytags',
      -- 'gotests',
      -- 'impl',
      -- 'json-to-struct',
      -- 'luacheck',
      -- 'misspell',
      -- 'revive',
      -- 'shellcheck',
      -- 'shfmt',
      -- 'staticcheck',
      -- 'vint',
    },

    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    -- Can either be:
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
    ---@type boolean
    -- automatic_installation = false,

    -- See `:h mason-lspconfig.setup_handlers()`
    ---@type table<string, fun(server_name: string)>?
    -- handlers = nil,
}



-- -------------------------------------------------------------------------- #
--  ----------------- lsp signature ----------------------------------------- #
-- -------------------------------------------------------------------------- #
-- Install without configuration
-- use ({ 'projekt0n/github-nvim-theme' })

-------------------------------------------------------------------------- #
 ----------------- lsp signature ----------------------------------------- #
-------------------------------------------------------------------------- #
cfg = {
  bind = true, -- This is mandatory, otherwise border config won't get registered.
               -- If you want to hook lspsaga or other signature handler, pls set to false
  doc_lines = 2, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
                 -- set to 0 if you do not want any API comments be shown
                 -- This setting only take effect in insert mode, it does not affect signature help in normal
                 -- mode

  hint_enable = true, -- virtual hint enable
  hint_prefix = "",  -- Panda for parameter
  hint_scheme = "String",
  use_lspsaga = true,  -- set to true if you want to use lspsaga popup
  handler_opts = {
    border = "shadow"   -- double, single, shadow, none
  },
  decorator = {"`", "`"}  -- decoractor can be `decorator = {"***", "***"}`  `decorator = {"**", "**"}` `decorator = {"**_", "_**"}`
                          -- `decorator = {"*", "*"} see markdown help for more details
                          -- <u></u> ~ ~ does not supported by nvim

}
require'lsp_signature'.on_attach(cfg)

-- -------------------------------------------------------------------------- #
--  ----------------- neoclip -------------------------------------------- "
-- -------------------------------------------------------------------------- #
-- require('neoclip').setup({
--       -- history = 1000,
--       enable_persistent_history = true,
--       -- length_limit = 1048576,
--       -- continuous_sync = false,
--       -- db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
--       -- filter = nil,
--       preview = true,
--       -- prompt = nil,
--       -- default_register = '"',
--       -- default_register_macros = 'q',
--       enable_macro_history = true,
--       content_spec_column = true,
--       -- on_select = {
--       --   move_to_front = false,
--       -- },
--       -- on_paste = {
--       --   set_reg = false,
--       --   move_to_front = false,
--       -- },
--       -- on_replay = {
--       --   set_reg = false,
--       --   move_to_front = false,
--       -- },
--       keys = {
--         telescope = {
--           i = {
--             select = '<cr>',
--             paste = '<c-p>',
--             paste_behind = '<c-k>',
--             replay = '<c-q>',  -- replay a macro
--             delete = '<c-d>',  -- delete an entry
--             custom = {},
--           },
--           n = {
--             select = '<cr>',
--             paste = 'p',
--             --- It is possible to map to more than one key.
--             -- paste = { 'p', '<c-p>' },
--             paste_behind = 'P',
--             replay = 'q',
--             delete = 'd',
--             custom = {},
--           },
--         },
--         fzf = {
--           select = 'default',
--           paste = 'ctrl-p',
--           paste_behind = 'ctrl-k',
--           custom = {},
--         },
--       },
--     })
--
-- ---------------------------------------------------- #
--  ----------------- TODO comment -------------------------------------------- "
-- -------------------------------------------------------------------------- #
require("todo-comments").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- You can also specify a list of valid jump keywords

vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
end, { desc = "Next error/warning todo comment" })

-- -------------------------------------------------------------------------- #
--  ----------------- lightspeed -------------------------------------------- "
-- -------------------------------------------------------------------------- #

require'lightspeed'.setup {
  ignore_case = true,
  repeat_ft_with_target_char = true,
  -- exit_after_idle_msecs = { unlabeled = 500, labeled = nil },

}

-- -- -------------------------------------------------------------------------- #
-- -- trouble ------------------------------------------------------------------ #
-- -- -------------------------------------------------------------------------- #
-- require("trouble").setup {
--     auto_preview = false, -- automatyically preview the location of the diagnostic. <esc> to close preview and go back to last window
--     auto_fold = true, -- automatically fold a file trouble list at creation
-- }

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
  -- open_on_setup       = true,
  -- will not open on setup if the filetype is in this list
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab         = false,
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor       = true,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd          = true,
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
    update_cwd  = true,
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
    width = 50,
    -- height of the window, can be either a number (columns) or a string in `%`, for top or bottom side placement
    -- height = 30,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    -- if true the tree will resize itself after opening a file
    -- auto_resize = true,
    -- mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      -- custom_only = false,
      -- list of mappings to set on the tree manually
      -- list = {}
    }
}

-- local tree_cb = require'nvim-tree.config'.nvim_tree_callback
-- local list = {
--   { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
--   { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
--   { key = "v",                        cb = tree_cb("vsplit") },
--   { key = "i",                        cb = tree_cb("split") },
--   { key = "t",                        cb = tree_cb("tabnew") },
--   { key = "<",                            cb = tree_cb("prev_sibling") },
--   { key = ">",                            cb = tree_cb("next_sibling") },
--   { key = "P",                            cb = tree_cb("parent_node") },
--   { key = "<BS>",                         cb = tree_cb("close_node") },
--   { key = "<S-CR>",                       cb = tree_cb("close_node") },
--   { key = "<Tab>",                        cb = tree_cb("preview") },
--   { key = "K",                            cb = tree_cb("first_sibling") },
--   { key = "J",                            cb = tree_cb("last_sibling") },
--   { key = "I",                            cb = tree_cb("toggle_ignored") },
--   { key = "H",                            cb = tree_cb("toggle_dotfiles") },
--   { key = "R",                            cb = tree_cb("refresh") },
--   { key = "a",                            cb = tree_cb("create") },
--   { key = "d",                            cb = tree_cb("remove") },
--   { key = "r",                            cb = tree_cb("rename") },
--   { key = "<C-r>",                        cb = tree_cb("full_rename") },
--   { key = "x",                            cb = tree_cb("cut") },
--   { key = "c",                            cb = tree_cb("copy") },
--   { key = "p",                            cb = tree_cb("paste") },
--   { key = "y",                            cb = tree_cb("copy_name") },
--   { key = "Y",                            cb = tree_cb("copy_path") },
--   { key = "gy",                           cb = tree_cb("copy_absolute_path") },
--   { key = "[c",                           cb = tree_cb("prev_git_item") },
--   { key = "]c",                           cb = tree_cb("next_git_item") },
--   { key = "-",                            cb = tree_cb("dir_up") },
--   { key = "s",                            cb = tree_cb("system_open") },
--   { key = "q",                            cb = tree_cb("close") },
--   { key = "g?",                           cb = tree_cb("toggle_help") },
-- }


-- -------------------------------------------------------------------------- #
-- ----------------- ayu ---------------------------------------------------- #
-- -------------------------------------------------------------------------- #
-- require('ayu').setup({
--   mirage=true,
--   overrides = {
--     Comment = {fg = '#707A8C'},
--     String = {fg = '#E6BA7E'},
--     LineNr = {fg = '#465742'},
--     CursorLineNr = {fg = '#E6BA7E', bg = '#0D1016'},
--     -- Search = {fg = '#7CB0E6', bg = '#33415E'},
--     Search = {fg = '#0D1016', bg = '#707A8C'},
--     -- IncSearch = {fg = '#E6BA7E', bg = '#0D1016'},
--   }
-- })

-- -- -------------------------------------------------------------------------- #
-- -- ----------------- catppuccin ---------------------------------------------------- #
-- -- -------------------------------------------------------------------------- #
-- require("catppuccin").setup({
--     flavour = "latte", -- latte, frappe, macchiato, mocha
--     background = { -- :h background
--         light = "frappe",
--         dark = "mocha",
--     },
--     transparent_background = true, -- disables setting the background color.
--     show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
--     term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
--     dim_inactive = {
--         enabled = false, -- dims the background color of inactive window
--         shade = "dark",
--         percentage = 0.15, -- percentage of the shade to apply to the inactive window
--     },
--     no_italic = false, -- Force no italic
--     no_bold = false, -- Force no bold
--     no_underline = false, -- Force no underline
--     styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
--         comments = { "italic" }, -- Change the style of comments
--         conditionals = { "italic" },
--         loops = {},
--         functions = {},
--         keywords = {italic},
--         strings = {},
--         variables = {},
--         numbers = {},
--         booleans = {},
--         properties = {},
--         types = {},
--         operators = {},
--     },
--     color_overrides = {},
--     custom_highlights = {},
--     integrations = {
--         cmp = true,
--         gitsigns = true,
--         nvimtree = true,
--         telescope = true,
--         notify = false,
--         mini = false,
--         -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--     },
-- })


-- -- -------------------------------------------------------------------------- #
-- -- ----------------- kanagawa ---------------------------------------------------- #
-- -- -------------------------------------------------------------------------- #
require('kanagawa').setup({
    undercurl = true,           -- enable undercurls
    functionStyle = {italic = true},
    keywordStyle = {italic = true},
    variablebuiltinStyle = { italic = true},
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords
    -- typeStyle = "NONE",
    -- variablebuiltinStyle = "italic",
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords
    transparent = false,        -- do not set background color
    globalStatus = false,       -- adjust window separators highlight for laststatus=3
    colors = {},
    -- theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "dragon",           -- try "dragon" !
        light = "lotus"
    },
    -- overrides = {
    --   -- override existing hl-groups, the new keywords are merged with existing ones
    --   VertSplit  = {
    --     fg = '#2A2A37',
    --     bg = "NONE"
    --   },
    -- },
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")

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
-- require('wlsample.vscode')

local windline = require('windline')
local helper = require('windline.helpers')
local sep = helper.separators
local vim_components = require('windline.components.vim')

local b_components = require('windline.components.basic')
local state = _G.WindLine.state

local lsp_comps = require('windline.components.lsp')
local git_comps = require('windline.components.git')


local colors = {
  -- black         = "",  -- terminal_color_0,
  -- red           = "",  -- terminal_color_1,
  -- green         = "",  -- terminal_color_2,
  -- yellow        = "",  -- terminal_color_3,
  -- blue          = "",  -- terminal_color_4,
  -- magenta       = "",  -- terminal_color_5,
  -- cyan          = "",  -- terminal_color_6,
  -- white         = "",  -- terminal_color_7,
  -- black_light   = "",  -- terminal_color_8,
  -- red_light     = "",  -- terminal_color_9,
  -- green_light   = "",  -- terminal_color_10,
  -- yellow_light  = "",  -- terminal_color_11,
  -- blue_light    = "",  -- terminal_color_12,
  -- magenta_light = "",  -- terminal_color_13,
  -- cyan_light    = "",  -- terminal_color_14,
  -- white_light   = "",  -- terminal_color_15,
  -- NormalFg      = "",  -- hightlight Normal fg
  NormalBg      = "#000000",  -- hightlight Normal bg
  -- ActiveFg      = "",  -- hightlight StatusLine fg
  ActiveBg      = "#000000",  -- hightlight StatusLine bg
  -- InactiveFg    = "",  -- hightlight StatusLineNc fg
  InactiveBg    = "#000000",  -- hightlight StatusLineNc bg
}


local hl_list = {
    Inactive = { 'NormalFg', 'NormalBg' },
    Active = { 'ActiveFg', 'ActiveBg' },
}

local basic = {}

basic.divider = { b_components.divider, hl_list.Inactive  }
basic.file_name_inactive = { b_components.full_file_name, hl_list.Inactive }
basic.line_col_inactive = { b_components.line_col, hl_list.Inactive }
basic.progress_inactive = { b_components.progress, hl_list.Inactive }

basic.file = {
    name = 'file',
    hl_colors = {
        sep_before = { 'NormalFg', 'ActiveFg' },
        sep_after = { 'NormalFg', 'ActiveFg' },
        text = { 'ActiveFg', 'NormalFg' },
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
    width = 50,
}
basic.file_inac = {
    name = 'file',
    hl_colors = {
        sep_before = { 'InactiveBg', 'ActiveFg' },
        sep_after = { 'InactiveBg', 'ActiveFg' },
        text = { 'NormalFg', 'InactiveBg' },
    },
    text = function()
        return {
            { sep.left_rounded, 'sep_before' },
            {b_components.cache_file_icon({ default = '' }), 'text'},
            { b_components.cache_file_name('[No Name]', 'text') },
            { b_components.file_modified(' ')},
            { sep.right_rounded, 'sep_after'},
        }
    end,
}


basic.git_inac = {
    name = 'git',
    text = function()
      return {
        { git_comps.git_branch({ icon = '  ' }), { 'NormalFg', 'ActiveFg' }, 90 },
      }
    end,
    width = 20,
}


basic.gps = {
    name = 'gaaaps',
    hl_colors = {
        sep_before = { 'tabe', 'ActiveFg' },
        sep_after = { 'tabe', 'ActiveFg' },
        text = { 'ActiveBg', 'tabe' },
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
    name = 'tabe',
    hl_colors = {
        sep_before = { 'black', 'ActiveFg' },
        sep_after = { 'black', 'ActiveFg' },
        text = { 'ActiveFg', 'black' },
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
    name = 'git',
    hl_colors = {
        sep_after = { 'black', 'ActiveFg' },
    },
    text = function()
      return {
        { git_comps.git_branch({ icon = '  ' }), { 'black', 'ActiveFg' }, 90 },
      }
    end,
    width = 20,
}


local default = {
    filetypes = { 'default' },
    active = {
      {' ', hl_list.Inactive},
      basic.tabe,
      { ' ', hl_list.Inactive},
      basic.gps,
      { ' ', hl_list.Inactive},
      -- basic.divider,
      basic.file,
      basic.git_branch,
      {' ', hl_list.Inactive},
      -- {' ', hl_list.Inactive},
  },
  inactive = {
      basic.file_inac,
      basic.git_inac,
      basic.divider,
  },
}

local quickfix = {
  filetypes = { 'qf', 'Trouble' },
  active = {
      { ' Quickfix ', { 'NormalFg', 'ActiveFg' } },
      { sep.left_rounded, { 'NormalFg', 'ActiveFg' } },
      {
          function()
              return vim.fn.getqflist({ title = 0 }).title
          end,
          { 'black_light', 'NormalFg' },
      },
      { ' Total : %L ', { 'black_light', 'NormalFg' } },
      { sep.right_rounded, { 'NormalFg', 'ActiveFg' } },
      { ' ', { 'NormalFg', 'ActiveFg' } },
      basic.divider,
  },
  always_active = true,
  show_last_status = true
}
local explorer = { filetypes = { 'fern', 'NvimTree', 'lir' },
    active = {
        { b_components.divider, '' },
        { b_components.file_name(''), { 'NormalFg', 'ActiveFg' } },
    },
    always_active = true,
    show_last_status = true
}

windline.setup({
  colors_name = function(colors)
      colors.NormalBg = colors.NormalBg
      colors.ActiveBg = colors.ActiveBg
      colors.InactiveBg = colors.InactiveBg

      -- this color will not update if you change a colorscheme
      -- colors.gray = "#fefefe"

      -- dynamically get color from colorscheme hightlight group
      -- local searchFg, searchBg = require('windline.themes').get_hl_color('Search')
      -- colors.SearchFg = searchFg or colors.white
      -- colors.SearchBg = searchBg or colors.yellow

      return colors
  end,
  statuslines = {
        default,
        explorer,
        quickfix,
  },
})


-- -- -------------------------------------------------------------------------- #
-- --  ----------------- comment box -------------------------------------------- "
-- -- -------------------------------------------------------------------------- #
-- require('comment-box').setup({
-- 	-- doc_width = 80, -- width of the document
-- 	-- box_width = 60, -- width of the boxes
--   outer_blank_lines = true, -- insert a blank line above and below the box
--   inner_blank_lines = false, -- insert a blank line above and below the text
-- })

-- -------------------------------------------------------------------------- #
--  ----------------- cokeline -------------------------------------------- "
-- -------------------------------------------------------------------------- #
-- local get_hex = require('cokeline/utils').get_hex
local get_hex = require('cokeline.hlgroups').get_hl_attr


theme_bg = get_hex('Normal', 'guibg')
-- cokeline_bg = get_hex('Normal', 'fg')
cokeline_bg = "#c8d3f5"
-- cokeline_fg = get_hex('Normal', 'fg')
cokeline_fg = "#000000"
require('cokeline').setup({
  default_hl = {
    -- bg = get_hex('Normal', 'fg'),
    -- bg = get_hex('Normal', 'bg'),
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
              return cokeline_bg
          end
      end,
      bg = function(buffer)
          if buffer.is_focused then
              return theme_bg
          elseif (not buffer.is_focused and buffer.is_modified) then
              return theme_bg
          else
              return theme_bg
          end
          if buffer.is_modified then
              return theme_bg
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
              return cokeline_bg
          end
      end,
      fg = function(buffer)
          if buffer.is_focused then
              return cokeline_fg
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
              return cokeline_bg
          end
      end,
      fg = function(buffer)
          if buffer.is_focused then
              return cokeline_fg
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
              return cokeline_bg
          end
      end,
      fg = function(buffer)
          if buffer.is_focused then
              return cokeline_fg
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
              return cokeline_bg
          end
      end,
      fg = function(buffer)
          if buffer.is_focused then
              return cokeline_fg
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
      -- content = "%{T3}%{T-}"
      fg = function(buffer)
          if (buffer.is_focused and buffer.is_modified) then
              return "#BAE67E"
          elseif buffer.is_focused then
              return "#CBCCC6"
          elseif (not buffer.is_focused and buffer.is_modified) then
              return "#575F66"
          else
              return cokeline_bg
          end
      end,
      bg = function(buffer)
          if buffer.is_focused then
              return theme_bg
          elseif (not buffer.is_focused and buffer.is_modified) then
              return theme_bg
          else
              return theme_bg
          end
          if buffer.is_modified then
              return theme_bg
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
  ensure_installed = {
    "python",
    "lua"
  },
  ensure_installed = "maintained",
  highlight = {
    enable = true,
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
    select = {
      enable = true,
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
}


-- -- -------------------------------------------------------------------------- #
-- --  ----------------- nvim-autopair ----------------------------------------- #
-- -- -------------------------------------------------------------------------- #
-- require('nvim-autopairs').setup({
--   disable_filetype = { "TelescopePrompt" , "vim" },
-- })

-- -- -------------------------------------------------------------------------- #
-- --  ----------------- tokyonight ----------------------------------------- #
-- -- -------------------------------------------------------------------------- #
-- require("tokyonight").setup({
--   -- your configuration comes here
--   -- or leave it empty to use the default settings
--   style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
--   light_style = "day", -- The theme is used when the background is set to light
--   transparent = false, -- Enable this to disable setting the background color
--   terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
--   styles = {
--     -- Style to be applied to different syntax groups
--     -- Value is any valid attr-list value for `:help nvim_set_hl`
--     comments = { italic = true },
--     keywords = { italic = true },
--     functions = {},
--     variables = {},
--     -- Background styles. Can be "dark", "transparent" or "normal"
--     sidebars = "day", -- style for sidebars, see below
--     floats = "day", -- style for floating windows
--   },
--   -- sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
--   day_brightness = 0.2, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
--   hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
--   dim_inactive = true, -- dims inactive windows
--   lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
--   --- You can override specific color groups to use other groups or a hex color
--   --- function will be called with a ColorScheme table
--   ---@param colors ColorScheme
--   on_colors = function(colors) end,
-- })


-- -------------------------------------------------------------------------- #
--  ----------------- lsp-notify ----------------------------------------- #
-- -------------------------------------------------------------------------- #
-- require("lsp-notify").setup({})

-- -------------------------------------------------------------------------- #
--  ----------------- lspsaga ----------------------------------------- #
-- -------------------------------------------------------------------------- #
  -- ft = {'c','cpp', 'py', 'python'},
  -- symbols_in_winbar.enable = false,
  -- lines = { '┗', '┣', '┃', '━', '┏' },
  -- borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
require("lspsaga").setup({
  -- border = "round",
  -- border_style = "rounded",
  ui = {
    border = 'rounded',
    colors = {normal_bg = 'NONE'},
    title = false
  },
  definition = {
    keys = {
        edit = 'o',
        vsplit = 'v',
        split = 'i',
        tabe = 't',
    }
  }
})
local keymap = vim.keymap.set
-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gd", "<cmd>Lspsaga finder def<CR>", { silent = true })
keymap("n", "gsr", "<cmd>Lspsaga finder def+ref+imp<CR>", { silent = true })

-- Code action
-- keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = false })

-- Rename
keymap("n", "<leader>gr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Show line diagnostics
keymap("n", "ga", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Show cursor diagnostic
-- keymap("n", "ga", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Only jump to error
keymap("n", "[d", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]d", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
keymap("n", "gK", "<cmd>Lspsaga hover_doc ++keep<CR>", { silent = true })

-- -------------------------------------------------------------------------- #
--  ----------------- nightfly -------------------------------------------- #
-- -------------------------------------------------------------------------- #
vim.g.nightflyNormalFloat = true
 -- it is highly recommended to enable floating window borders to distinguish between the edit and floating windows in Neovim's LSP client
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "rounded",
  }
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signatureHelp, {
    border = "rounded"
  }
)
vim.diagnostic.config({ float = { border = "rounded" } })
-- bulb Likewise, nvim-cmp may be configured as follows for nicer display when g:nightflyNormalFloat is enabled:
local winhighlight = {
  winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
}
require('cmp').setup({
  window = {
    completion = cmp.config.window.bordered(winhighlight),
    documentation = cmp.config.window.bordered(winhighlight),
  }
})

vim.g.nightflyWinSeparator = 2
-- vim.opt.fillchars = { horiz = '━', horizup = '┻', horizdown = '┳', vert = '┃', vertleft = '┫', vertright = '┣', verthoriz = '╋', }
vim.g.nightflyTransparent = true
