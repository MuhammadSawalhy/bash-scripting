#! bash

limit=$([ ! -z "$1" ] && echo "$1"  || echo 100)
echo "limit: $limit"
rnd=$RANDOM
(( bounded_rnd = rnd % limit ))
echo $bounded_rnd
