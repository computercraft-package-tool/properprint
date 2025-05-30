--[[ 
	ProperPrint Library for ComputerCraft
	Authors: PentagonLP, SkyTheCodeMaster
	Version: 1.1
]]

--[[ ProperPrint library module
]]
local properprint = {}

--[[ Get last position of character in string
    @param String string: The string to search
    @param String char: The char to search for
    @return Number|nil index: The last position of the character in the string, or nil if the character is not found
]]
local function getLastCharPosition(string, char)
    return string.find(string, char .. "[^" .. char .. "]*$")
end

--[[ Recursive helper function to split the input string into lines and print them
    @param String text: The full string tp print
    @param String inclstring: string consisting of spaces to provide initial indentation
    @param Number xsize: The Number of characters that can fit in one line in the terminal
    @param Boolean firstline: Whether the line to print is the first line of the string (used for indentation)
]]
local function printWithoutLinebreakHelper(text, inclstring, xsize, firstline)

    -- Remaining text fits in one line?
    if (#inclstring + #text) <= xsize then
        print(inclstring .. text)
        return
    end

    -- Get position for end of line
    local lcp = getLastCharPosition(string.sub(text, 0, xsize - #inclstring)," ")
    local cutposition
    if lcp == nil then
        cutposition = xsize
    else
        cutposition = #inclstring + lcp
    end
    
    -- Print line
    print(string.sub(inclstring .. text, 0, cutposition))
    
    -- All lines from second line onwards have one space more indentation
    local inclstringnew
    if firstline then
        inclstringnew = inclstring .. " "
    else 
        inclstringnew = inclstring
    end
    
    -- Recursive call to handle remaining Text
    printWithoutLinebreakHelper(string.sub(text, cutposition + 1 - #inclstring), inclstringnew, xsize, false)
end

--[[ Print a string with correct linebreaking at spaces and custom indentation
    @param String text: The string to print
    @param Number incl: The default indentation, offset from the left edge of the terminal
]]
function properprint.pprint(text, incl)
    incl = incl or 0

    local xsize = term.getSize()

    -- Build string consisting of spaces for indentation according to the 'incl' parameter
    local inclstring = ""
    for _ = 1, incl, 1 do
        inclstring = " " .. inclstring
    end

    printWithoutLinebreakHelper(text, inclstring, xsize, true)
end

return properprint