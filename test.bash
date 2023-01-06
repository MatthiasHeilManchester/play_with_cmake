#! /bin/bash


echo " "
echo " "
echo "======================= NO PARANOID ================================"
echo " "
echo " "

rm -rf build; ./auto_cmake.bash --preset joe_cool_non_paranoid --commented_json_preset_file  CMakeUserPresets.json_with_comments 
build/test 


echo " "
echo " "
echo "=======================    PARANOID ================================"
echo " "
echo " "
rm -rf build; ./auto_cmake.bash --preset joe_cool_paranoid --commented_json_preset_file  CMakeUserPresets.json_with_comments 
build/test 




  
