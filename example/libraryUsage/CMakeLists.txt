cmake_minimum_required(VERSION 3.10)

project(libraryUsage)

# only set this variable if ApproxMVBB is not installed system-wide
# set(ApproxMVBB_DIR "path/to/ApproxMVBB/Build/Directory/install/lib/cmake/ApproxMVBB-1.0.8")
get_filename_component( ApproxMVBB_DIR ${ApproxMVBB_DIR} ABSOLUTE )
message(STATUS "ApproxMVBB_DIR:" ${ApproxMVBB_DIR})

# add ApproxMVBB and support for kdTree and XML output
find_package(ApproxMVBB REQUIRED)

# add simple executable
add_executable(libraryUsage ./main.cpp)
target_link_libraries(libraryUsage ApproxMVBB::Core)