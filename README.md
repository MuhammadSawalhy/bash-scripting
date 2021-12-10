# Bash Scripting, intro to bash

You can consider this repository as a bash cheatsheet, I am focusing on the main points and basic syntax of the bash. There are also some urls and resources for deep diving.

# Table of Content

<!--ts-->
* [Bash Scripting, intro to bash](README.md#bash-scripting-intro-to-bash)
* [Table of Content](README.md#table-of-content)
* [Shebang](README.md#shebang)
* [Variables](README.md#variables)
     * [Special variables](README.md#special-variables)
     * [Variable expansion](README.md#variable-expansion)
* [Operators](README.md#operators)
     * [Arithmetic operations](README.md#arithmetic-operations)
     * [Logic operators](README.md#logic-operators)
* [Standard input and output, STDIN, STDOUT, STDERR](README.md#standard-input-and-output-stdin-stdout-stderr)
     * [Chain commands, pipe](README.md#chain-commands-pipe)
     * [Redirect from a channel to another](README.md#redirect-from-a-channel-to-another)
     * [Piping and redirecting with your own script file](README.md#piping-and-redirecting-with-your-own-script-file)
* [Different types of brackets in bash](README.md#different-types-of-brackets-in-bash)
* [If statement](README.md#if-statement)
  * [Any command as a condition](README.md#any-command-as-a-condition)
     * [test condition and [ condition ]](README.md#test-condition-and--condition-)
     * [Math expressions](README.md#math-expressions)
     * [Subshell](README.md#subshell)
  * [Advanced examples](README.md#advanced-examples)
* [For loop](README.md#for-loop)
* [While &amp; Until](README.md#while--until)
* [Case statement](README.md#case-statement)
* [Select statement](README.md#select-statement)
* [Useful commands](README.md#useful-commands)
     * [cal, data](README.md#cal-data)
     * [awk](README.md#awk)
     * [memory details, 'ps axch -o cmd,%mem'](README.md#memory-details-ps-axch--o-cmdmem)
     * [ln, to create a symbolic links](README.md#ln-to-create-a-symbolic-links)
* [Authentication from terminal](README.md#authentication-from-terminal)
* [License](README.md#license)

<!-- Added by: ms, at: Fri Dec 10 02:19:43 PM EET 2021 -->

<!--te-->

# Shebang

> This first line (#!/bin/bash or #!/bin/sh) has a name. It is known as ‘she-bang‘(shabang). This derives from the concatenation of the tokens sharp (#) and bang (!). It is also called as sh-bang, hashbang, poundbang or hash-pling

A quotation from an amazing [article](https://medium.com/@codingmaths/bin-bash-what-exactly-is-this-95fc8db817bf) by Sanjay Mishra:

Here is another [article](https://ryanstutorials.net/bash-scripting-tutorial/bash-script.php) of articles series by [Rayan](https://ryanstutorials.net/).

---

Let's recap:

It looks like a comment line at the file top most. There must not be spaces between `#`, `!` or the interpreter path, according to Rayan. Also, when you are lazy and you don't put it in your script, the default is set to the current environment of the terminal.
As said in the pre-mentioned [article](https://ryanstutorials.net/bash-scripting-tutorial/bash-script.php) of articles series by [Rayan](https://ryanstutorials.net/)

> If you are at a terminal and running the Bash shell and you execute a script without a shebang then Bash will assume it is a Bash script.

Example:

```bash
#!/bin/bash
echo "As-salamu alaykum"
```

This is weird when you know that the shebang line can be included in python and javascript files as an example:

```bash
#!/usr/bin/env node
console.log('As-salamu alaykum from javascript!');
```

You can even run any command or program the will stdout the intrpreter:

```bash
#!  eval "$(echo '/bin/bash')"
```

# Variables

`declare` expression: https://www.computerhope.com/unix/bash/declare.htm

### Special variables

- `$?` : the exit code of the last performed command
- `\$$` : represents process id (pid)
- `$@` : all arguments
- `$#` : arguments count
- `$0` : the program running this script
- `$1` : the first argument, or null
- `$LINENO` : the line number where the \$LINENO is used
- `$RANDOM` : random integer in [0, 32767] (signed "+" 16-bit integer).

### Variable expansion

Useful resources:

- Bash variable expansion: https://www.youtube.com/watch?v=yTijxqjZhRo
- Shell parameter expansion: https://www.gnu.org/software/bash/manual/bash.html#Shell-Parameter-Expansion

```bash
var=
var123=(1 2 3 4)
# to print names of the declared variables
echo ${!var@}      # var var123
# to get the indices of an array, see
# this used with for loop here below
echo ${!var123[@]} # 0 1 2 3
```

# Operators

Resources: [basic-operators-in-shell-scripting](https://www.geeksforgeeks.org/basic-operators-in-shell-scripting/)

### Arithmetic operations

You can find most of these operators by this command: `info expr`.

- add: `$num1 + $num2` or `$num1 += $num2`
- subtract: `$num1 - $num2` or or `$num1 -= $num2`
- multiplication: `$num1 * $num2` or or `$num1 *= $num2`
- division: `$num1 / $num2` or or `$num1 /= $num2`
- power: `$num1 ** $num2` or or `$num1 **= $num2`
- Modulus: `$num1 % $num2` or or `$num1 %= $num2`
- Uniary operator, increase: `$num1++` or or `++$num1`
- Uniary operator, decrease: `$num1--` or or `--$num1`

  Using `let` to do computations: [click here](https://www.computerhope.com/unix/bash/let.htm)

### Logic operators

You can find these operators by this command: `info test`.

- `!($true)`
- `STRING = STRING`
- `STRING != STRING`
- `INTEGER1 -eq INTEGER2`
- `INTEGER1 -gt INTEGER2`
- `INTEGER1 -lt INTEGER2`
- `INTEGER1 = INTEGER2`
- `INTEGER1 \> INTEGER2`
- `INTEGER1 \< INTEGER2`

# Standard input and output, STDIN, STDOUT, STDERR

### Chain commands, pipe

```bash
command='echo text | cat | sed s/text/another\ text/'
eval $command
```

### Redirect from a channel to another

```bash
eval $command > file       # redirect STDOUT --to--> ./file
eval $command >&2          # redirect STDOUT --to--> STDERR
eval $command 1>&2         # redirect STDOUT --to--> STDERR
eval $command >&2 > ./file # redirect STDOUT --to--> both STDERR and ./file
eval $command 2> /dev/null # redirect STDERR --to--> /dev/null
eval $command >& /dev/null # redirect both STDOUT and STDERR --to--> /dev/null
```

### Piping and redirecting with your own script file

Some valuable answers to a question on stackoverflow, [How to detect if my shell script is running through a pipe?](https://stackoverflow.com/questions/911168/how-to-detect-if-my-shell-script-is-running-through-a-pipe).

You can put the following code in a file, e.g. `./handling-STDs`, then try something like `echo text | ./handling-STDs 1 > ./file`, `./handling-STDs 1 < ./file`, etc...

<details>
<summary>Click to see all cases, <b>./handling-STDs</b></summary>

```bash
#!/bin/bash

if [ "$1" = '1' ]; then

  echo -----------------------------
  if [ -t 0 ]
  then echo 'no input, it is the teminal'
  else echo "there is a source of input"; fi
  echo -----------------------------
  if [ -t 1 ]
  then echo 'STDOUT to the terminal'
  else echo "STDOUT *NOT* to the terminal"; fi
  echo -----------------------------
  if [ -t 2 ]
  then echo 'STDERR to the terminal'
  else echo "STDERR *NOT* to the terminal"; fi
  echo -----------------------------

elif [ "$1" = '2' ]; then

  echo -----------------------------
  [[ -t 0 ]] && \
      echo 'STDIN is attached to TTY'
  [[ -p /dev/stdin ]] && \
      echo 'STDIN is attached to a pipe'
  [[ ! -t 0 && ! -p /dev/stdin ]] && \
      echo 'STDIN is attached to a redirection'
  echo -----------------------------
  [[ -t 1 ]] && \
      echo 'STDOUT is attached to TTY'
  [[ -p /dev/stdout ]] && \
      echo 'STDOUT is attached to a pipe'
  [[ ! -t 1 && ! -p /dev/stdout ]] && \
      echo 'STDOUT is attached to a redirection'
  echo -----------------------------
  [[ -t 2 ]] && \
      echo 'STDERR is attached to TTY'
  [[ -p /dev/stderr ]] && \
      echo 'STDERR is attached to a pipe'
  [[ ! -t 2 && ! -p /dev/stderr ]] && \
      echo 'STDERR is attached to a redirection'
  echo -----------------------------

fi
```

</details>

For example you can do something like this:

```bash
#!/usr/bin/env bash
if [ -t 0 ]; then
  >&2 echo error: no input is provided, STDIN channel is attached to the tty, your terminal
  exit 1
fi

my_content="$(cat)"
echo "I received some data:"
echo "-----------------------------------"
echo "$my_content"
```

# Different types of brackets in bash

See the amazing answers here: https://unix.stackexchange.com/questions/306111/what-is-the-difference-between-the-bash-operators-vs-vs-vs

# If statement

Let keep it simple, I will show you the "if statment" syntax and then explore different commonly used if examples.

```bash
if
   command-list1
then
   command-list2
else
   command-list3
fi
```

## Any command as a condition

We can use a command, chained command with `&&` abd `||`, or multiple lines as if you are writing in a separate file until a `then` command is found.

If will say the **command-list1** is true if the exit code of the whole list is 0, a sign of success, in other words if the last command exits with 0, if it is other than a zero it will be false...

Here are some examples of these command that you will regularly with...

### `test condition` and `[ condition ]`

Some arguments that you can use:

```
Operator			Description
! EXPRESSION			The EXPRESSION is false.
-n STRING			The length of STRING is greater than zero.
-z STRING			The lengh of STRING is zero (ie it is empty).
STRING1 = STRING2		STRING1 is equal to STRING2
STRING1 != STRING2		STRING1 is not equal to STRING2
INTEGER1 -eq INTEGER2		INTEGER1 is numerically equal to INTEGER2
INTEGER1 -gt INTEGER2		INTEGER1 is numerically greater than INTEGER2
INTEGER1 -lt INTEGER2		INTEGER1 is numerically less than INTEGER2
-d FILE				FILE exists and is a directory.
-e FILE				FILE exists.
-r FILE				FILE exists and the read permission is granted.
-s FILE				FILE exists and it's size is greater than zero (ie. it is not empty).
-w FILE				FILE exists and the write permission is granted.
-x FILE				FILE exists and the execute permission is granted.
```

-----

Another important idea to know is that `[ condition ]` is the exact same as `test condition`, it is just a different way to write the command as standarized by POSIX according, [here is the source](https://unix.stackexchange.com/a/306115).

A quote from [this answer](https://unix.stackexchange.com/a/290296) says:

> So when you write
>
> ```bash
> [ [ "$A" -eq "0" ] || [ "$B" -ne "0" ] ] && [ "$C" -eq "0" ]
> ```
>
> that's parsed as
>
> ```bash
> [ [ "$A" -eq "0" ] ||
> [ "$B" -ne "0" ] ] &&
> [ "$C" -eq "0" ]
> ```
>
> which is the same as
>
> ```bash
> test [ "$A" -eq "0" ||
> test "$B" -ne "0" ] &&
> test "$C" -eq "0"
> ```
>
> Notice the unbalanced brackets? Yeah, that's not good. Your attempt with parentheses has the same problem: spurious brackets.


### Math expressions

```bash
if (( math expressions )); then
    echo "do command"
fi
```


### Subshell

```bash
if (PATH=""; true); then
    echo "do command"
fi
```

## Advanced examples

```bash
if [ condition ]; then ...; fi
if [ 1 = 2 ]; then ...; fi
if [ 1 == 2 ]; then ...; fi # invalid syntax
if [1 = 2 ]; then ...; fi   # invalid syntax
if [ 1=2 ]; then ...; fi    # invalid syntax
if [ condition1 ] && { [ condition2 ] || [ condition3 ]; }; then ...; fi
if [[ 1 -gt 2 ]]; then ...; fi
if [[ 1 > 2 && (... || ... && ...) ]]; then ...; fi
if [[ "$foo" = a* ]]; then ...; fi # checks patterns
```

See the awesomeness here:

```bash
╭─muhammad-alsawalhy@arch.zsh ‹main›
╰─➤ if a
if> b
if> true
if> then
then> echo it is true
then> else
else> echo it is false
else> fi
zsh: command not found: a
zsh: command not found: b
it is true
```

# For loop

- Loop over ranges of values

```bash
for var_name in {start..end}; do; done
### or ###
for var_name in {start..end..increment}; do; done
```

- For loop can do such as in JavaScript, Java, C#, etc...:

```bash
for (( i=1; i<=10; i++ )); do echo $i; done
```

- An alternative to the previous code:

```bash
for i in `seq 10`; do echo $i; done
```

- Iterate over items of an array, The _second_ method is more precise because if any of the items includes white spaces, this item will be considered multiple items separated by these white spaces defined in this `$IFS`.

```bash
for item in ${arr[@]}; do echo $item; done
for index in ${!arr[@]}; do echo ${arr[index]}; done
```

- You can use `break` statement to break if a specific condition satisfied, or `continue` to skip the following commands in the loop:

```bash
for (( i=0; i<=10; i++ )); do
  if [ $i -eq 5 ]; then continue
  elif (( i == 7 )); then break fi
  echo $i
done
```

# While & Until

You can you a logical or math expression:

```bash
while (condition is true); do
  # commands ...
done
```

The same structure for `until`:

```bash
until (condition becomes true); do
  # commands ...
done
```

Example:

![while loop](./while-image.png)

# Case statement

This is an alternative to `if elif elif else fi`, it is similar to `switch` in C-like languages, JavaScript, and many more.

```bash
case $1 in
  first_choice)
    # command
    ;;
  second_choice)
    # command
    ;;
  *)
    # Default logic
    echo $"Usage: $0 {start|stop}"
    exit 1
    ;;
esac
```

# Select statement

To make the script user choose from a menu.

```bash
select user_choice in first_choice 2nd_choice 3rd_choice; do
  echo $user_choice
done
```

# Useful commands

You should take a look at these commands, you nearly will use them frequently.

> cal, date, awk, grep, sed, tee, tr, printf, expr, test, sensors, free, ps, pgrep, pkill, curl, wget, xclip, youtube-dl

### `cal, data`

```bash
~/Desktop/linux-meeting/terminal-authentication
❯ cal
September 2020
Su Mo Tu We Th Fr Sa
1  2  3  4  5
6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30

~/Desktop/linux-meeting/terminal-authentication
❯ date "+%Y %b %d (%a) - %I:%M%p"
2020 Sep 27 (Sun) - 12:02AM
```

### `awk`

https://www.youtube.com/watch?v=jJ02kEETw70

### memory details, 'ps axch -o cmd,%mem'

```bash
mem (){ free | awk '/^Mem/ { print $3/$2"%"}'; }
memusage() {
  ps axch -o cmd,%mem --sort=-%mem |
  head -n $([ ! -z $1 ] && echo "$1" || echo 10)
}
```

### `ln`, to create a symbolic links

```bash
❯ sudo ln -s  file_to_be_linked  the_symbolic_link_file

#### for example ###########
❯ sudo ln -fs /home/ms/.nvm/versions/node/v12.18.3/bin/node /usr/local/bin/node

❯ file /usr/local/bin/node
/usr/local/bin/node: symbolic link to /home/ms/.nvm/versions/node/v12.18.3/bin/node
```

# Authentication from terminal

In the subdirectory `terminal-authentication`. You can find simple sign up and login scripts, the signed-up users are saved locally, but you can you the command `curl` to communicate with a remote or local server and save your data in a secure place.

# License

MIT
