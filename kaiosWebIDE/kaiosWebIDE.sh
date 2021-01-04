#! /bin/bash
# Bash script to start kaios WebIDE in linux

echo "---------------Kaios WebIDE starter----------------"
touch $HOME/.location.txt

if [ -s "$HOME/.location.txt" ] 
then
	cd $(cat $HOME/.location.txt)
	./kaiosrt
        # do something as file has data
else
	echo "Enter Executable location :"
	read executableLocation
	echo $executableLocation > $HOME/.location.txt
	cd $executableLocation
	./kaiosrt
        # do something as file is empty 
fi

$SHELL