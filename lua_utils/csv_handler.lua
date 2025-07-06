-- CSV HANDLER
-- load a .CSV file with all content in a table 
-- dump a .CSV file with a table data
-- @author: LucaGoubelle

CSVHandler = {}

function CSVHandler:new(delimiter)
    local obj = {
        delimiter = delimiter or ","
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

--------------------------
-- logic methods for read
--------------------------

function CSVHandler:_read(filepath)
    local file = io.open(filepath, "r")
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
    for each in line:gmatch(regex) do
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
-- logic method for write
-----------------------------------

function CSVHandler:_dataToLines(data)
    local lines = {}
    for _,v in pairs(data) do
        local line = table.concat(v, ",")
        table.insert(lines, line)
    end
    return lines
end

function CSVHandler:_linesToStr(lines)
    local str = table.concat(lines, "\n")
    return str
end

function CSVHandler:_write(filepath, str)
    local file = io.open(filepath, "w")
    file:write(str)
    file:close()
end

-----------------------------------
-- CALLABLE METHODS
-----------------------------------

function CSVHandler:load(filepath)
    local lines = CSVHandler:_read(filepath)
    local data = CSVHandler:_mapData(lines)
    return data
end

function CSVHandler:dump(filepath, data)
    local lines = CSVHandler:_dataToLines(data)
    local strData = CSVHandler:_linesToStr(lines)
    CSVHandler:_write(filepath, strData)
end

