ARM assembly by example - https://armasm.com/  
For simplicity I defined a function on my bash prompt which I can invoke with name of file without any prefix to assemble and link the file.  
```
build () { as -ggdb ${1}.s -o ${1}.o && ld ${1}.o -o $1; }
```
And the build bash function served me fine till I hit the point where multiple files needed to be compiled and linked.  