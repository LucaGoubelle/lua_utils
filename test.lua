-- require "lua_utils.file_handler"
-- require "lua_utils.string_builder"
-- require "lua_utils.copy"
-- require "lua_utils.json"
-- require "lua_utils.xml_builder"
require "lua_utils.string_spliter"

-- test files

-- local fh = FileHandler:new("res/test.txt")
-- local lines = fh:readLines()
-- for k,v in pairs(lines) do
--     print(k.." : "..v)
-- end


-- local content = {"tutu","tyty","tata"}
-- local fh2 = FileHandler:new("res/test2.txt")
-- fh2:writeLines(content)

-- test string builder

-- local sb = StringBuilder:new()
-- local result = sb:append("tyty"):append("_toto"):toString()
-- print(result)

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

-- test json

-- local dataJson = {foo="bar", baz="bas"}
-- local jsonHandler = JSONHandler:new()
-- jsonHandler:dump("res/sample.json", dataJson)

-- local jsonData = jsonHandler:load("res/sample.json")
-- for k,v in pairs(jsonData) do
--     print(k.." : "..v)
-- end

---------------------
-- test XMLBuilder
---------------------

-- local xmlB = XMLBuilder:new()

-- local valueInside = "Some text here..."
-- local attrs = {foo="bar", baz="bas"}

-- local content = xmlB:createHeader()
-- content = content.."\n"..xmlB:genDoubleTag("data", attrs, valueInside)
-- print(content)

-- xmlB:dump("res/sample.xml", content)

-----------------------
-- string spliter test
-----------------------

local str = "tyty tata toto"
local ss = StringSpliter:new()
local tab = ss:split(str, " ")

for _,v in pairs(tab) do
    print(v)
end
