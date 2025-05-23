# ProperPrint
![projectstage](https://img.shields.io/badge/project%20stage-alpha-yellow)
![projectstage](https://img.shields.io/badge/version-1.0-yellow)
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
FileUtils can be installed using the [ComputerCraft Package Tool](https://github.com/computercraft-package-tool/ccpt) by using the following commands:

Install CCPT, only run if you havn't installed it yet:
```
pastebin run syAUmLaF
```
If you install CCPT, this library will also be installed as CCPT depends on it. The library has the ccpt ID "pprint":
```
ccpt info pprint
```
The library will now be stored in "/lib/properprint".

## How to use
1. As shown here, when using the function **properprint.pprint([texttoprint])**, every line from the second line onwards has one space of indentation.
<br>Content of '*test*':
```lua
os.loadAPI("properprint")
properprint.pprint("The quick brown fox jumps over the lazy dog. He broke his legs in the process.")
```
Output:
<br><img
    alt="test1"
    src="https://raw.githubusercontent.com/computercraft-package-tool/properprint/main/img/properprint_test.png"
/><br>  
2. As shown here, when using the function **properprint.pprint([texttoprint],[indentation])**, every line from the second line onwards still has one space more of indentation, but every line has the specified amount of spaces as indentation added by default.
<br>Content of '*test2*':
```lua
os.loadAPI("properprint")
properprint.pprint("The quick brown fox jumps over the lazy dog. He broke his legs in the process.",5)
```
Output:
<br><img
    alt="test2"
    src="https://raw.githubusercontent.com/computercraft-package-tool/properprint/main/img/properprint_test2.png"
/><br>
3. As shown here, you can use the function **getLastCharPosition([haystack],[needle])** to find the last position of a character in a string. Though that's not the main purpose of the library and appeared more as a helper function, maybe it's useful to you.
<br>Content of '*test3*':
```lua
os.loadAPI("properprint")
print(properprint.getLastCharPosition("So long, and thanks for all the fish!","l"))
```
Output:
<br><img
    alt="test2"
    src="https://raw.githubusercontent.com/computercraft-package-tool/properprint/main/img/properprint_test3.png"
/><br>
## Last words
Well, thats basicly all there is to say! This library is very small, but it is what it is. If you find bugs, please report them so I can fix them.  
This is my first time publishing something on github, so feel free to point out things I could do better. Also, english is not my first language, so if you find any spelling/language-related mistakes, please tell me.  
Have a nice day,  
PentagonLP
