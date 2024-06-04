local function tableMerge(t1, t2)
  for k, v in pairs(t2) do
    if type(v) == "table" then
      if type(t1[k] or false) == "table" then
        t1[k] = tableMerge(t1[k] or {}, t2[k] or {})
      else
        t1[k] = v
      end
    else
      t1[k] = v
    end
  end
  return t1
end

local opts = function()
  local Offset = require("bufferline.offset")
  if not Offset.edgy then
    local get = Offset.get
    Offset.get = function()
      if package.loaded.edgy then
        local layout = require("edgy.config").layout
        local ret = { left = "", left_size = 0, right = "", right_size = 0 }
        for _, pos in ipairs({ "left", "right" }) do
          local sb = layout[pos]
          if sb and #sb.wins > 0 then
            local title = " Sidebar" .. string.rep(" ", sb.bounds.width - 8)
            ret[pos] = "%#EdgyTitle#" .. title .. "%*" .. "%#WinSeparator#│%*"
            ret[pos .. "_size"] = sb.bounds.width
          end
        end
        ret.total_size = ret.left_size + ret.right_size
        if ret.total_size > 0 then
          return ret
        end
      end
      return get()
    end
    Offset.edgy = true
  end
end

require("bufferline").setup(tableMerge(opts() or {}, {
  highlights = require("catppuccin.groups.integrations.bufferline").get(),
}))
