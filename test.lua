require "lua_utils.file_handler"
require "lua_utils.string_builder"
require "lua_utils.copy"

-- test files

-- local fh = FileHandler:new("res/test.txt")
-- print(fh:read())

-- local content = "tutu\ntyty\ntata"
-- local fh2 = FileHandler:new("res/test2.txt")
-- fh2:write(content)

-- test string builder

local sb = StringBuilder:new()
local result = sb:append("tyty"):append("_toto"):toString()
print(result)

-- test deepcopy

-- local a = {"tyty","tata","toto"}
-- local b = deepcopy(a)

-- a[1] = "tutu"
-- for _,v in pairs(a) do
--     print(v)
-- end
-- print("\n")
-- for _,v in pairs(b) do
--     print(v)
-- end
