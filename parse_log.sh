
##############################################################################
#this is the final parser stores the output in parsed_output.txt--> top hits #
##############################################################################
# Uses the file new_parse.sh and a parameter the file to be parsed;
#
#
#############################################################################


echo "Log file parsing on the way";

sh new_parse.sh $1 > parsed_output.txt;
head -30 parsed_output.txt;
rm temp;
rm result.txt;
