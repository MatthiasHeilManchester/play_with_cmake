#------------------------------------------------------------------------------
cmake_minimum_required(VERSION 3.22 FATAL_ERROR)

project(mess_around)

# Define paranoid flag
set(OOMPH_ENABLE_PARANOID)

# Now add the executable:
add_executable(test test.cc)

# Do we want paranoia?
if(OOMPH_ENABLE_PARANOID)
  add_compile_definitions("PARANOID")
endif()

#if(OOMPH_ENABLE_PARANOID MATCHES ON)
#  set_source_files_properties(test.cc PROPERTIES COMPILE_OPTIONS "-DPARANOID")
#endif()

# ------------------------------------------------------------------------------
