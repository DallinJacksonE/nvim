return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    config = function()
      local dap = require("dap")

      -- Make sure pwa-chrome adapter exists (should already be there from LazyVim extras)
      if not dap.adapters["pwa-chrome"] then
        dap.adapters["pwa-chrome"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "node",
            args = {
              require("mason-registry").get_package("js-debug-adapter"):get_install_handle()
                .. "/js-debug/src/dapDebugServer.js",
              "${port}",
            },
          },
        }
      end

      -- Add configuration that launches **Chromium** instead of Chrome
      for _, lang in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
        dap.configurations[lang] = dap.configurations[lang] or {}
        -- table.insert(dap.configurations[lang], {
        --   type = "pwa-chrome",
        --   request = "launch",
        --   name = "Launch Chromium (Vite)",
        --   runtimeExecutable = "/usr/bin/chromium", -- ← Change this!
        --   runtimeArgs = { "--no-first-run", "--no-default-browser-check", "--remote-debugging-port=0" },
        --   url = "http://localhost:5173", -- ← your Vite dev server URL
        --   webRoot = vim.fn.getcwd(),
        --   sourceMaps = true,
        --   protocol = "inspector",
        --   skipFiles = { "<node_internals>/**", "**/node_modules/**" },
        -- })
        table.insert(dap.configurations[lang], {
          type = "pwa-chrome",
          request = "attach",
          name = "Attach to Chromium",
          port = 9222, -- ← must match the --remote-debugging-port you used
          webRoot = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
          skipFiles = { "<node_internals>/**", "**/node_modules/**" },
        })
      end
    end,
  },
}
