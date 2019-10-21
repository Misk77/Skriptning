#!/bin/bash
#########Function
function oneargplease(){
	echo "ett heltal förväntades."
	exit 1
}
###### MAIN
if [[ ! 0-9 = $1 ]] || [[ $1 = "" ]] ; then
	oneargplease "$1"

else
	USERTIMER="$1"
	shift
	($@) &
	PARENTID=$!
	export PID=$$
fi	
function timesup(){
	echo "TIMEOUT"
	exit 1

}
########### Execution of arguments

# Ifall inte userrtimer hinner avsluta så fångar vi signalen från användaren
trap timesup SIGUSR1
(sleep "$USERTIMER" ; kill -SIGUSR1 $PID) &

USERTIMERPID=$!
 
wait $PARENTPID

# avslutar och skriver exit status
exit_code=$?
echo "SLUTSTATUS: $exit_code"

kill $USERTIMERPID



