require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

vim.filetype.add({
  filename = {
    ["nginx.conf"] = "nginx",
  },
  pattern = {
    [".*/nginx/.*%.conf$"] = "nginx",
    [".*/nginx/conf%.d/.*%.conf$"] = "nginx",
    [".*/sites%-available/.*$"] = "nginx",
    [".*/sites%-enabled/.*$"] = "nginx",
  },
})

vim.filetype.add({
  pattern = {
    [".*%.sh$"] = "sh",
  },
})
