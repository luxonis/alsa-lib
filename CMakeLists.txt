cmake_minimum_required(VERSION 3.4)

# Set your project name
project(alsa-lib)

# Step 1: Run the `./configure` script in the configure step
execute_process(
    COMMAND ./preconf.sh
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR} # Location of configure script
    RESULT_VARIABLE result
)

# Check if the configure step succeeded
if(NOT result EQUAL 0)
    message(FATAL_ERROR "Configure step failed with error code ${result}")
endif()

# Define a custom target to build the Makefile
add_custom_target(build-makefile ALL
    COMMENT "Building project using Makefile"
    COMMAND ${CMAKE_MAKE_PROGRAM} -C ${CMAKE_SOURCE_DIR}
)

# Optionally, define a clean target to use 'make clean' from Makefile
add_custom_target(clean-makefile
    COMMENT "Cleaning project using Makefile"
    COMMAND ${CMAKE_MAKE_PROGRAM} clean -C ${CMAKE_SOURCE_DIR}
)

# Specify what CMake's 'clean' command should do
set_directory_properties(PROPERTIES ADDITIONAL_MAKE_CLEAN_FILES clean-makefile)

install(CODE "execute_process(COMMAND ${CMAKE_MAKE_PROGRAM} install -C ${CMAKE_SOURCE_DIR})")
