-- file handler
FileHandler = {}


function FileHandler:new(filepath)
    local obj = {
        filepath = filepath
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end


function FileHandler:read()
    local file = io.open(self.filepath, "r")
    if file then
        local content = file:read("*a")
        file:close()
        return content
    else
        print("ERR: File Not Found...")
    end
end


function FileHandler:readLines()
    local file = io.open(self.filepath, "r")
    local lns = {}
    if file then
        for line in file:lines() do
            table.insert(lns, line)
        end
        file:close()
        return lns
    else
        print("ERR: File Not Found...")
    end
end


function FileHandler:write(content)
    local file = io.open(self.filepath, "w")
    file:write(content)
    file:close()
end


function FileHandler:writeLines(lns)
    local file = io.open(self.filepath, "w")
    for _,v in pairs(lns) do
        file:write(v.."\n")
    end
    file:close()
end
