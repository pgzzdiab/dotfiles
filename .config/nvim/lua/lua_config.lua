-- -------------------------------------------------------------------------- #
-- Neovim lua configuration
-- -------------------------------------------------------------------------- #

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
-- require('kommentary.config')
require('Comment').setup()

-- -------------------------------------------------------------------------- #
--  ----------------- treesitter-textobjects -------------------------------- #
-- -------------------------------------------------------------------------- #
require "nvim-treesitter"
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
  -- indent = {
    -- enable = true
  -- },
  rainbow = {
    enable = true,
    extended_mode = true,
    colors = {'#FFCC00', '#82AAFF', '#fe8019'},
  },

}

-- -------------------------------------------------------------------------- #
--  ----------------- nvim-cmp ---------------------------------------------- #
-- -------------------------------------------------------------------------- #
local cmp = require'cmp'
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
cmp.setup({
  snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
  experimental = {
    ghost_text = true,
  },
  documentation = {
    -- border = "rounded",
    winhighlight = "Normal:CmpDocumentation,FloatBorder:CmpDocumentationBorder",
    -- maxwidth = require('core.utils').fix_width(0, 0.9),
    -- maxheight = require('core.utils').fix_height(0, 0.9)
  },
  mapping = {
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    -- ['<CR>'] = cmp.mapping.confirm({
    --   behavior = cmp.ConfirmBehavior.Replace,
    --   select = true,
    -- })
  },
  formatting = {
        format = function(entry, item)
            item.kind = lsp_symbols[item.kind]
            item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                neorg = "[Neorg]",
            })[entry.source.name]

            return item
        end,
    },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'ultisnips' },
    { name = 'path' },
  }
})

-- cmp.setup.cmdline('/', {
--     sources = {
--       { name = 'buffer' }
--     }
-- })
-- -- Use cmdline & path source for ':'.
--   cmp.setup.cmdline(':', {
--     sources = cmp.config.sources({
--       { name = 'path' }
--     }, {
--       { name = 'cmdline' }
--     })
--  })

-- -------------------------------------------------------------------------- #
--  ----------------- gps --------------------------------------------------- "
-- -------------------------------------------------------------------------- #
require("nvim-gps").setup()
-- require("nvim-gps").setup({
-- 	icons = {
-- 		["class-name"] = ' ',      -- Classes and class-like objects
-- 		["function-name"] = ' ',   -- Functions
-- 		["method-name"] = ' ',     -- Methods (functions inside class-like objects)
-- 		["container-name"] = '⛶ ',  -- Containers (example: lua tables)
-- 		["tag-name"] = '炙'         -- Tags (example: html tags)
-- 	},
-- 	-- Add custom configuration per language or
-- 	-- Disable the plugin for a language
-- 	-- Any language not disabled here is enabled by default
-- 	languages = {
-- 		-- ["bash"] = false, -- disables nvim-gps for bash
-- 		-- ["go"] = false,   -- disables nvim-gps for golang
-- 		-- ["ruby"] = {
-- 		--	separator = '|', -- Overrides default separator with '|'
-- 		--	icons = {
-- 		--		-- Default icons not specified in the lang config
-- 		--		-- will fallback to the default value
-- 		--		-- "container-name" will fallback to default because it's not set
-- 		--		["function-name"] = '',    -- to ensure empty values, set an empty string
-- 		--		["tag-name"] = ''
-- 		--		["class-name"] = '::',
-- 		--		["method-name"] = '#',
-- 		--	}
-- 		--}
-- 	},
-- 	separator = ' > ',
-- })

-- -------------------------------------------------------------------------- #
--  ----------------- lsp --------------------------------------------------- "
-- -------------------------------------------------------------------------- #
local nvim_lsp=require('lspconfig')



-- local on_attach=function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	-- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
	-- Mappings.
	-- local opts={noremap=true, silent=true }
	-- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	-- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	-- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	-- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	-- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	-- buf_set_keymap('n', 'gv', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
-- 	buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
-- 	buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
-- 	buf_set_keymap('n', 'gwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
-- 	buf_set_keymap('n', 'gwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
-- 	buf_set_keymap('n', 'gwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
-- 	buf_set_keymap('n', 'gv', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
-- 	buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
-- 	buf_set_keymap('n', 'gra', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
-- 	buf_set_keymap('n', 'ga', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
-- 	buf_set_keymap('n', '<Leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
-- 	buf_set_keymap("n", "<Leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
-- end

-- replace the default lsp diagnostic letters with prettier symbols
vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})


-- local coq = require("coq")
-- nvim_lsp.pyright.setup(coq.lsp_ensure_capabilities())

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
nvim_lsp.pyright.setup{
    capabilities = capabilities
}
nvim_lsp.cmake.setup{
    capabilities = capabilities
}

-- remove underlying on diagnostic
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics,
	{
		underline = false,
		update_in_insert = true,
		virtual_text = false
	}
)

-- -------------------------------------------------------------------------- #
--  ----------------- hop ----------------------------------------------- #
-- -------------------------------------------------------------------------- #
require'hop'.setup()
  -- keys = 'aqwsderfvgtnhuipjmnklo',
vim.api.nvim_set_keymap('n', 'fj', "<cmd>lua require'hop'.hint_words()<cr>", {})
vim.api.nvim_set_keymap('n', 'fk', "<cmd>lua require'hop'.hint_char2()<cr>", {})
vim.api.nvim_set_keymap('n', 'fl', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})

-- -------------------------------------------------------------------------- #
--  ----------------- lspkind ----------------------------------------------- #
-- -------------------------------------------------------------------------- #
-- require('lspkind').init()

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
--  ----------------- neogit -------------------------------------------- "
-- -------------------------------------------------------------------------- #
require('neogit').setup {}

-- -------------------------------------------------------------------------- #
--  ----------------- lightspeed -------------------------------------------- "
-- -------------------------------------------------------------------------- #
-- require'lightspeed'.setup {
  -- jump_to_first_match = true,
  -- jump_on_partial_input_safety_timeout = 400,
  -- -- This can get _really_ slow if the window has a lot of content,
  -- -- turn it on only if your machine can always cope with it.
  -- highlight_unique_chars = false,
  -- grey_out_search_area = true,
  -- match_only_the_start_of_same_char_seqs = true,
  -- limit_ft_matches = 5,
  -- x_mode_prefix_key = '<c-x>',
  -- substitute_chars = { ['\r'] = '¬' },
  -- instant_repeat_fwd_key = nil,
  -- instant_repeat_bwd_key = nil,
  -- -- If no values are given, these will be set at runtime,
  -- -- based on `jump_to_first_match`.
  -- labels = nil,
  -- cycle_group_fwd_key = nil,
  -- cycle_group_bwd_key = nil,
-- }

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
    auto_fold = true, -- automatically fold a file trouble list at creation
    -- use_lsp_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
	-- },
    -- lsp_blacklist = {}
}




-- -------------------------------------------------------------------------- #
-- ---------------- colorizer ----------------------------------------------- #
-- -------------------------------------------------------------------------- #
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
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable      = false,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd  = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {}
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd  = nil,
    -- the command arguments as a list
    args = {}
  },

  view = {
    -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
    width = 30,
    -- height of the window, can be either a number (columns) or a string in `%`, for top or bottom side placement
    height = 30,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    -- if true the tree will resize itself after opening a file
    auto_resize = false,
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {}
    }
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
  Search = {fg = '#7CB0E6', bg = '#33415E'},
  -- IncSearch = {fg = '#E6BA7E', bg = '#0D1016'},
  }
})


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
-- ----------------- \<windline\> -------------------------------------------- #
-- -------------------------------------------------------------------------- #
require('wlsample.mybubble')

-- -------------------------------------------------------------------------- #
--  ----------------- cokeline -------------------------------------------- "
-- -------------------------------------------------------------------------- #
local get_hex = require('cokeline/utils').get_hex

require('cokeline').setup({
  default_hl = {
    focused = {
      fg = get_hex('Normal', 'fg'),
      bg = "none",
    },
    unfocused = {
      fg = get_hex('Comment', 'fg'),
      bg = "none",
    },
  },

  components = {
    {
      text = '',
      -- let g:airline_left_alt_sep = ''
      -- let g:airline_right_alt_sep = ''
      --content = "%{T3}%{T-}"
      --content = "%{T3}%{T-}"
      hl = {
          bg = function(buffer)
              if buffer.is_focused then
                  return "#CBCCC6"
              else
                  return "#1F2430"
              end
          end,
          fg = function(buffer)
              if buffer.is_focused then
                  return "#1F2430"
              else
                  return "#1F2430"
              end
              if buffer.is_modified then
                  return "#BAE67E"
              end
          end,
      },
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

      hl = {
          bg = function(buffer)
              if buffer.is_focused then
                  return "#CBCCC6"
              else
                  return "#1F2430"
              end
          end,
          fg = function(buffer)
              if buffer.is_focused then
                  return "#1F2430"
              else
                  return "#707A8C"
              end
              if buffer.is_modified then
                  return "#BAE67E"
              end
          end,
      },
    },
    {
      text = function(buffer) return buffer.unique_prefix end,
      hl = {
          bg = function(buffer)
              if buffer.is_focused then
                  return "#CBCCC6"
              else
                  return "#1F2430"
              end
          end,
          fg = function(buffer)
              if buffer.is_focused then
                  return "#1F2430"
              else
                  return "#707A8C"
              end
              if buffer.is_modified then
                  return "#BAE67E"
              end
          end,
      },
    },
    -- {
    --   text = function(buffer) return buffer.filename .. '' end,
    --   hl = {
    --     style = function(buffer) return buffer.is_focused and 'bold' or nil end,
    --   },
    -- },
    {
      text = function(buffer)
          return buffer.filename .. ' '
      end,
      hl = {
          bg = function(buffer)
              if buffer.is_focused then
                  return "#CBCCC6"
              else
                  return "#1F2430"
              end
          end,
          fg = function(buffer)
              if buffer.is_focused then
                  return "#1F2430"
              else
                  return "#707A8C"
              end
              if buffer.is_modified then
                  return "#BAE67E"
              end
          end,
      }
    },
    {
      text = function(buffer)
        if buffer.is_readonly then
          return " 🔒"
        end
        if buffer.is_modified then
          return " + "
        end
          return ""
        end
    },
    {
      text = '',
      -- content = "%{T3}%{T-}"
      hl = {
          bg = function(buffer)
              if buffer.is_focused then
                  return "#CBCCC6"
              else
                  return "#1F2430"
              end
          end,
          fg = function(buffer)
              if buffer.is_focused then
                  return "#1F2430"
              else
                  return "#1F2430"
              end
              if buffer.is_modified then
                  return "#BAE67E"
              end
          end,
      },
    },
  },
})



