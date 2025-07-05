-- XML Builder

XMLBuilder = {}

function XMLBuilder:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function XMLBuilder:createHeader()
    return '<?xml version="1.0" encoding="UTF-8" ?>'
end

function XMLBuilder:genAttributes(attrs)
    local content = ""
    for k,v in pairs(attrs) do
        content = content..' '..k..'="'..v..'"'
    end
    return content
end

function XMLBuilder:genSimpleTag(name, attrs)
    local content = "<"..name
    content = content..XMLBuilder:genAttributes(attrs)
    content = content.."/>"
    return content
end

function XMLBuilder:genDoubleTag(name, attrs, value)
    local content = "<"..name
    content = content..XMLBuilder:genAttributes(attrs)
    content = content..">"..value.."</"..name..">"
    return content
end

function XMLBuilder:dump(filename, dataStr)
    local file = io.open(filename, "w")
    file:write(dataStr)
    file:close()
end
