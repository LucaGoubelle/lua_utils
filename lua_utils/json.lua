local json = require('cjson')
-- JSON handler
-- handle JSON data, dump / load
-- @author: LucaGoubelle

JSONHandler = {}

function JSONHandler:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function JSONHandler:decode(strJson)
    return json.decode(strJson)
end

function JSONHandler:encode(data)
    return json.encode(data)
end

function JSONHandler:dump(filepath, data)
    local jsonStr = JSONHandler:encode(data)
    local file = io.open(filepath, "w")
    file:write(jsonStr)
    file:close()
end

function JSONHandler:load(filepath)
    local file = io.open(filepath, "r")
    if file then
        local content = file:read("*a")
        file:close()
        return JSONHandler:decode(content)
    else
        print("ERR: File Not Found...")
    end
end