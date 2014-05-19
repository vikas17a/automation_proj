##################################################################
#Finding peak hour and request per second to be hit on hkplus  ###
##################################################################
#  Required file hkplus.log
#  
##################################################################


#### getting day of the log  ########
line=`awk '{ print $4 }' hkplus.log | cut -d: -f1 | uniq -c`;

#### Striping [ from the day ########
day=`echo $line | awk '{ print $2}' | sed -r 's/^.{1}//'`; 

#### getting peak hours #############
grep $day hkplus.log | cut -d[ -f2 | cut -d] -f1 | awk -F: '{print $2":00"}' | sort -n | uniq -c > peak_temp.txt

#### top peak hours #################
awk '{ print $1, " ", $2 }' peak_temp.txt | sort -n -r > new_peak_temp.txt

#### removing the peak_temp.txt #########
rm peak_temp.txt;

######## to get the concurrent request per second ###########
head -n 1 new_peak_temp.txt > peak_req.txt;


######## removal of temprory file #############################
rm new_peak_temp.txt;

val=`awk '{ print $1 }' peak_req.txt`;

result=`expr $val / 60`;
result=`expr $result / 60`;
result=`expr $result + 1`;

############## Result ##########################################
## $result contain request persecond

##### Remove temprory file #####################################
rm peak_req.txt

sh request_to_hit_staging.sh $result;


