vim.lsp.enable({
  "angularls",
  "c_ls",
  "csharp_ls",
  "ts_ls",
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local opts = { buffer = args.buf }

    vim.keymap.set("n", "<leader>gn", vim.lsp.buf.definition, vim.tbl_extend("force", opts, {
      desc = "Go to definition",
    }))

    vim.keymap.set("n", "<leader>fe", function()
      vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
    end, vim.tbl_extend("force", opts, {
      desc = "Next error",
    }))

    vim.keymap.set("n", "<leader>be", function()
      vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end, vim.tbl_extend("force", opts, {
      desc = "Previous error",
    }))

    vim.keymap.set("n", "<leader>fw", function()
      vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
    end, vim.tbl_extend("force", opts, {
      desc = "Next warning",
    }))

    vim.keymap.set("n", "<leader>bw", function()
      vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
    end, vim.tbl_extend("force", opts, {
      desc = "Previous warning",
    }))

    if client and client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, args.buf, {
        autotrigger = true,
      })
    end
  end,
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
