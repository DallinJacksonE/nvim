return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        hidden = true,
        ignored = true,
        sources = {
          explorer = {
            auto_close = true,
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
