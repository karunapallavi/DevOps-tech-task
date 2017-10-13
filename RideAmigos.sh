#!/bin/bash
#bash for tech exercise

# second bash script to run property database on the servers
$script_path ="add path here" 

# check for logs which contain the package updates and save logs in file3
# highloght the file names already present in file1 which is the binaries
# sort the lines so that you may know whixh updates are recent
grep -xf file1 file2 > file3 | grep --color "file1" | sort


#if file3 ie the logs are populated, then run the second script to runt he property database on required servers
if [ -s file3] then
	("$script_path")
fi


