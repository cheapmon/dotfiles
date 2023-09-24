function search_and_replace(from, to)
  vim.cmd("grep " .. from)
  vim.cmd("cfdo %s/" .. from .. "/" .. to .. "/ge | update")
end
