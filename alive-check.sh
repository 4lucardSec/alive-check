#!/bin/bash
#using http & https protocols
for protocol in 'http://' 'https://'; do
		while read line;
		do      	#curl command, follow redirect, print code and send info to void		
				code=$( curl -L -w "%{http_code}" -o /dev/null -s --insecure $protocol$line )
				#if error occurs then
		if [ $code = "0000" ]; then
				echo "$protocol$line: Not responding"
				#otherwise send htpp code and save
		else
				echo "$protocol$line: HTTP $code"
				#echo "$protocol$line: $code" >> alive.txt
			#domains that will be analyzed	
		fi
		done < domains.txt
done
