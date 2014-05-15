#this is the final parser stores the output in parsed_output.txt about the top 20 hits
echo "Parsing the log file please hold on !!!!!!";
sh new_parse.sh $1 > parsed_output.txt;
head -20 parsed_output.txt;
rm temp;
rm result.txt;
