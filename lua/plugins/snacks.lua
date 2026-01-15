return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            auto_close = true,
            files = { hidden = true },
          },
        },
      },
      image = {
        -- image
      },
      dashboard = {
        preset = {
          pick = function(cmd, opts)
            return LazyVim.pick(cmd, opts)()
          end,
          header = [[
                            
              (\.   \      ,/)
              \(   |\     )/
              //\  | \   /\\
              (/ /\_#oo#_/\ \)
              \/\  ####  /\/
               `##'


          ]],
        },
      },
    },
  },
}
