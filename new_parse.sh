
#########################################################
# this script is the worker script for parse_log.sh     #
#########################################################

awk '{print $7}' $1 | sort | uniq -c | sort -r > temp

head -30 temp > result.txt

while read line 
do
	printf "http://www.staging.healthkartplus.com";awk '{print $2," ",$1}' <<< "$line";
done < result.txt
