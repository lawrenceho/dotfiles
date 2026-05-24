return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      if not opts.ensure_installed then
        return
      end
      -- List of tools to be excluded
      local ensure_excluded = { "codelldb", "shfmt" }
      -- Filter the ensure_installed list backwards to safely remove multiple items
      for i = #opts.ensure_installed, 1, -1 do
        for _, tool in ipairs(ensure_excluded) do
          if opts.ensure_installed[i] == tool then
            table.remove(opts.ensure_installed, i)
          end
        end
      end
    end,
  },
}
