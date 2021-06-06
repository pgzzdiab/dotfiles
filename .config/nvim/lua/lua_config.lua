-- -------------------------------------------------------------------------- #
-- Neovim lua configuration
-- -------------------------------------------------------------------------- #

-- -------------------------------------------------------------------------- #
-- ----------------- octo --------------------------------------------------- #
-- -------------------------------------------------------------------------- #
-- require("plenary").setup()
-- require"octo".setup {}
-- require("octo").setup({
  -- date_format = "%Y %b %d %I:%M %p %Z";    -- date format
  -- default_remote = {"upstream", "origin"}; -- order to try remotes
  -- reaction_viewer_hint_icon = "";         -- marker for user reactions
  -- user_icon = " ";                        -- user icon
  -- timeline_marker = "";                   -- timeline marker
  -- timeline_indent = "2";                   -- timeline indentation
  -- right_bubble_delimiter = "";            -- Bubble delimiter
  -- left_bubble_delimiter = "";             -- Bubble delimiter
  -- github_hostname = "";                    -- GitHub Enterprise host
  -- snippet_context_lines = 4;               -- number or lines around commented lines
  -- file_panel = {
  --   size = 10,                             -- changed files panel rows
  --   use_icons = true                       -- use web-devicons in file panel
  -- },
  -- mappings = {
  --   issue = {
  --     close_issue = "<space>ic",           -- close issue
  --     reopen_issue = "<space>io",          -- reopen issue
  --     list_issues = "<space>il",           -- list open issues on same repo
  --     reload = "<C-r>",                    -- reload issue
  --     open_in_browser = "<C-o>",           -- open issue in browser
  --     add_assignee = "<space>aa",          -- add assignee
  --     remove_assignee = "<space>ad",       -- remove assignee
  --     add_label = "<space>la",             -- add label
  --     remove_label = "<space>ld",          -- remove label
  --     goto_issue = "<space>gi",            -- navigate to a local repo issue
  --     add_comment = "<space>ca",           -- add comment
  --     delete_comment = "<space>cd",        -- delete comment
  --     next_comment = "]c",                 -- go to next comment
  --     prev_comment = "[c",                 -- go to previous comment
  --     react_hooray = "<space>rp",          -- add/remove 🎉 reaction
  --     react_heart = "<space>rh",           -- add/remove ❤️ reaction
  --     react_eyes = "<space>re",            -- add/remove 👀 reaction
  --     react_thumbs_up = "<space>r+",       -- add/remove 👍 reaction
  --     react_thumbs_down = "<space>r-",     -- add/remove 👎 reaction
  --     react_rocket = "<space>rr",          -- add/remove 🚀 reaction
  --     react_laugh = "<space>rl",           -- add/remove 😄 reaction
  --     react_confused = "<space>rc",        -- add/remove 😕 reaction
  --   },
  --   pull_request = {
  --     checkout_pr = "<space>po",           -- checkout PR
  --     merge_pr = "<space>pm",              -- merge PR
  --     list_commits = "<space>pc",          -- list PR commits
  --     list_changed_files = "<space>pf",    -- list PR changed files
  --     show_pr_diff = "<space>pd",          -- show PR diff
  --     add_reviewer = "<space>va",          -- add reviewer
  --     remove_reviewer = "<space>vd",       -- remove reviewer request
  --     close_issue = "<space>ic",           -- close PR
  --     reopen_issue = "<space>io",          -- reopen PR
  --     list_issues = "<space>il",           -- list open issues on same repo
  --     reload = "<C-r>",                    -- reload PR
  --     open_in_browser = "<C-o>",           -- open PR in browser
  --     add_assignee = "<space>aa",          -- add assignee
  --     remove_assignee = "<space>ad",       -- remove assignee
  --     add_label = "<space>la",             -- add label
  --     remove_label = "<space>ld",          -- remove label
  --     goto_issue = "<space>gi",            -- navigate to a local repo issue
  --     add_comment = "<space>ca",           -- add comment
  --     delete_comment = "<space>cd",        -- delete comment
  --     next_comment = "]c",                 -- go to next comment
  --     prev_comment = "[c",                 -- go to previous comment
  --     react_hooray = "<space>rp",          -- add/remove 🎉 reaction
  --     react_heart = "<space>rh",           -- add/remove ❤️ reaction
  --     react_eyes = "<space>re",            -- add/remove 👀 reaction
  --     react_thumbs_up = "<space>r+",       -- add/remove 👍 reaction
  --     react_thumbs_down = "<space>r-",     -- add/remove 👎 reaction
  --     react_rocket = "<space>rr",          -- add/remove 🚀 reaction
  --     react_laugh = "<space>rl",           -- add/remove 😄 reaction
  --     react_confused = "<space>rc",        -- add/remove 😕 reaction
  --   },
  --   review_thread = {
  --     goto_issue = "<space>gi",            -- navigate to a local repo issue
  --     add_comment = "<space>ca",           -- add comment
  --     add_suggestion = "<space>sa",        -- add suggestion
  --     delete_comment = "<space>cd",        -- delete comment
  --     next_comment = "]c",                 -- go to next comment
  --     prev_comment = "[c",                 -- go to previous comment
  --     select_next_entry = "]q",            -- move to previous changed file
  --     select_prev_entry = "[q",            -- move to next changed file
  --     close_review_tab = "<C-c>",          -- close review tab
  --     react_hooray = "<space>rp",          -- add/remove 🎉 reaction
  --     react_heart = "<space>rh",           -- add/remove ❤️ reaction
  --     react_eyes = "<space>re",            -- add/remove 👀 reaction
  --     react_thumbs_up = "<space>r+",       -- add/remove 👍 reaction
  --     react_thumbs_down = "<space>r-",     -- add/remove 👎 reaction
  --     react_rocket = "<space>rr",          -- add/remove 🚀 reaction
  --     react_laugh = "<space>rl",           -- add/remove 😄 reaction
  --     react_confused = "<space>rc",        -- add/remove 😕 reaction
  --   },
  --   submit_win = {
  --     approve_review = "<C-a>",            -- approve review
  --     comment_review = "<C-m>",            -- comment review
  --     request_changes = "<C-r>",           -- request changes review
  --     close_review_tab = "<C-c>",          -- close review tab
  --   },
  --   review_diff = {
  --     add_review_comment = "<space>ca",    -- add a new review comment
  --     add_review_suggestion = "<space>sa", -- add a new review suggestion
  --     focus_files = "<leader>e",           -- move focus to changed file panel
  --     toggle_files = "<leader>b",          -- hide/show changed files panel
  --     next_thread = "]t",                  -- move to next thread
  --     prev_thread = "[t",                  -- move to previous thread
  --     select_next_entry = "]q",            -- move to previous changed file
  --     select_prev_entry = "[q",            -- move to next changed file
  --     close_review_tab = "<C-c>",          -- close review tab
  --     toggle_viewed = "<leader><space>",   -- toggle viewer viewed state
  --   },
  --   file_panel = {
  --     next_entry = "j",                    -- move to next changed file
  --     prev_entry = "k",                    -- move to previous changed file
  --     select_entry = "<cr>",               -- show selected changed file diffs
  --     refresh_files = "R",                 -- refresh changed files panel
  --     focus_files = "<leader>e",           -- move focus to changed file panel
  --     toggle_files = "<leader>b",          -- hide/show changed files panel
  --     select_next_entry = "]q",            -- move to previous changed file
  --     select_prev_entry = "[q",            -- move to next changed file
  --     close_review_tab = "<C-c>",          -- close review tab
  --     toggle_viewed = "<leader><space>",   -- toggle viewer viewed state
  --   }
  -- }
-- })

-- -------------------------------------------------------------------------- #
-- ----------------- statusline --------------------------------------------- #
-- -------------------------------------------------------------------------- #
local custom_gruvbox = require'lualine.themes.gruvbox'
	-- Chnage the background of lualine_c section for normal mode
custom_gruvbox.normal.c.bg = '#263238'
-- custom_gruvbox.normal.b.bg = '#090B10'
-- custom_gruvbox.normal.c.bg = '#090B10'
-- custom_gruvbox.normal.a.fg = '607D8B'
-- custom_gruvbox.normal.b.fg = '607D8B'
-- custom_gruvbox.normal.c.fg = '607D8B'

function lspStatus()
  if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
      local error_count = vim.lsp.diagnostic.get_count(0, 'Error')
      local warning_count = vim.lsp.diagnostic.get_count(0, 'Warning')
      local info_count = vim.lsp.diagnostic.get_count(0, 'Information') +  vim.lsp.diagnostic.get_count(0, 'Hint') 
      return ': ' .. error_count .. ': ' .. warning_count .. ': ' .. info_count
  else
      return ''
  end
end

require'lualine'.setup {
	options = {theme=custom_gruvbox},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch'},
		lualine_c = {
			'filename',
			{
				'diagnostics',
				sources = {'nvim_lsp'},
				symbols = {error = ' ', warn = ' ', info = ' '},
				color_error = "#db4b4b",
				color_warn = "#e0af68",
				color_info = "#0db9d7",
			}
		},
		lualine_x = {
			'encoding',
			'fileformat',
			'filetype'
		},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	}
}

---------------------------------------------------------------------------------
---- TELESCOPE
---- ----------------------------------------------------------------------------
--require('telescope').setup{
--  -- defaults = {
--    -- vimgrep_arguments = {
--    --   'rg',
--    --   '--color=never',
--    --   '--no-heading',
--    --   '--with-filename',
--    --   '--line-number',
--    --   '--column',
--    --   '--smart-case'
--    -- },
--    -- prompt_position = "bottom",
--    -- prompt_prefix = "> ",
--    -- selection_caret = "> ",
--    -- entry_prefix = "  ",
--    -- initial_mode = "insert",
--    -- selection_strategy = "reset",
--    -- sorting_strategy = "descending",
--    -- layout_strategy = "horizontal",
--    -- layout_defaults = {
--    --   horizontal = {
--    --     mirror = false,
--    --   },
--    --   vertical = {
--    --     mirror = false,
--    --   },
--    -- },
--    -- file_sorter =  require'telescope.sorters'.get_fuzzy_file,
--    -- file_ignore_patterns = {},
--    -- generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
--    -- shorten_path = true,
--    -- winblend = 0,
--    -- width = 0.75,
--    -- preview_cutoff = 120,
--    -- results_height = 1,
--    -- results_width = 0.8,
--    -- border = {},
--    -- borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
--    -- color_devicons = true,
--    -- use_less = true,
--    -- set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
--    -- file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
--    -- grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
--    -- qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    -- -- Developer configurations: Not meant for general override
    -- buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  -- }
-- }

-- -------------------------------------------------------------------------- #
--  ----------------- lsp --------------------------------------------------- "
-- -------------------------------------------------------------------------- #
local nvim_lsp=require('lspconfig')

-- add linters
-- nvim_lsp.efm.setup {}

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach=function(client, bufnr)
	-- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	-- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts={noremap=true, silent=true }
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', 'gwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	buf_set_keymap('n', 'gwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	buf_set_keymap('n', 'gwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	-- buf_set_keymap('n', 'gv', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	-- buf_set_keymap('n', 'gh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	-- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	-- buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	-- buf_set_keymap('n', 'gra', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	-- buf_set_keymap('n', 'ga', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	-- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	-- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	-- buf_set_keymap('n', '<Leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	-- buf_set_keymap("n", "<Leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

	-- vim.api.nvim_command("autocmd CursorHold <buffer> lua require'lspsaga.diagnostic'.show_line_diagnostics()")
	-- vim.api.nvim_command("autocmd CursorMoved <buffer> lua vim.lsp.util.buf_clear_references()")

end
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers={ "rust_analyzer", "tsserver" }
-- for _, lsp in ipairs(servers) do
-- 	nvim_lsp[lsp].setup { on_attach=on_attach }
-- end

-- require'lspconfig'.pylsp.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.pyright.setup{}

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
local tree_cb = require('nvim-tree.config').nvim_tree_callback
vim.g.nvim_tree_bindings = {
	["<CR>"] = ".YourVimFunction()<cr>",
	["x"] = ":lua require'some_module'.some_function()<cr>",
	["<CR>"]           = tree_cb("edit"),
	["o"]              = tree_cb("edit"),
	["<2-LeftMouse>"]  = tree_cb("edit"),
	["<2-RightMouse>"] = tree_cb("cd"),
	["]"]          = tree_cb("cd"),
	["v"]          = tree_cb("vsplit"),
	["x"]          = tree_cb("split"),
	["t"]          = tree_cb("tabnew"),
	["<"]              = tree_cb("prev_sibling"),
	[">"]              = tree_cb("next_sibling"),
	["u"]           = tree_cb("close_node"),
	["<S-CR>"]         = tree_cb("close_node"),
	["<Tab>"]          = tree_cb("preview"),
	["I"]              = tree_cb("toggle_ignored"),
	["H"]              = tree_cb("toggle_dotfiles"),
	["R"]              = tree_cb("refresh"),
	["a"]              = tree_cb("create"),
	["d"]              = tree_cb("remove"),
	["r"]              = tree_cb("rename"),
	["<C-r>"]          = tree_cb("full_rename"),
	["x"]              = tree_cb("cut"),
	["c"]              = tree_cb("copy"),
	["p"]              = tree_cb("paste"),
	["[c"]             = tree_cb("prev_git_item"),
	["]c"]             = tree_cb("next_git_item"),
	["-"]              = tree_cb("dir_up"),
	["q"]              = tree_cb("close"),
}
-- require'nvim-tree.view'.View.width = 50

-- ----------------- theme -------------------------------------------------- #
vim.g.material_style = 'oceanic'
vim.g.material_italic_comments=true
vim.g.material_italic_keywords=true
vim.g.material_italic_functions=true
vim.g.material_italic_variables=true
vim.g.material_contras=true
vim.g.material_borders=true
vim.g.material_disable_background = true
require('material').set()

