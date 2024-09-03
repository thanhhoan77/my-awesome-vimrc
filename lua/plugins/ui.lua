return {
  {
    "goolord/alpha-nvim",
    dependencies = {
      "echasnovski/mini.icons",
      "nvim-lua/plenary.nvim",
      { "MaximilianLloyd/ascii.nvim", dependencies = { "MunifTanjim/nui.nvim" } },
    },
    config = function()
      -- ascii nvim lib
      -- local ascii = require("ascii")
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      local local_ascii = require("plugins.config.asciis").ascii_1
      local height = 4
      local_ascii = string.rep("\n", height) .. local_ascii .. "\n"

      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

      -- Highlight groups
      dashboard.section.footer.opts.hl = "Type"
      dashboard.section.header.opts.hl = "Include"
      dashboard.section.buttons.opts.hl = "Keyword"

      dashboard.section.header.val = vim.split(local_ascii, "\n")
      dashboard.section.buttons.val = {
        dashboard.button("e", "  New blank file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("q", "󰿅  Quit", ":qa<CR>"),
      }
      dashboard.section.footer.val = "𝕩 Loaded "
        .. stats.loaded
        .. "/"
        .. stats.count
        .. " plugins in "
        .. ms
        .. "ms 𝕩"

      alpha.setup(dashboard.opts)
    end,
  },
  -- {
  --   "nvimdev/dashboard-nvim",
  --   lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
  --   dependencies = {
  --     { "MaximilianLloyd/ascii.nvim", dependencies = { "MunifTanjim/nui.nvim" } },
  --   },
  --   opts = function()
  --     local logo = [[
  --   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆
  --    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦
  --      ⠈   ⠈⢿⣿⣟⠦⠄⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄
  --           ⣸⣿⣿⢧⠄⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄
  --          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀
  --   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿
  --  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷⠄  ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄
  -- ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄
  -- ⠙⠃   ⣼⣿⡟⠌ ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿⠐⣿⣿⡇ ⠛⠻⢷⣄
  --      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆   ⠁
  --       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣀⣤⣾⡿⠃
  -- ⢀⣀⠀⣠⣀⣠⣾⣿⣿⡿⠛⠋⠉⠉⠉   ⠉⠉⠉⠉⠛⠻⣿⣿⣷⣄⣀⢿⡽⢻⣦
  -- ⠻⠶⠾⠿⠿⠿⠋⠉   @thanhhoann   ⠉⠻⠿⠿⠿⠿⠿⠋
  --
  -- 𝔎 I FIGHT, so I SURVIVE 𝔎
  --     ]]
  --
  --     logo = string.rep("\n", 8) .. logo .. "\n"
  --     local ascii = require("ascii")
  --
  --     local opts = {
  --       theme = "doom",
  --       hide = {
  --         -- this is taken care of by lualine
  --         -- enabling this messes up the actual laststatus setting after loading a file
  --         statusline = false,
  --       },
  --       config = {
  --         -- header = vim.split(logo, "\n"),
  --         header = ascii.get_random_global(),
  --
  --         -- stylua: ignore
  --         center = {
  --           { action = function () vim.api.nvim_input("<cmd>enew<cr>") end, desc = " New scratch file", icon = " ", key = "n" },
  --           { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit", icon = "󰿅 ", key = "q" },
  --         },
  --         footer = function()
  --           local stats = require("lazy").stats()
  --           local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
  --           return { "𝕩 Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms 𝕩" }
  --         end,
  --       },
  --     }
  --
  --     for _, button in ipairs(opts.config.center) do
  --       button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
  --       button.key_format = "  %s"
  --     end
  --
  --     -- close Lazy and re-open when the dashboard is ready
  --     if vim.o.filetype == "lazy" then
  --       vim.cmd.close()
  --       vim.api.nvim_create_autocmd("User", {
  --         pattern = "DashboardLoaded",
  --         callback = function()
  --           require("lazy").show()
  --         end,
  --       })
  --     end
  --
  --     return opts
  --   end,
  -- },
  --
  -- {
  --   "rcarriga/nvim-notify",
  --   opts = {
  --     -- timeout = 1000,
  --     -- render = "compact",
  --     -- max_height = function()
  --     --   return math.floor(vim.o.lines * 0.75)
  --     -- end,
  --     -- max_width = function()
  --     --   return math.floor(vim.o.columns * 0.25)
  --     -- end,
  --     -- on_open = function(win)
  --     --   vim.api.nvim_win_set_config(win, { zindex = 100 })
  --     -- end,
  --   },
  -- },
  --
  -- -- Floating filename
  -- {
  --   "b0o/incline.nvim",
  --   event = "BufReadPre",
  --   priority = 1200,
  --   config = function()
  --     require("incline").setup({
  --       highlight = {
  --         groups = {
  --           -- InclineNormal = { guibg = "#303270", guifg = "#a9b1d6" },
  --           InclineNormalNC = { guibg = "none", guifg = "#a9b1d6" },
  --         },
  --       },
  --       window = {
  --         placement = { vertical = "bottom", horizontal = "center" },
  --         margin = { vertical = 0, horizontal = 0 },
  --         padding = 5,
  --       },
  --       hide = { cursorline = true },
  --       render = function(props)
  --         local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
  --         if vim.bo[props.buf].modified then
  --           filename = "[unsaved] " .. filename
  --         end
  --
  --         local function diagnostic_label()
  --           local icons = { error = "", warn = "", info = "", hint = "" }
  --           local label = {}
  --
  --           for severity, icon in pairs(icons) do
  --             local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
  --             if n > 0 then
  --               table.insert(label, { icon .. " " .. n .. " ", group = "DiagnosticSign" .. severity })
  --             end
  --           end
  --           if #label > 0 then
  --             table.insert(label, { "┊ " })
  --           end
  --           return label
  --         end
  --
  --         local icon, color = require("nvim-web-devicons").get_icon_color(filename)
  --
  --         return {
  --           { diagnostic_label() },
  --           { icon, guifg = color },
  --           { " " },
  --           { filename },
  --           { guibg = "none" },
  --         }
  --       end,
  --     })
  --   end,
  -- },
  --
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = " "
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    opts = function()
      -- PERF: we don't need this lualine require madness 🤷
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      local icons = require("lazyvim.config").icons
      local Util = require("lazyvim.util")

      vim.o.laststatus = vim.g.lualine_laststatus

      return {
        options = {
          theme = "auto",
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
        },
        sections = {
          lualine_a = {
            { "mode" },
            {
              function()
                local ok, m = pcall(require, "better_escape")
                return ok and m.waiting and "𝔥" or ""
              end,
            },
            -- {
            --   require("package-info").get_status,
            --   color = Util.ui.fg("Statement"),
            -- },
          },
          lualine_b = {
            { "branch" },
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = Util.ui.fg("Special"),
            },
          },
          lualine_c = {
            {
              function()
                return require("noice").api.status.command.get()
              end,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.command.has()
              end,
              color = Util.ui.fg("Statement"),
            },
            {
              function()
                return require("noice").api.status.mode.get()
              end,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.mode.has()
              end,
              color = Util.ui.fg("Constant"),
            },
          },
        },
      }
    end,
  },
}
