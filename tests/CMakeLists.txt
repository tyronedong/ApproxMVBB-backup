# Add GoogleTests ===========================================================================
include(DownloadProject)
download_project(PROJ                googletest
                 GIT_REPOSITORY      https://github.com/google/googletest.git
                 GIT_TAG             master
                 UPDATE_DISCONNECTED 1
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

set(ApproxMVBB_TESTS_OUTPUT_FILES_DIR "${CMAKE_CURRENT_BINARY_DIR}")
set(ApproxMVBB_TESTS_INPUT_FILES_DIR "${CMAKE_CURRENT_SOURCE_DIR}/files")
set(ApproxMVBB_TESTS_INPUT_FILES_ADD_DIR "${ApproxMVBB_ROOT_DIR}/additional/tests/files")
set(ApproxMVBB_TESTS_VALIDATION_FILES_DIR "${ApproxMVBB_ROOT_DIR}/additional/tests/files/validation")

# WRITE CONFIGURATION FILE
configure_file (
  "${CMAKE_CURRENT_SOURCE_DIR}/include/TestConfig.hpp.in.cmake"
  ${CMAKE_CURRENT_BINARY_DIR}/include/TestConfig.hpp
)
#=========================

set(SOURCE_FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/src/CommonFunctions.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/TestFunctions.cpp
)

set(INCLUDE_FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/include/CommonFunctions.hpp
    ${CMAKE_CURRENT_SOURCE_DIR}/include/TestFunctions.hpp
    ${CMAKE_CURRENT_SOURCE_DIR}/include/ComputeApproxMVBBTests.hpp
)

#include directories
set(INCLUDE_DIRS
    ${CMAKE_CURRENT_SOURCE_DIR}/include/
    ${CMAKE_CURRENT_BINARY_DIR}/include/
)

# Define all tests targets
macro(defineTarget TARGETNAME)
    target_include_directories(${TARGETNAME} PRIVATE ${INCLUDE_DIRS})
    target_link_libraries(${TARGETNAME} PUBLIC ApproxMVBB::CoreForTests gtest gmock_main)
    add_dependencies(build_and_test ${TARGETNAME})

    setTargetCompileOptions(${TARGETNAME})

    if(${CMAKE_CXX_COMPILER_ID} STREQUAL "GNU" OR ${CMAKE_CXX_COMPILER_ID} STREQUAL "Clang" OR ${CMAKE_CXX_COMPILER_ID} STREQUAL "Intel")
        target_compile_options(${TARGETNAME} PRIVATE -DApproxMVBB_BUILD_TESTS )
    else()
        target_compile_options(${TARGETNAME} PRIVATE /DApproxMVBB_BUILD_TESTS )
    endif()

endmacro()

# ConvexHull
set(EXEC_NAME1 ${PROJECT_NAME}-ConvexHull)
add_executable(${EXEC_NAME1}  ${CMAKE_CURRENT_SOURCE_DIR}/src/main_convexHullTests.cpp ${SOURCE_FILES} ${INCLUDE_FILES}   )
defineTarget(${EXEC_NAME1})

# MinAreaRectangle
set(EXEC_NAME2 ${PROJECT_NAME}-MinAreaRect)
add_executable(${EXEC_NAME2}  ${SOURCE_FILES} ${INCLUDE_FILES}  ${CMAKE_CURRENT_SOURCE_DIR}/src/main_minAreaRectangleTests.cpp )
defineTarget(${EXEC_NAME2})

set(EXEC_NAME5 ${PROJECT_NAME}-Diameter)
add_executable(${EXEC_NAME5}  ${SOURCE_FILES} ${INCLUDE_FILES}  ${CMAKE_CURRENT_SOURCE_DIR}/src/main_diameterTests.cpp )
defineTarget(${EXEC_NAME5})

# DiamterOOBB
set(EXEC_NAME3 ${PROJECT_NAME}-DiameterOOBB)
add_executable(${EXEC_NAME3}  ${SOURCE_FILES} ${INCLUDE_FILES}  ${CMAKE_CURRENT_SOURCE_DIR}/src/main_diameterOOBBTests.cpp )
defineTarget(${EXEC_NAME3})

# MVBB
set(EXEC_NAME4 ${PROJECT_NAME}-MVBB)
add_executable(${EXEC_NAME4}  ${SOURCE_FILES} ${INCLUDE_FILES}  ${CMAKE_CURRENT_SOURCE_DIR}/src/main_mvbbTests.cpp )
defineTarget(${EXEC_NAME4})

# Copy python scripts
add_custom_command(TARGET ${EXEC_NAME1} ${EXEC_NAME2} ${EXEC_NAME3} ${EXEC_NAME4} ${EXEC_NAME5} POST_BUILD
    COMMAND
          ${CMAKE_COMMAND}
          -E
          copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/python/ ${PROJECT_BINARY_DIR}
)

add_test(NAME    ${EXEC_NAME1} COMMAND ${EXEC_NAME1})
add_test(NAME    ${EXEC_NAME2} COMMAND ${EXEC_NAME2})
add_test(NAME    ${EXEC_NAME5} COMMAND ${EXEC_NAME5})
add_test(NAME    ${EXEC_NAME3} COMMAND ${EXEC_NAME3})
add_test(NAME    ${EXEC_NAME4} COMMAND ${EXEC_NAME4})
