return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs = true, -- show icons in the signs column
    sign_priority = 8, -- sign priority
    -- keywords recognized as todo comments
    keywords = {
      FIX = {
        icon = " ", -- icon used for the sign, and in search results
        color = "error", -- can be a hex color, or a named color (see below)
        alt = { "#F96F6F", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
        -- signs = false, -- configure signs for some keywords individually
      },
      TODO = { icon = " ", color = "#50E6FF" },
      HACK = { icon = " ", color = "#FFA532" },
      WARN = { icon = " ", color = "#F96F6F", alt = { "WARNING", "XXX" } },
      PERF = { icon = " ", alt = { "#26FF85", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = " ", color = "#9D9DFF", alt = { "INFO" } },
      TEST = { icon = "⏲ ", color = "#D76EFC", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    gui_style = {
      fg = "NONE", -- The gui style to use for the fg highlight group.
      bg = "BOLD", -- The gui style to use for the bg highlight group.
    },
    merge_keywords = true, -- when true, custom keywords will be merged with the defaults
    -- highlighting of the line containing the todo comment
    -- * before: highlights before the keyword (typically comment characters)
    -- * keyword: highlights of the keyword
    -- * after: highlights after the keyword (todo text)
    highlight = {
      multiline = true, -- enable multine todo comments
      multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
      multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
      before = "", -- "fg" or "bg" or empty
      keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
      after = "fg", -- "fg" or "bg" or empty
      pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
      comments_only = true, -- uses treesitter to match keywords in comments only
      max_line_len = 400, -- ignore lines longer than this
      exclude = {}, -- list of file types to exclude highlighting
    },
    -- list of named colors where we try to extract the guifg from the
    -- list of highlight groups or use the hex color if hl not found as a fallback
    colors = {
      error = { "DiagnosticError", "ErrorMsg", "#F96F6F" },
      warning = { "DiagnosticWarn", "WarningMsg", "#FFA532" },
      info = { "DiagnosticInfo", "#50E6FF" },
      hint = { "DiagnosticHint", "#26FF85" },
      default = { "Identifier", "#9D9DFF" },
      test = { "Identifier", "#D76EFC" },
    },
    search = {
      command = "rg",
      args = {
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
      },
      -- regex that will be used to match keywords.
      -- don't replace the (KEYWORDS) placeholder
      pattern = [[\b(KEYWORDS):]], -- ripgrep regex
      -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
    },
  },
  config = function()
    local todo_comments = require("todo-comments")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "]t", function()
      todo_comments.jump_next()
    end, { desc = "Next todo comment" })

    keymap.set("n", "[t", function()
      todo_comments.jump_prev()
    end, { desc = "Previous todo comment" })

    todo_comments.setup()

    -- 🎨 Overriding colors, otherwise it doesn't apply
    vim.cmd([[
      " Foreground colors
      highlight TodoFgFIX guifg=#F96F6F
      highlight TodoFgTODO guifg=#50E6FF
      highlight TodoFgHACK guifg=#EED59E
      highlight TodoFgWARN guifg=#FFA532
      highlight TodoFgPERF guifg=#26FF85
      highlight TodoFgNOTE guifg=#9D9DFF
      highlight TodoFgTEST guifg=#D76EFC

      " Background colors
      highlight TodoBgFIX guibg=#4B2C2C guifg=#F96F6F
      highlight TodoBgTODO guibg=#1F3A5F guifg=#50E6FF
      highlight TodoBgHACK guibg=#B88A47 guifg=#EED59E
      highlight TodoBgWARN guibg=#4E2D00 guifg=#FFA532
      highlight TodoBgPERF guibg=#1E4D36 guifg=#26FF85
      highlight TodoBgNOTE guibg=#2E2A4E guifg=#9D9DFF
      highlight TodoBgTEST guibg=#3A1E4E guifg=#D76EFC

      " Signs (for the gutter column)
      highlight TodoSignFIX guibg=NONE guifg=#F96F6F
      highlight TodoSignTODO guibg=NONE guifg=#50E6FF
      highlight TodoSignHACK guibg=NONE guifg=#EED59E
      highlight TodoSignWARN guibg=NONE guifg=#FFA532
      highlight TodoSignPERF guibg=NONE guifg=#26FF85
      highlight TodoSignNOTE guibg=NONE guifg=#9D9DFF
      highlight TodoSignTEST guibg=NONE guifg=#D76EFC
    ]])
  end,
}
