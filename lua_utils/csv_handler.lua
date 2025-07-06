-- CSV HANDLER
-- load a .CSV file with all content in a table 
-- @author: LucaGoubelle

CSVHandler = {}

function CSVHandler:new(filepath, delimiter)
    local obj = {
        filepath = filepath
        delimiter = delimiter or ","
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

---------------------
-- logic methods
---------------------

function CSVHandler:_read()
    local file = io.open(self.filepath, "r")
    local lns = {}
    if file then
        for line in file:lines() do
            table.insert(lns, line)
        end
        file:close()
        return lns
    else
        print("ERR: file not found...")
    end
end

function CSVHandler:_spliting(line)
    local result = {}
    local regex = ("([^%s]+)"):format(self.delimiter)
    for each in str:gmatch(regex) do
        table.insert(result, each)
    end
    return result
end

function CSVHandler:_mapData(lines)
    local data = {}
    for _,v in pairs(lines) do
        table.insert(data, CSVHandler:_spliting(v))
    end
    return data 
end

-----------------------------------
-- CALLABLE METHODS
-----------------------------------

function CSVHandler:load()
    local lines = CSVHandler:_read()
    local data = CSVHandler:_mapData(lines)
    return data
end

