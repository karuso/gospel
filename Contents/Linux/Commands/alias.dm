### alias

##### Description

Create an alias, aliases allow a string to be substituted for a word when it is used as the first word of a simple command.

##### Syntax

```
alias [-p] [name[=value] ...]

unalias [-a] [name ... ]
```

##### Parameters

```
-p   Print the current values

-a   Remove All aliases
```

##### Example

Create an alias 'c' that will clear the screen:
```
$ alias c='clear'
```

Create an alias 'ls' that will change the default action of ls:
```
$ alias ls='ls --classify'
$ ls
$ unalias ls
```

More aliases for ls:
```
$ alias la='ls -lAXh --color=always'   #Show all, sort by extension
$ alias ls-al='ls -al'   #fix typo missing space
$ alias l="ls -l"
$ alias la="ls -la"
```

Use alias to cd into to sub-sub directories:
```
$ alias ..='cd ..'
$ alias ...='cd ../..'
$ alias ....='cd ../../..'
```

Use alias to fix missing space typos:
```
$ alias cd..='cd ..'
```

Display the working directory
```
$ alias .='echo $PWD'
```

Prevent accidental deletions by making rm interactive:
```
$ alias rm='rm -i'
```

Shorten apt-get installation commands:
```
$ alias canhaz='sudo apt-get install'
```

Run firefox and open a specific website:
```
$ alias fftr='/home/simon/firefox/firefox https://ss64.com'
```
