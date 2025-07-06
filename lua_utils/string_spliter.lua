-- StringSpliter
StringSpliter = {}

function StringSpliter:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end


function StringSpliter:split(str, sep)
   local result = {}
   local regex = ("([^%s]+)"):format(sep)
   for each in str:gmatch(regex) do
      table.insert(result, each)
   end
   return result
end
