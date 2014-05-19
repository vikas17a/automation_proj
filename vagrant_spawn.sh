#script to spawn new VM and make them Up and running

echo " " >> logs/log.log
echo " " >> logs/log.log

#time_stamp on which the script started
date=$(date);

#starting of operation
echo "Starting the script to spawn VM's at $date"  >> logs/log.log

echo "Waiting for user response to spawn machines" >> logs/log.log

#User input to spawn number of machines
read count;

echo "Operation Started";

echo "Got the response from user $count " >> logs/log.log

#storing the user response for future use
par_for_work=$count;

#performing action
while [ $count -ne 0 ]
do
	#creating directory

	echo  "Creating directory v$count" >> logs/log.log
	mkdir v$count;
	
	echo "Directory created v$count" >> logs/log.log

	echo "Copying Vagrantfile to v$count" >> logs/log.log

	#copying the Vagrantfile to the new directory
	cp Vagrantfile v$count/;
	sleep 3;
	echo "Vagrantfile copied to v$count" >> logs/log.log

	echo "Copying .box preconfigured file to v$count" >> logs/log.log

	#copying the preconfigured box to that machine
	cp pre_configured.box v$count/;
	sleep 6;

	echo ".box file copied to v$count" >> logs/log.log

	echo "Directory v$count created" >> logs/log.log
	cd v$count;
	
	echo "Initializing the vagrant machine $count envoirnment" >> ../logs/log.log 

	echo "Vagrant machine $count enviornment initialized" >> ../logs/log.log
	
	echo "Vagrant machine $count is goint up now" >> ../logs/log.log
	vagrant up >> ../logs/log.log
	sleep 25;
	echo "Vagrant Machine $count is Up and Running" >> ../logs/log.log
	cd ..;
	count=`expr $count - 1`;
	echo "" >> logs/log.log
done

date=$(date);
echo "Operation completed and all the machine's are up and running $date" >> logs/log.log

echo "######################################################" >> logs/log.log

echo "All the VM's are spawned and running and up";

##Work to be added for the each VM's
