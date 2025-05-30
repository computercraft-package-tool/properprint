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

--[[ Print a string with correct linebreaking at spaces and custom indentation
    @param String text: The string to print
    @param Number incl: The default indentation, offset from the left edge of the terminal
]]
function properprint.pprint(text, defaultindentation, nextlineindendation)
    defaultindentation = defaultindentation or 0
    nextlineindendation = nextlineindendation or 1

    local xsize = term.getSize()

    -- Build string consisting of spaces for indentation according to the 'defaultindentation' and 'nextlineindendation' parameter
    local defaultindentationstring = ""
    for _ = 1, defaultindentation, 1 do
        defaultindentationstring = defaultindentationstring .. " "
    end

    local nextlineindendationstring = ""
    for _ = 1, nextlineindendation, 1 do
        nextlineindendationstring = nextlineindendationstring .. " "
    end

    local firstline = true

    -- For all terminal lines...
    while not (#text == 0)  do

        -- Use 'nextlineindendation' everywhere, exept the first line
        local lineindentationstring = defaultindentationstring
        if not firstline then
            lineindentationstring = defaultindentationstring .. nextlineindendationstring
        end

        local lastcharinlineindex, firstcharinnextlineindex
        local spacetofitin = xsize - #lineindentationstring
        -- Find last space character in the terminal line, if there is one
        local spacecharposition = getLastCharPosition(string.sub(text, 1, spacetofitin), " ")
        --[[ If text fits in one line, or the first word (character sequence up to the first space) is
            longer then the line, do a conventional linebreak at the end of the terminal line

            -----spacetofitin----
            abcdefghijklmnop
                                ^^
            -----spacetofitin----
            abcdefghijklmnopqrstuvwxyz
                                ^^
        ]]
        if (spacetofitin >= #text) or (spacecharposition == nil) then
            lastcharinlineindex = spacetofitin
            firstcharinnextlineindex = spacetofitin + 1
        --[[ If text does not fit in one line, but contains a space character before the end of the
            terminal line, break at the space

            -----spacetofitin----
            abcdef ghijkl mnop qrstuvw
                             ^ ^
        ]]
        else
            lastcharinlineindex = spacecharposition - 1
            firstcharinnextlineindex = spacecharposition + 1
        end

        -- Print the first line and chop it off of the remaining text
        print(lineindentationstring .. string.sub(text, 1, lastcharinlineindex))
        text = string.sub(text, firstcharinnextlineindex)

        firstline = false
    end
end

return properprint