#! /bin/bash


#-----------------------------------------------------------------------------
# Script to remove comments from json files. Only deals with "//" comments
# which are allowed to appear anywhere (on a line by themselves or after
# a valid json statement. We're also removing blank lines
#-----------------------------------------------------------------------------

# Strip out "^M" first (can apper from email based transfer of files) then
# get rid of anything that starts with "//", and remove blank lines.
cat $1 | tr -d '\015' | awk '{new_line=$0
      start_of_comment=index(new_line, "//") 
      if (start_of_comment>0)
        {
         new_line=substr($0,1,start_of_comment-1)
        }
       new_line_with_stripped_whitespace=new_line
       gsub(/^[ \t]+|[ \t]+$/, "",new_line_with_stripped_whitespace)
       #print ":"new_line_with_stripped_whitespace":"length(new_line_with_stripped_whitespace)":"
       if (length(new_line_with_stripped_whitespace)>0)
        {
         print new_line
        }
       }' 
