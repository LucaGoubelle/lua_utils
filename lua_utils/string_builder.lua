-- string builder
-- build string with provided instance
-- @author: LucaGoubelle

StringBuilder = {}

function StringBuilder:new()
    local obj = {
        content = ""
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function StringBuilder:append(content)
    self.content = self.content..content
    return self
end

function StringBuilder:toString()
    return self.content
end

