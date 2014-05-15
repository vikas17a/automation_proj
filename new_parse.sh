#this script is the working script for parse_log.sh 
awk '{print $7}' $1 | sort | uniq -c | sort -r > temp
head -25 temp > result.txt
while read line 
do
	printf "http://healthkart.com";awk '{print $2," ",$1}' <<< "$line";
done < result.txt
