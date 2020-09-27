# Linux tutorial - bash scripting, some techniques

## Variables

`declare` expression: [click here](https://www.computerhope.com/unix/bash/declare.htm)


### Spacial variables

 - $? :  
 - \$$ : represents process id (pid)
 - $@ : all arguments 
 - $# : arguments count 
 - $0 : the program running this script 
 - $1 : the first argument, or null
 - $LINENO : the line number where the \$LINENO is used
 - $RANDOM : random integer in [0, 32767] (signed "+" 16-bit integer).
 - $RANDOM : random integer in [0, 32767] (signed "+" 16-bit integer).

## Operators

Resources: [basic-operators-in-shell-scripting](https://www.geeksforgeeks.org/basic-operators-in-shell-scripting/)

### Arithmetic operations

- add: `$num1 + $num2` or `$num1 += $num2`
- subtract: `$num1 - $num2` or or `$num1 -= $num2`
- multiplication: `$num1 * $num2` or or `$num1 *= $num2`
- division: `$num1 / $num2` or or `$num1 /= $num2`
- power: `$num1 ** $num2` or or `$num1 **= $num2`
- Modulus: `$num1 % $num2` or or `$num1 %= $num2`
- Uniary operator, increase: `$num1++` or or `++$num1`
- Uniary operator, decrease: `$num1--` or or `--$num1`

  Using `let` to do computations: [click here](https://www.computerhope.com/unix/bash/let.htm)


### logic operators

- `!($true)`
- `STRING = STRING`
- `STRING != STRING`
- `INTEGER1 -eq INTEGER2`
- `INTEGER1 -gt INTEGER2`
- `INTEGER1 -lt INTEGER2`


## Handling string

### Echo more one line and type them nornmally:
```
echo << id
your test 
is types here
and another line here
id
```

--------------
### 


--------------

###


--------------

## Standard input and output



## For loop, if statments, case, while

### if statement

  Tests used in logic expression:
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
  for more about these tests used in logic expression type `info test`.
  
  -----------
  You can type conditions as:
  - logic experssions
    ```bash
    if [ condition ]; then ...; fi
    ```
  - math expressions
    ```bash
    if (( math expressions )); then ...; fi
    ```

### while, until

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

### case

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

### for loop

- For loop statement does throw an array or list of values, the same perception as for loop in python:
  ```bash
  for var_name in {start..end}; do
    
  done
  ### or ############333
  for var_name in {start..end..increment}; do
    
  done
  ```

- For loop can do such as in javascript, java, and C#:
  ```bash
  for (( i=0; i<=10; i++ )); do
    echo $i
  done
  ```

  You can use `break` statement to break if a specific condition statisfied:
  ```bash
    for (( i=0; i<=10; i++ )); do
      if [ $i -eq 5 ]; then
        break
      fi
      echo $i
    done
  ```

## cal, date, awk, grep, sed, tee, sensors, free, ps

- cal, data
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

- awk
  See this [video](https://www.youtube.com/watch?v=jJ02kEETw70)

- memory details:
  ```bash
  mem (){ free | awk '/^Mem/ { print $3/$2"%"}' }
  memusage() {
    ps axch -o cmd,%mem --sort=-%mem |
    head -n $([ ! -z $1 ] && echo "$1" || echo 10)
  }
  ```

- link
  To create a symbolic link:
  ```bash
  ❯ sudo ln -s  file_to_be_linked  the_symbolic_link_file
  
  #### for example ###########3
  ❯ sudo ln -fs /home/ms/.nvm/versions/node/v12.18.3/bin/node /usr/local/bin/node

  ❯ file /usr/local/bin/node
  /usr/local/bin/node: symbolic link to /home/ms/.nvm/versions/node/v12.18.3/bin/node
  ```
