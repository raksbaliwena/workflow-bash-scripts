#! /bin/bash
# Bash script to add, commit and push on gitHub

branchName=$(git symbolic-ref --short HEAD)

echo "******************** Git add-commit-push ********************"
echo
echo "********** Check Git Status **********"
git status
echo
echo "****** Enter file(s) to add ******"
read addFiles
echo
git add $addFiles
echo
echo "****** Enter commit message ******"
read commitMessage
echo

if [ -z "$branchName" ]
then
	echo "********** No branch to commit **********"
	echo
	echo "********** Create a new branch : Enter branch name **********"
	read newBranchName
	git branch $branchName
	echo
fi

echo "Are you sure you want to commit and push to $branchName branch with $commitMessage commit message ?"
	read -p "Yes or y | No or n? :" Answer  
    case $Answer in  
        Yes|yes|y|Y)
        	echo "********** Committing to $branchName **********"
			git commit -m "$commitMessage"  
            echo
            git push -u origin $branchName
            echo  
            ;;  
        No|no|N|n)  
            echo "Operation cancelled"  
            ;;  
    esac
