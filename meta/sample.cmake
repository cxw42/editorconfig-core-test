# sample.cmake: Tests run_and_sort to make sure it's working.

cmake_minimum_required(VERSION 3.5)

# See documentation links at https://stackoverflow.com/q/12802377/2877364
set( dir "${CMAKE_CURRENT_LIST_DIR}" )
list( APPEND CMAKE_MODULE_PATH "${dir}/../cmake" )
include( runandsort )

run_and_sort( RETVAL lines RETVAL_FAILURE did_fail
    CAPTURE_STDERR TRIM_INITIAL_LEADING_SPACE   # since we're using almostcat
    PGM "cmake"
    ARGS "-DWHICH:STRING=${dir}/sample.txt" "-P" "${dir}/../cmake/almostcat.cmake"
)       # Don't use cat(1) since we might be running on Windows

if( ${did_fail} )
    message( FATAL_ERROR "Program returned a nonzero exit code" )
    return()
endif()

message( "${lines}" )
# This outputs to stderr, and prints nothing extra except for a \n at the end

# Note that message( STATUS "${lines}" ) doesn't work because it outputs a "--"
# before the actual content.

# You could also use execute_process( COMMAND "echo" "${lines}" )
# or cmake -E echo, but I think the message() call is good enough.
