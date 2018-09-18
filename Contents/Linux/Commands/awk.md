### awk

##### Description

Find and Replace text, database sort/validate/index.
The basic function of awk is to search files for lines
(or other units of text) that contain a pattern.
When a line matches, awk performs a specific action on that line.


##### Syntax

```
awk <options> 'Program' Input-File1 Input-File2 ...

awk -f PROGRAM-FILE <options> Input-File1 Input-File2 ...
```

##### Parameters

```
--   Signal the end of options.  This is useful to allow further
     arguments to the awk program itself to start with a `-'.  This
     is mainly for consistency with POSIX argument parsing conventions.

'Program'
     A series of patterns and actions: see below

Input-File
    If no Input-File is specified then awk applies the Program to
    "standard input", (piped output of some other command or the terminal.
    Typed input will continue until end-of-file (typing `Control-d')
```


##### How it works

Suppose we have a file in which each line is a name followed by a phone number.
Let's say the file contains the line "Audrey 5550164."
In AWK, the first field is referred to as $1, the second as $2 and so on.
So an AWK program to retrieve Audrey's phone number is:
awk '$1 == "Audrey" {print $2}' numbers.txt
which means if the first field matches Audrey, then print the second field.

In awk, $0 is the whole line of arguments.


Display lines from samplefile containing the string "123" or "abc" or "some text"
is done using the *Program* statement in *patterns* as follows

```
awk '/123/ { print $0 }
     /abc/ { print $0 }
     /some text/ { print $0 }' samplefile
```

```
/Regular Expression/        - Match =
Pattern && Pattern          - AND
Pattern || Pattern          - OR
! Pattern                   - NOT
Pattern ? Pattern : Pattern - If, Then, Else
Pattern1, Pattern2          - Range Start - end
BEGIN                       - Perform action BEFORE input file is read
END                         - Perform action AFTER input file is read
```

Variable names with special meanings:
```
CONVFMT     conversion  format  used  when  converting  numbers
            (default %.6g)

FS          regular  expression  used  to separate fields; also
            settable by option -Ffs.

NF          number of fields in the current record

NR          ordinal number of the current record

FNR         ordinal number of the current record in the current
            file

FILENAME    the name of the current input file

RS          input record separator (default newline)

OFS         output field separator (default blank)

ORS         output record separator (default newline)

OFMT        output format for numbers (default %.6g)

SUBSEP      separates multiple subscripts (default 034)

ARGC        argument count, assignable

ARGV        argument  array,  assignable;  non-null members are
            taken as filenames

ENVIRON     array  of  environment  variables;  subscripts  are
            names.
```

##### Example

- From an ls - l listing, return the fifth item ($5) from each line of the output:
```
$ ls -l | awk '{print $5}'
```

- Print the Row Number (NR), then a dash and space ("- ") and then the first item
($1) from each line in samplefile.txt:
```
$ awk '{print NR "- " $1 }' samplefile.txt
```

- Print the first item ($1) and then the third last item $(NF-2) from each line
in samplefile.txt:
```
$ awk '{print $1, $(NF-2) }' samplefile.txt
```

- Print every line that has at least one field. This is an easy way to delete
blank lines from a file (or rather, to create a new file similar to the old
file but from which the blank lines have been deleted)
```
awk 'NF > 0' data.txt
```

- Comparison with grep

Running grep Dec against the following file listing would return the 3 rows
shown in bold as it matches text in different places:

-rw-r--r-- 7 simon simon 12043 Jan 31 09:36 **Dec**ember.pdf
-rw-r--r-- 3 simon simon 1024 **Dec** 01 11:59 README
-rw-r--r-- 3 simon simon 5096 Nov 14 18:22 **Dec**ision.txt

Running
```
$ ls -l /tmp/demo | awk '$6 == "Dec"'
```
against the same file listing, the relational operator $6 matches the exact
field (column 6 = Month) so it will list only the December file.


- Print the length of the longest input line:
```
awk '{ if (length($0) > max) max = length($0) }
    END { print max }' data
```

- Print seven random numbers from zero to 100, inclusive:
```
awk 'BEGIN { for (i = 1; i <= 7; i++)
            print int(101 * rand()) }'
```

- Print the total number of bytes used by FILES:
```
ls -lg FILES | awk '{ x += $5 } ; END { print "total bytes: " x }'
```

- Print the average file size of all .PNG files within a directory:
```
ls -l *.png | gawk '{sum += $5; n++;} END {print sum/n;}'
```

- Print a sorted list of the login names of all users:
```
awk -F: '{ print $1 }' /etc/passwd | sort
```

- Count the lines in a file:
```
awk 'END { print NR }' data
```

- Print the even numbered lines in the data file. If you were to use the expression 'NR % 2 == 1' instead, it would print the odd numbered lines.
```
awk 'NR % 2 == 0' data
```