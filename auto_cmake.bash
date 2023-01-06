#! /bin/bash

# Wrapper to configure and build oomph-lib with option to specify a preset and a commented user preset file
if [ $# -ne 0 ] && [ $# -ne 2 ]  && [ $# -ne 4 ] ; then
    echo "Usage:"
    echo "auto_cmake.bash "
    echo "auto_cmake.bash --preset <preset_name> "
    echo "auto_cmake.bash --commented_json_preset_file <json_file_name>"
    echo "auto_cmake.bash --preset <preset_name> --commented_json_preset_file <json_file_name>"
    exit 1
fi
    
preset_name=""
commented_json_preset_file=""
if [ $# -gt 0 ]; then
   if [ "$1" = "--preset" ]; then
       preset_name=$2
   elif [ "$1" = "--commented_json_preset_file" ]; then
       commented_json_preset_file=$2
   else
       echo "Wrong command line key: "$1
       exit 1
   fi
   if [ $# -gt 2 ]; then
       if [ "$3" = "--preset" ]; then
           preset_name=$4
       elif [ "$3" = "--commented_json_preset_file" ]; then
           commented_json_preset_file=$4
       else
           echo "Wrong command line key: "$3
           exit 1
       fi
   fi
fi


# Create comment-stripped version of user preset json file
if [ "$commented_json_preset_file" != "" ]; then
    if [ -e CMakeUserPresets.json ];  then
        echo ""
        echo "Warning: CMakeUserPresets.json already exists. It will be overwritten"
        echo "by the de-commented version of $commented_json_preset_file"
        echo " "
        echo "Hit return to continue or abort with ^C"
        echo " "
        read bla
        rm -f CMakeUserPresets.json
    fi
    scripts/strip_comments_from_json.bash $commented_json_preset_file > CMakeUserPresets.json
fi



# Do we want presets?
preset_string=""
if [ "$preset_name" != "" ]; then
    preset_string="--preset "$preset_name
fi  



# Two ways of configuring/building
use_build_presets=0
if [ $use_build_presets -eq 1 ]; then 

    # Now configure/build the thing; not necessary to specify
    # the generator or build directory since they're already
    # defined in the presets
    cmake  $preset_string
    
    # This relies no a matching build preset (with the same name)
    # having been defined
    cmake --build $preset_string

else

    # We could also do this -- the command line specifications
    # of the build directory and the generator would overwrite
    # those defined in the presets
    cmake -G Ninja -B my_build $preset_string
    cmake --build my_build

fi
