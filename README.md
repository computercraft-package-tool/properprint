# ProperPrint
![projectstage](https://img.shields.io/badge/project%20stage-release-green)
![projectstage](https://img.shields.io/badge/version-1.1-green)
[![license](https://img.shields.io/github/license/computercraft-package-tool/properprint)](https://github.com/computercraft-package-tool/properprint/blob/main/LICENSE)
[![issues](https://img.shields.io/github/issues/computercraft-package-tool/properprint)](https://github.com/computercraft-package-tool/properprint/issues)<br>
[![contributors](https://img.shields.io/github/contributors/computercraft-package-tool/properprint)](https://github.com/computercraft-package-tool/properprint/graphs/contributors)
[![activity](https://img.shields.io/github/commit-activity/m/computercraft-package-tool/properprint)](https://github.com/computercraft-package-tool/properprint/commits/main)
[![lastcommit](https://img.shields.io/github/last-commit/computercraft-package-tool/properprint)](https://github.com/computercraft-package-tool/properprint/commits/main)<br>
![size](https://img.shields.io/github/languages/code-size/computercraft-package-tool/properprint)
![files](https://img.shields.io/github/directory-file-count/computercraft-package-tool/properprint)
![languages](https://img.shields.io/github/languages/count/computercraft-package-tool/properprint)<br>

Library for the minecraft mod **ComputerCraft/CC: Tweaked** to print in terminal with indentation  

## How to install 
ProperPrint can be installed using the [ComputerCraft Package Tool](https://github.com/computercraft-package-tool/ccpt) by using the following commands:

Install CCPT, only run if you havn't installed it yet:
```
pastebin run syAUmLaF
```
If you install CCPT, this library will also be installed as CCPT depends on it. The library has the ccpt ID "pprint":
```
ccpt info pprint
```
The library will now be stored in "/lib/properprint.lua".

## How to use
### 1. **Include in your project**

The ProperPrint library can be included in your project by using the older ```dofile(...)```-method, or the newer ```require(...)```-method (availible only in [CC: Tweaked](https://tweaked.cc/)):

```lua
-- Using dofile(...)
local properprint = dofile("/lib/properprint.lua")
-- Using require(...)
local properprint = require("lib.properprint")
```

In both instances, the methods of the library can be accessed as members of the return value of the method, e.g. ```properprint.pprint(...)```.

**Using *os.loadAPI("lib/properprint")* in order to include the library won't work anymore!** See also [deprecation notice](https://tweaked.cc/module/os.html#v:loadAPI) of the method.

### 2. Printing a block of text
When using the function **properprint.pprint([texttoprint])**, every line from the second line onwards gets indendented for better readability. By default, the lines are indendented by one character.

Content of "*test*":
```lua
local properprint = require("lib.properprint")
properprint.pprint("The quick brown fox jumps over the lazy dog. He broke his legs in the process.")
```
Output:
<br><img
    alt="test1"
    src="https://raw.githubusercontent.com/computercraft-package-tool/properprint/main/img/properprint_test.png"
/><br>  
### 3. Setting the overall indentation amount
The function **properprint.pprint([texttoprint],[defaultindentation])** takes an optional parameter, specifying the default indentation. The overall format remains, but every line has the specified amount of characters as indentation added on top.

Content of "*test2*":
```lua
local properprint = require("lib.properprint")
properprint.pprint("The quick brown fox jumps over the lazy dog. He broke his legs in the process.", 5)
```
Output:
<br><img
    alt="test2"
    src="https://raw.githubusercontent.com/computercraft-package-tool/properprint/main/img/properprint_test2.png"
/>
### 4. Customizing the indendation amount when printing multiple lines
Finally, the function **properprint.pprint([texttoprint],[defaultindentation],[nextlineindendation])** takes one more optional parameter. It specifies the amount of characters by which the second line onwards is indented compared to the first line.

Content of "*test3*":
```lua
local properprint = require("lib.properprint")
properprint.pprint("The quick brown fox jumps over the lazy dog. He broke his legs in the process.", 0, 5)
```
Output:
<br><img
    alt="test2"
    src="https://raw.githubusercontent.com/computercraft-package-tool/properprint/main/img/properprint_test3.png"
/>

## Changelog
**Version 1.1**
- Added third parameter to ```properprint.pprint(...)``` to set line indentation difference from the second line onwards
- Major rewrite of the code to remove recursion, improve performance and make the code more readable. Also adding proper comments for the first time :)
- Made ```getLastCharPosition(...)``` only local method within the library, no longer accessible to the outside (only a helper method, not the purpose of the library). If you still need it, feel free to copy it from [properprint.lua](https://github.com/computercraft-package-tool/properprint/blob/main/properprint.lua) into your own code.
- Update method to include the library using ```dofile(...)``` or ```require(...)```, as ```os.loadAPI(...)``` is (rightfully) [deprecated]((https://tweaked.cc/module/os.html#v:loadAPI))
- Add ```.lua```-extension to the library file (syntax highlighting in editors etc.). The only reason we did not have this before is that file extensions did not work with ```os.loadAPI(...)```, which is no longer supported with ProperPrint version 1.1 anyways.


## Last words
Well, thats basicly all there is to say! This library is very small, but it is what it is.  
If you find bugs, please create an issue so I can fix them.   
I'm not that confident with GitHub yet, so feel free to point out things I could do better. Also, english is not my first language, so if you find any spelling/language-related mistakes, please do also create an issue.  
Have a nice day,  
PentagonLP
