#The name of the project ====================================================================
project("ApproxMVBBTests")


# Add GoogleTests ===========================================================================
if (CMAKE_VERSION VERSION_LESS 3.2)
    set(UPDATE_DISCONNECTED_IF_AVAILABLE "")
else()
    set(UPDATE_DISCONNECTED_IF_AVAILABLE "UPDATE_DISCONNECTED 1")
endif()

include(DownloadProject)
download_project(PROJ                googletest
                 GIT_REPOSITORY      https://github.com/google/googletest.git
                 GIT_TAG             master
                 ${UPDATE_DISCONNECTED_IF_AVAILABLE}
)

# Prevent GoogleTest from overriding our compiler/linker options
# when building with Visual Studio
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)


add_subdirectory(${googletest_SOURCE_DIR} ${googletest_BINARY_DIR} EXCLUDE_FROM_ALL)

# When using CMake 2.8.11 or later, header path dependencies
# are automatically added to the gtest and gmock targets.
# For earlier CMake versions, we have to explicitly add the
# required directories to the header search path ourselves.
#if (CMAKE_VERSION VERSION_LESS 2.8.11)
    #include_directories("${gtest_SOURCE_DIR}/include"
                        #"${gmock_SOURCE_DIR}/include")
#endif()
# ==============================================================================================


mark_as_advanced( ApproxMVBB_TESTS_HIGH_PERFORMANCE)
set(ApproxMVBB_TESTS_HIGH_PERFORMANCE OFF CACHE BOOL "Switch on high-performance tests, these require a lot of RAM and AdditionalFiles need to be in place")

set(ApproxMVBB_TESTS_OUTPUT_FILES_DIR "${PROJECT_BINARY_DIR}")
set(ApproxMVBB_TESTS_INPUT_FILES_DIR "${PROJECT_SOURCE_DIR}/files")
set(ApproxMVBB_TESTS_INPUT_FILES_ADD_DIR "${ApproxMVBB_ROOT_DIR}/additional/tests/files")
set(ApproxMVBB_TESTS_VALIDATION_FILES_DIR "${ApproxMVBB_ROOT_DIR}/additional/tests/files/validation")

# WRITE CONFIGURATION FILE
configure_file (
  "${PROJECT_SOURCE_DIR}/include/TestConfig.hpp.in.cmake"
  ${PROJECT_BINARY_DIR}/include/TestConfig.hpp
)
#=========================


set(SOURCE_FILES
    ${ApproxMVBB_SRC}
    ${PROJECT_SOURCE_DIR}/src/CommonFunctions.cpp
    ${PROJECT_SOURCE_DIR}/src/TestFunctions.cpp

)

set(INCLUDE_FILES
    ${ApproxMVBB_INC}
    ${PROJECT_SOURCE_DIR}/include/CommonFunctions.hpp
    ${PROJECT_SOURCE_DIR}/include/TestFunctions.hpp
    ${PROJECT_SOURCE_DIR}/include/ComputeApproxMVBBTests.hpp
)


#include directories
set(INCLUDE_DIRS
    ${ApproxMVBB_INC_DIRS}
    ${PROJECT_SOURCE_DIR}/include/
    ${PROJECT_BINARY_DIR}/include/
)

include_directories(${INCLUDE_DIRS})

# Define function to define compile definitions for all tests
function(defineCompileDefs Target)
    if(${CMAKE_CXX_COMPILER_ID} STREQUAL "GNU" OR ${CMAKE_CXX_COMPILER_ID} STREQUAL "Clang" OR ${CMAKE_CXX_COMPILER_ID} STREQUAL "Intel")
        target_compile_options(${Target} PRIVATE -DApproxMVBB_BUILD_TESTS )
    else()
        target_compile_options(${Target} PRIVATE /DApproxMVBB_BUILD_TESTS )
    endif()
endfunction()

# ConvexHull
set(EXEC_NAME1 ${PROJECT_NAME}-ConvexHull)
add_executable(${EXEC_NAME1}  ${PROJECT_SOURCE_DIR}/src/main_convexHullTests.cpp ${SOURCE_FILES} ${INCLUDE_FILES}   )
target_link_libraries(${EXEC_NAME1} ApproxMVBBForTestsOnly gtest gmock_main)
add_dependencies(build_and_test ${EXEC_NAME1})
if( NOT "${ApproxMVBB_DEPENDING_TARGETS}" STREQUAL "")
    add_dependencies(${EXEC_NAME1} ${ApproxMVBB_DEPENDING_TARGETS})
endif()
defineCompileDefs(${EXEC_NAME1})

# MinAreaRectangle
set(EXEC_NAME2 ${PROJECT_NAME}-MinAreaRect)
add_executable(${EXEC_NAME2}  ${SOURCE_FILES} ${INCLUDE_FILES}  ${PROJECT_SOURCE_DIR}/src/main_minAreaRectangleTests.cpp )
target_link_libraries(${EXEC_NAME2} ApproxMVBBForTestsOnly gtest gmock_main )
add_dependencies(build_and_test ${EXEC_NAME2})
if( NOT "${ApproxMVBB_DEPENDING_TARGETS}" STREQUAL "")
    add_dependencies(${EXEC_NAME2} ${ApproxMVBB_DEPENDING_TARGETS})
endif()
defineCompileDefs(${EXEC_NAME2})

set(EXEC_NAME5 ${PROJECT_NAME}-Diameter)
add_executable(${EXEC_NAME5}  ${SOURCE_FILES} ${INCLUDE_FILES}  ${PROJECT_SOURCE_DIR}/src/main_diameterTests.cpp )
target_link_libraries(${EXEC_NAME5} ApproxMVBBForTestsOnly gtest gmock_main )
add_dependencies(build_and_test ${EXEC_NAME5})
if( NOT "${ApproxMVBB_DEPENDING_TARGETS}" STREQUAL "")
    add_dependencies(${EXEC_NAME5} ${ApproxMVBB_DEPENDING_TARGETS})
endif()
defineCompileDefs(${EXEC_NAME5})

# DiamterOOBB
set(EXEC_NAME3 ${PROJECT_NAME}-DiameterOOBB)
add_executable(${EXEC_NAME3}  ${SOURCE_FILES} ${INCLUDE_FILES}  ${PROJECT_SOURCE_DIR}/src/main_diameterOOBBTests.cpp )
target_link_libraries(${EXEC_NAME3} ApproxMVBBForTestsOnly gtest gmock_main )
add_dependencies(build_and_test ${EXEC_NAME3})
if( NOT "${ApproxMVBB_DEPENDING_TARGETS}" STREQUAL "")
    add_dependencies(${EXEC_NAME3} ${ApproxMVBB_DEPENDING_TARGETS})
endif()
defineCompileDefs(${EXEC_NAME3})

# MVBB
set(EXEC_NAME4 ${PROJECT_NAME}-MVBB)
add_executable(${EXEC_NAME4}  ${SOURCE_FILES} ${INCLUDE_FILES}  ${PROJECT_SOURCE_DIR}/src/main_mvbbTests.cpp )
target_link_libraries(${EXEC_NAME4} ApproxMVBBForTestsOnly gtest gmock_main )
add_dependencies(build_and_test ${EXEC_NAME4})
if( NOT "${ApproxMVBB_DEPENDING_TARGETS}" STREQUAL "")
    add_dependencies(${EXEC_NAME4} ${ApproxMVBB_DEPENDING_TARGETS})
endif()
defineCompileDefs(${EXEC_NAME4})


add_custom_command(TARGET ${EXEC_NAME1} ${EXEC_NAME2} ${EXEC_NAME3} ${EXEC_NAME4} ${EXEC_NAME5} POST_BUILD
    COMMAND
          ${CMAKE_COMMAND}
          -E
          copy_directory ${PROJECT_SOURCE_DIR}/python/ ${PROJECT_BINARY_DIR}
)

add_test(NAME    ${EXEC_NAME1} COMMAND ${EXEC_NAME1})
add_test(NAME    ${EXEC_NAME2} COMMAND ${EXEC_NAME2})
add_test(NAME    ${EXEC_NAME5} COMMAND ${EXEC_NAME5})
add_test(NAME    ${EXEC_NAME3} COMMAND ${EXEC_NAME3})
add_test(NAME    ${EXEC_NAME4} COMMAND ${EXEC_NAME4})
