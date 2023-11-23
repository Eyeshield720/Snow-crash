#!/bin/bash

# -eq -> Equal
# -ne -> Not equal
# -lt -> Less than
# -le -> Less than or equal
# -gt -> Greater than
# -ge -> Greater than or equal
# https://unix.stackexchange.com/questions/48750/creating-numerous-directories-using-mkdir

if [[ $1 ]]
then
	ref=("$1" "$2")
	n=$1
	max=$2
	printf "Dirname pending..: "
	read dir
	if [[ ($1 -gt 0 || $2 -gt 0) && $2 -ge $1 ]]
	then
		set -- # this sets $@ [the argv array] to an empty list.
		while [ "$n" -le "$max" ]; do
			if [[ "$n" -ge 10 || "$n" -lt 0 ]]; then
				set -- "$@" "${dir}${n}/Ressources" # this adds s$n to the end of $@
			else
				set -- "$@" "${dir}0${n}/Ressources"
			fi
			n=$(( n + 1 ));
		done
		/bin/mkdir -pv "$@"
		for i in "$@"
		do
			/bin/touch $i/../flag 
		done
		set -- # reset $@ array
		n=${ref[0]}
		while [ "$n" -le "$max" ]; do
			if [[ "$n" -ge 10  || "$n" -lt 0 ]]; then
				set -- "$@" $( echo -e "# Snow-crash - ${dir}${n}" >> "${dir}${n}/Ressources/${dir}${n}.md"; )
			else
				set -- "$@" $( echo -e "# Snow-crash - ${dir}0${n}" >> "${dir}0${n}/Ressources/${dir}0${n}.md"; )
			fi
			n=$(( n + 1 ));
		done
		"$@"
	fi
else
	echo -ne "\e[31mUsuge: [\e[32mnumber\e[31m] to [\e[32mnumber\e[31m]\e[0m\n"
fi
