-- ProperPrint 1.0; Still alpha version! Bugs may occur!
function pprint(text,incl)
    xsize,ysize = term.getSize()
    incl = incl or 0
    inclstring = ""
    for i=1,incl,1 do
        inclstring = " " .. inclstring
    end
    printWithoutLinebreakHelper(text,inclstring,xsize,true)
end
 
function printWithoutLinebreakHelper(text,inclstring,xsize,firstline)
    
    -- Remaining text fits in one line?
    if #inclstring+#text<=xsize then 
        print(inclstring .. text)
        return 
    end
    
    -- Get position for end of line
    lcp = getLastCharPosition(string.sub(text,0,xsize-#inclstring)," ")
    if lcp==nil then
        cutposition = xsize
    else
        cutposition = #inclstring+lcp
    end
    
    -- Print line
    print(string.sub(inclstring .. text,0,cutposition))
    
    -- All lines from second line onwards have two spaces more indentation
    if firstline then
        inclstringnew = inclstring .. " "
    else 
        inclstringnew = inclstring
    end
    
    -- Recursive call to handle remaining Text
    printWithoutLinebreakHelper(string.sub(text,cutposition+1-#inclstring),inclstringnew,xsize,false)
end
 
-- Helper function to get the last position of a character in a string
function getLastCharPosition(string,char)
    index = string.find(string, char .. "[^" .. char .. "]*$")
    return index
end
