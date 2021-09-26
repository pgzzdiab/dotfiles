-- -------------------------------------------------------------------------- #
-- Neovim lua configuration
-- -------------------------------------------------------------------------- #

-- -------------------------------------------------------------------------- #
-- --------------------- Diffview ------------------------------------------- #
-- -------------------------------------------------------------------------- #
-- Lua
local cb = require'diffview.config'.diffview_callback
require'diffview'.setup {
  diff_binaries = false,    -- Show diffs for binaries
  file_panel = {
    width = 35,
    -- use_icons = true        -- Requires nvim-web-devicons
  },
  key_bindings = {
    disable_defaults = false,                   -- Disable the default key bindings
    -- The `view` bindings are active in the diff buffers, only when the current
    -- tabpage is a Diffview.
    view = {
      ["<tab>"]     = cb("select_next_entry"),  -- Open the diff for the next file
      ["<s-tab>"]   = cb("select_prev_entry"),  -- Open the diff for the previous file
      ["<leader>e"] = cb("focus_files"),        -- Bring focus to the files panel
      ["<leader>b"] = cb("toggle_files"),       -- Toggle the files panel.
    },
    file_panel = {
      -- ["j"]             = cb("next_entry"),         -- Bring the cursor to the next file entry
      -- ["<down>"]        = cb("next_entry"),
      -- ["k"]             = cb("prev_entry"),         -- Bring the cursor to the previous file entry.
      -- ["<up>"]          = cb("prev_entry"),
      -- ["<cr>"]          = cb("select_entry"),       -- Open the diff for the selected entry.
      ["o"]             = cb("select_entry"),
      ["<2-LeftMouse>"] = cb("select_entry"),
      ["-"]             = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
      ["S"]             = cb("stage_all"),          -- Stage all entries.
      ["U"]             = cb("unstage_all"),        -- Unstage all entries.
      ["R"]             = cb("refresh_files"),      -- Update stats and entries in the file list.
      ["<tab>"]         = cb("select_next_entry"),
      ["<s-tab>"]       = cb("select_prev_entry"),
      ["<leader>e"]     = cb("focus_files"),
      ["<leader>b"]     = cb("toggle_files"),
    }
  }
}

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

-- require'dap'.setup()

-- -------------------------------------------------------------------------- #
-- ----------------- \<lualine\> -------------------------------------------- #
-- -------------------------------------------------------------------------- #
local colors = {
    bg = '#263238',
    fg = '#abb2bf',
    yellow = '#e0af68',
    cyan = '#56b6c2',
    darkblue = '#081633',
    green = '#98c379',
    orange = '#d19a66',
    violet = '#a9a1e1',
    magenta = '#c678dd',
    blue = '#61afef',
    red = '#e86671'
}
local vi_mode_colors = {
    NORMAL = colors.green,
    INSERT = colors.red,
    VISUAL = colors.magenta,
    OP = colors.green,
    BLOCK = colors.blue,
    REPLACE = colors.violet,
    ['V-REPLACE'] = colors.violet,
    ENTER = colors.cyan,
    MORE = colors.cyan,
    SELECT = colors.orange,
    COMMAND = colors.green,
    SHELL = colors.green,
    TERM = colors.green,
    NONE = colors.yellow
}
local lsp = require 'feline.providers.lsp'
local vi_mode_utils = require 'feline.providers.vi_mode'
local comps = {
    vi_mode = {
        left = {
            provider = function()
              return ' ' .. vi_mode_utils.get_vim_mode()
            end,
            hl = function()
                local val = {
                    name = vi_mode_utils.get_mode_highlight_name(),
                    fg = vi_mode_utils.get_mode_color(),
                    -- style = 'bold'
                }
                return val
            end,
            left_sep = '',
            right_sep = '  '
        },
        right = {
            provider = '',
            hl = function()
                local val = {
                    name = vi_mode_utils.get_mode_highlight_name(),
                    fg = vi_mode_utils.get_mode_color()
                }
                return val
            end,
            -- left_sep = '',
            -- right_sep = ''
        }
    },
    file = {
        info = {
            provider = 'file_info',
            file_modified_icon = '●',
            hl = {
                fg = colors.fg,
                -- style = 'bold'
            },
        },
        encoding = {
            provider = 'file_encoding',
            left_sep = ' ',
            hl = {
                fg = colors.blue,
                -- style = 'bold'
            }
        },
        type = {
            provider = 'file_type'
        },
        position = {
            provider = 'position',
            left_sep = ' ',
            hl = {
                fg = colors.orange,
                -- style = 'bold'
            }
        },
    },
    left_end = {
        provider = function() return '' end,
        hl = {
            fg = colors.bg,
            bg = colors.blue,
        }
    },
    scroll_bar = {
        provider = 'scroll_bar',
        left_sep = ' ',
        hl = {
            fg = colors.blue,
            -- style = 'bold'
        }
    },
    lsp = {},
    diagnos = {},
    git = {
        branch = {
            provider = 'git_branch',
            icon = ' ',
            left_sep = ' ',
            hl = {
                fg = colors.blue,
            },
        },
    }
}

local components = {
  active = {},
  inactive = {},
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})

table.insert(components.active[1], comps.vi_mode.left)
table.insert(components.active[1], comps.file.info)
table.insert(components.active[1], comps.git.branch)
table.insert(components.active[1], comps.git.add)
table.insert(components.active[1], comps.git.change)
table.insert(components.active[1], comps.git.remove)
table.insert(components.inactive[1], comps.vi_mode.left)
table.insert(components.inactive[1], comps.file.info)
table.insert(components.active[2], comps.file.position)
table.insert(components.active[2], comps.vi_mode.right)

require'feline'.setup {
    colors = { bg = colors.bg, fg = colors.fg },
    components = components,
    vi_mode_colors = vi_mode_colors,
    force_inactive = {
        filetypes = {
            'packer',
            'NvimTree',
            'fugitive',
            'fugitiveblame'
        },
        buftypes = {'terminal'},
        bufnames = {}
    }
}

-- -------------------------------------------------------------------------- #
-- ----------------- spellsitter -------------------------------------------- #
-- -------------------------------------------------------------------------- #
-- require('spellsitter').setup()

-- -------------------------------------------------------------------------- #
-- ----------------- statusline --------------------------------------------- #
-- -------------------------------------------------------------------------- #
-- require('lualine').setup()
-- local custom_gruvbox = require'lualine.themes.gruvbox'
	-- Chnage the background of lualine_c section for normal mode
-- custom_gruvbox.normal.c.bg = '#263238'
-- custom_gruvbox.normal.b.bg = '#263238'
-- custom_gruvbox.normal.c.bg = '#263238'


---------------------------------------------------------------------------------
---- TELESCOPE
---- ----------------------------------------------------------------------------
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      -- '--no-heading',
      -- '--with-filename',
      -- '--line-number',
      -- '--column',
      -- '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    theme = "dropdown",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {mirror = false, },
      vertical = {mirror = false, }
    },
    file_sorter = require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {
      '.pyc',
      '.pyi',
      'venv/.*',
      'site-packages/.*'
    },
    generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    -- width = 0.75,
    -- preview_cutoff = 120,
    -- results_height = 1,
    -- results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = false,
    -- set_env = { ['COLORTERM'] = 'truecolor' },
    -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general overridebuffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}


-- -------------------------------------------------------------------------- #
--  ----------------- kommentary -------------------------------------------- #
-- -------------------------------------------------------------------------- #
require('kommentary.config')


-- -------------------------------------------------------------------------- #
--  ----------------- treesitter-textobjects -------------------------------- #
-- -------------------------------------------------------------------------- #
require'nvim-treesitter.configs'.setup {
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
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        -- ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["qa"] = "@conditional.outer",
        ["'a"] = "@loop.outer",
        -- ["cc"] = "@comment.outer",


      },
    },
  },
}
-- -------------------------------------------------------------------------- #
--  ----------------- lsp --------------------------------------------------- "
-- -------------------------------------------------------------------------- #
local nvim_lsp=require('lspconfig')

-- local on_attach=function(client, bufnr)
-- 	-- Enable completion triggered by <c-x><c-o>
-- 	-- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

-- 	-- Mappings.
-- 	local opts={noremap=true, silent=true }
-- 	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
-- 	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
-- 	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
-- 	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
-- 	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
-- 	buf_set_keymap('n', 'gv', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
-- 	buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
-- 	buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
-- 	-- buf_set_keymap('n', 'gwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
-- 	-- buf_set_keymap('n', 'gwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
-- 	-- buf_set_keymap('n', 'gwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
-- 	-- buf_set_keymap('n', 'gv', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
-- 	-- buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
-- 	-- buf_set_keymap('n', 'gra', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
-- 	-- buf_set_keymap('n', 'ga', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
-- 	-- buf_set_keymap('n', '<Leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
-- 	-- buf_set_keymap("n", "<Leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
-- end

nvim_lsp.pyright.setup{}

-- replace the default lsp diagnostic letters with prettier symbols
vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})


-- remove underlying on diagnostic
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics,
	{
		underline = false,
		update_in_insert = true,
		virtual_text = {
			underline=false,
			spacing = 2,
			severity_limit = "Error"
		}
	}
)

-- -------------------------------------------------------------------------- #
--  ----------------- lspkind ----------------------------------------------- #
-- -------------------------------------------------------------------------- #
require('lspkind').init()

-- -------------------------------------------------------------------------- #
------ nvim compe
-- -------------------------------------------------------------------------- #
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  -- throttle_time = 80;
  -- source_timeout = 200;
  -- incomplete_delay = 400;
  -- max_abbr_width = 100;
  -- max_kind_width = 100;
  -- max_menu_width = 100;
  documentation = true;
  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
  };
}

-- highlight link CompeDocumentation NormalFloat

-- show diagnostic virtual test on hover
-- vim.cmd [[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]
-- vim.cmd [[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]

-- show virtual text on hover
-- vim.api.nvim_set_keymap("n", "gn", "vim.lsp.diagnostic.goto_next()<CR>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("n", "gb", "vim.lsp.diagnostic.goto_prev()<CR>", {noremap = true, silent = true})

-- -------------------------------------------------------------------------- #
--  ----------------- lsp signature ----------------------------------------- #
-- -------------------------------------------------------------------------- #
cfg = {
  bind = true, -- This is mandatory, otherwise border config won't get registered.
               -- If you want to hook lspsaga or other signature handler, pls set to false
  doc_lines = 2, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
                 -- set to 0 if you do not want any API comments be shown
                 -- This setting only take effect in insert mode, it does not affect signature help in normal
                 -- mode

  hint_enable = true, -- virtual hint enable
  hint_prefix = "🐼 ",  -- Panda for parameter
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
--  ----------------- lspsaga ----------------------------------------------- #
-- -------------------------------------------------------------------------- #
local saga = require "lspsaga"

local opts = {
		border_style = "single", -- "single" "double" "round" "plus"
		max_preview_lines = 20, -- preview lines of lsp_finder and definition preview
		finder_reference_icon = '  ',
		definition_preview_icon = '  ',
		error_sign=' ',
		warn_sign=' ',
		hint_sign=' ',
		infor_sign='',
		finder_action_keys = {
			open = 'o',
			vsplit = 's',
			split = 'i',
			quit = 'q',
			-- scroll_down = '<Down>',
			-- scroll_up = '<Up>'
		},
}
saga.init_lsp_saga(opts)

-- require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>

-- -------------------------------------------------------------------------- #
--  ----------------- barbar ----------------------------------------------- #
-- -------------------------------------------------------------------------- #
-- Set barbar's options
vim.g.bufferline = {
  -- Enable/disable animations
  animation = true,

  -- Enable/disable auto-hiding the tab bar when there is a single buffer
  auto_hide = false,

  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = true,

  -- Enable/disable close button
  closable = true,

  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = true,

  -- Excludes buffers from the tabline
  -- exclude_ft = ['javascript'],
  -- exclude_name = ['package.json'],

  -- Enable/disable icons
  -- if set to 'numbers', will show buffer index in the tabline
  -- if set to 'both', will show buffer index and icons in the tabline
  icons = both,

  -- If set, the icon color will follow its corresponding buffer
  -- highlight group. By default, the Buffer*Icon group is linked to the
  -- Buffer* group (see Highlighting below). Otherwise, it will take its
  -- default value as defined by devicons.
  icon_custom_colors = true,

  -- Configure icons on the bufferline.
  -- icon_separator_active = '▎',
  -- icon_separator_inactive = '▎',
  -- icon_close_tab = '',
  -- icon_close_tab_modified = '●',
  -- icon_pinned = '車',

  -- If true, new buffers will be inserted at the end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = true,

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,

  -- Sets the maximum buffer name length.
  maximum_length = 60,

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  -- semantic_letters = true,

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustement
  -- for other layouts.
  -- letters = 'qwertyuiopasdfghjklxcvbnm;QWERTYUIOPASDFGHJKLLCVBNM',

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  -- no_name_title = nil,
}
-- -------------------------------------------------------------------------- #
--  ----------------- illuminate -------------------------------------------- "
-- -------------------------------------------------------------------------- #
-- require'lspconfig'.pyright.setup{
--   on_attach = function(client)
--       require 'illuminate'.on_attach(client)
--     end,
-- }

-- -------------------------------------------------------------------------- #
-- LSP color -----------------------------------------------------------------
-- -------------------------------------------------------------------------- #
-- require("lsp-colors").setup({
--   Error = "#db4b4b",
--   Warning = "#e0af68",
--   Information = "#0db9d7",
--   Hint = "#10B981"
-- })

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
    -- auto_fold = false, -- automatically fold a file trouble list at creation
    use_lsp_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
	-- },
	-- lsp_blacklist = {}
}


-- blacklines
-- vim.cmd "hi IndentBlanklineChar guifg=#383c44"

-- misc --
-- vim.cmd "hi LineNr guifg=#42464e"
-- vim.cmd "hi Comment guifg=#42464e"
-- vim.cmd "hi NvimInternalError guifg=#f9929b"
-- vim.cmd "hi VertSplit guifg=#2a2e36"
-- vim.cmd "hi EndOfBuffer guifg=#1e222a"

-- Pmenu
-- vim.cmd "hi PmenuSel guibg=#98c379"
-- vim.cmd "hi Pmenu  guibg=#282c34"
-- vim.cmd "hi PmenuSbar guibg =#353b45"
-- vim.cmd "hi PmenuThumb guibg =#81A1C1"

-- inactive statuslines as thin splitlines
-- vim.cmd("highlight! StatusLineNC gui=underline guifg=#383c44")

-- line n.o
-- vim.cmd "hi clear CursorLine"
-- vim.cmd "hi cursorlinenr guifg=#abb2bf"

-- git signs ---
-- vim.cmd "hi DiffAdd guifg=#81A1C1 guibg = none"
-- vim.cmd "hi DiffChange guifg =#3A3E44 guibg = none"
-- vim.cmd "hi DiffModified guifg = #81A1C1 guibg = none"

-- NvimTree
-- vim.cmd "hi NvimTreeFolderIcon guifg = #61afef"
-- vim.cmd "hi NvimTreeFolderName guifg = #61afef"
-- vim.cmd "hi NvimTreeIndentMarker guifg=#383c44"
-- vim.cmd "hi NvimTreeNormal guibg=#1b1f27"
-- vim.cmd "hi NvimTreeVertSplit guifg=#1e222a"
-- vim.cmd "hi NvimTreeRootFolder guifg=#f9929b"

-- telescope
-- vim.cmd "hi TelescopeBorder   guifg=#2a2e36"
-- vim.cmd "hi TelescopePromptBorder   guifg=#2a2e36"
-- vim.cmd "hi TelescopeResultsBorder  guifg=#2a2e36"
-- vim.cmd "hi TelescopePreviewBorder  guifg=#525865"

-- LspDiagnostics ---

-- error / warnings
-- vim.cmd "hi LspDiagnosticsSignError guifg=#f9929b"
-- vim.cmd "hi LspDiagnosticsVirtualTextError guifg=#BF616A"
-- vim.cmd "hi LspDiagnosticsSignWarning guifg=#EBCB8B"
-- vim.cmd "hi LspDiagnosticsVirtualTextWarning guifg=#EBCB8B"

-- info
-- vim.cmd "hi LspDiagnosticsSignInformation guifg=#A3BE8C"
-- vim.cmd "hi LspDiagnosticsVirtualTextInformation guifg=#A3BE8C"

-- hint
-- vim.cmd "hi LspDiagnosticsSignHint guifg=#b6bdca"
-- vim.cmd "hi LspDiagnosticsVirtualTextHint guifg=#b6bdca"



-- start colorizer
require('colorizer').setup()


---------------------------------------------------------------------------------
---- nvim-bufferline
---- ----------------------------------------------------------------------------
--require"bufferline".setup{
--	options = {
--			view = "multiwindow",
--			numbers = "buffer_id",
--			-- number_style = "superscript" | "" | { "none", "subscript" }, -- buffer_id at index 1, ordinal at index 2
--			mappings = true,
--			buffer_close_icon= "",
--			modified_icon = "●",

-- -------------------------------------------------------------------------- #
-- symbol lsp --------------------------------------------------------------- #
-- -------------------------------------------------------------------------- #
-- vim.g.symbols_outline = {
--     highlight_hovered_item = false,
--     show_guides = true,
--     auto_preview = false, -- experimental
--     position = 'right',
--     keymaps = {
--         close = "<Esc>",
--         goto_location = "<Cr>",
--         focus_location = "o",
--         hover_symbol = "<C-space>",
--         rename_symbol = "r",
--         code_actions = "a",
--     },
--     lsp_blacklist = {},
-- }


-- blacklines
-- vim.cmd "hi IndentBlanklineChar guifg=#383c44"

-- misc --
-- vim.cmd "hi LineNr guifg=#42464e"
-- vim.cmd "hi Comment guifg=#42464e"
-- vim.cmd "hi NvimInternalError guifg=#f9929b"
-- vim.cmd "hi VertSplit guifg=#2a2e36"
-- vim.cmd "hi EndOfBuffer guifg=#1e222a"

-- Pmenu
-- vim.cmd "hi PmenuSel guibg=#98c379"
-- vim.cmd "hi Pmenu  guibg=#282c34"
-- vim.cmd "hi PmenuSbar guibg =#353b45"
-- vim.cmd "hi PmenuThumb guibg =#81A1C1"

-- inactive statuslines as thin splitlines
-- vim.cmd("highlight! StatusLineNC gui=underline guifg=#383c44")

-- line n.o
-- vim.cmd "hi clear CursorLine"
-- vim.cmd "hi cursorlinenr guifg=#abb2bf"

-- git signs ---
-- vim.cmd "hi DiffAdd guifg=#81A1C1 guibg = none"
-- vim.cmd "hi DiffChange guifg =#3A3E44 guibg = none"
-- vim.cmd "hi DiffModified guifg = #81A1C1 guibg = none"

-- NvimTree
-- vim.cmd "hi NvimTreeFolderIcon guifg = #61afef"
-- vim.cmd "hi NvimTreeFolderName guifg = #61afef"
-- vim.cmd "hi NvimTreeIndentMarker guifg=#383c44"
-- vim.cmd "hi NvimTreeNormal guibg=#1b1f27"
-- vim.cmd "hi NvimTreeVertSplit guifg=#1e222a"
-- vim.cmd "hi NvimTreeRootFolder guifg=#f9929b"

-- telescope
-- vim.cmd "hi TelescopeBorder   guifg=#2a2e36"
-- vim.cmd "hi TelescopePromptBorder   guifg=#2a2e36"
-- vim.cmd "hi TelescopeResultsBorder  guifg=#2a2e36"
-- vim.cmd "hi TelescopePreviewBorder  guifg=#525865"

-- LspDiagnostics ---

-- error / warnings
-- vim.cmd "hi LspDiagnosticsSignError guifg=#f9929b"
-- vim.cmd "hi LspDiagnosticsVirtualTextError guifg=#BF616A"
-- vim.cmd "hi LspDiagnosticsSignWarning guifg=#EBCB8B"
-- vim.cmd "hi LspDiagnosticsVirtualTextWarning guifg=#EBCB8B"

-- info
-- vim.cmd "hi LspDiagnosticsSignInformation guifg=#A3BE8C"
-- vim.cmd "hi LspDiagnosticsVirtualTextInformation guifg=#A3BE8C"

-- hint
-- vim.cmd "hi LspDiagnosticsSignHint guifg=#b6bdca"
-- vim.cmd "hi LspDiagnosticsVirtualTextHint guifg=#b6bdca"



-- start colorizer
require('colorizer').setup()


---------------------------------------------------------------------------------
---- nvim-bufferline
---- ----------------------------------------------------------------------------
--require"bufferline".setup{
--	options = {
--			view = "multiwindow",
--			numbers = "buffer_id",
--			-- number_style = "superscript" | "" | { "none", "subscript" }, -- buffer_id at index 1, ordinal at index 2
--			mappings = true,
--			buffer_close_icon= "",
--			modified_icon = "●",
--			close_icon = "",
--			left_trunc_marker = "",
--			right_trunc_marker = "",
--			max_name_length = 18,
--			max_prefix_length = 15, -- prefix used when a buffer is deduplicated
--			tab_size = 18,
--			diagnostics = "nvim_lsp",
--			diagnostics_indicator = function(count, level)
--				return "("..count..")"
--			end,
--			show_buffer_icons = true,
--			show_buffer_close_icons = true,
--			show_close_icon = false,
--			show_tab_indicators = true,
--			persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
--			-- can also be a table containing 2 custom separators
--			-- [focused and unfocused]. eg: { "|", "|" }
--			separator_style = "thin",
--			enforce_regular_tabs = true,
--			always_show_bufferline = true,
--			offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "left"}},
--	}
--}

-------------------------------------------------------------------------------
-- LUA TREE
-- ----------------------------------------------------------------------------
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
  -- default mappings
  vim.g.nvim_tree_bindings = {
    { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
    { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
    { key = "v",                        cb = tree_cb("vsplit") },
    { key = "s",                        cb = tree_cb("split") },
    { key = "t",                        cb = tree_cb("tabnew") },
    { key = "<",                            cb = tree_cb("prev_sibling") },
    { key = ">",                            cb = tree_cb("next_sibling") },
    { key = "P",                            cb = tree_cb("parent_node") },
    { key = "C",                         cb = tree_cb("close_node") },
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
    { key = "q",                            cb = tree_cb("close") },
    { key = "g?",                           cb = tree_cb("toggle_help") },
  }
  local circle = "○"

  -- -- DevIcons
  -- local devIcons = require("nvim-web-devicons")
  -- local override_icons = devIcons.get_icons()
  -- for _, icon in pairs(override_icons) do icon.icon = circle end
  -- devIcons.setup({override = override_icons, default = true})

  -- -- NvimTree
  -- vim.g.nvim_tree_icons = {
  --   default = circle,
  --   symlink = circle,
  --   folder = {
  --     default = circle,
  --     open = circle,
  --     empty = circle,
  --     empty_open = circle,
  --     symlink = circle,
  --     symlink_open = circle
  --   }
  -- }

-- require'nvim-tree.view'.View.width = 50
-- require'nvim-tree'.setup()

-- -------------------------------------------------------------------------- #
-- ----------------- gruvbox ---------------------------------------------------- #
-- -------------------------------------------------------------------------- #
-- vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd([[colorscheme gruvbox]])

-- -------------------------------------------------------------------------- #
-- ----------------- ayu ---------------------------------------------------- #
-- -------------------------------------------------------------------------- #
--[[ vim.g.ayu_overrides = {
  Comment = {fg = '#707A8C'},
  String = {fg = '#E6BA7E'},
  bg = '#18130F'
}
vim.g.ayu_mirage = true ]]

-- -- ----------------- theme -------------------------------------------------- #
vim.g.material_style = 'oceanic'
vim.g.material_italic_comments=true
vim.g.material_italic_keywords=true
vim.g.material_italic_functions=true
vim.g.material_italic_variables=true
vim.g.material_contras=true
vim.g.material_borders=true
vim.g.material_disable_background = true
require('material').set()


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
