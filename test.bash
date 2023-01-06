#! /bin/bash


echo " "
echo " "
echo "======================= NO PARANOID ================================"
echo " "
echo " "

rm -rf build; rm -rf my_build; ./auto_cmake.bash --preset joe_cool_non_paranoid --commented_json_preset_file  CMakeUserPresets.json_with_comments
if  [ -e build/test ]; then
    build/test
elif  [ -e my_build/test ]; then
    my_build/test
else
    echo "No executable found"
    exit 1
fi

echo " "
echo " "
echo "=======================    PARANOID ================================"
echo " "
echo " "
rm -rf build; rm -rf my_build; ./auto_cmake.bash --preset joe_cool_paranoid --commented_json_preset_file  CMakeUserPresets.json_with_comments 
if  [ -e build/test ]; then
    build/test
elif  [ -e my_build/test ]; then
    my_build/test
else
    echo "No executable found"
    exit 1
fi




  
