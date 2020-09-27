#!/bin/bash
# Shebang line

# see: https://www.mylinuxplace.com/bash-special-variables/
# see: https://ryanstutorials.net/bash-scripting-tutorial/bash-variables.php

####### special varaibles #######

echo "$_"
echo "\$_ at the beginning of the script represents the full path to the excutable file"
echo "\$_ otherwise it represents the last command arguments"

echo ""
echo "-------------- command name"
echo \$0
echo "$0"

echo ""
echo "-------------- the first argument"
echo \$1
echo "$1"

echo ""
echo "-------------- arguments count"
echo \$\#
echo "$#"

echo ""
echo "-------------- all arguments"
echo \$@
echo "$@"

echo ""
echo "-------------- the process id 'pid'"
echo \$\$
echo "$$"

echo ""
echo "-------------- the line number where the \$LINENO is used"
echo \$LINENO
echo $LINENO

echo ""
echo "-------------- seconds from the excution beginning"
echo \$SECONDS
echo  $SECONDS

echo ""
echo "-------------- get random integer"
echo \$RANDOM
echo  $RANDOM 

echo ""
echo "-------------- use the super doer"
echo "\$_"

