function_to_fork(){
	vagrant ssh -c "$cmd";
}

node=$1;
cmd=`cat work`;
while [ $node -ne 0 ]
do
	cd v$node;
	function_to_fork &
	cd ..;
	node=`expr $node - 1`;
done
