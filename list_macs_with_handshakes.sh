# Expects filenames on a pipe
for filename in "$@";do
	if [ -f "$filename" ]; then
		for mac in $( echo "1" | aircrack-ng "$filename" | egrep "[1-9][0-9]* handshake" | tr -s "[:blank:]" "\t" | cut -f3 -d"	" );
		do 
			echo -e "$filename\t$mac"
		done
	else
		echo "Invalid file"
		exit 1
	fi;

done
