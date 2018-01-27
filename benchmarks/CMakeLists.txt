#The name of the project ====================================================================
project("ApproxMVBBBenchmarks")


# Add GoogleTests ===========================================================================
if (CMAKE_VERSION VERSION_LESS 3.2)
    set(UPDATE_DISCONNECTED_IF_AVAILABLE "")
else()
    set(UPDATE_DISCONNECTED_IF_AVAILABLE "UPDATE_DISCONNECTED 1")
endif()

include(DownloadProject)
download_project(PROJ                googlebenchmark
                 GIT_REPOSITORY      https://github.com/google/benchmark.git
                 GIT_TAG             master
                 ${UPDATE_DISCONNECTED_IF_AVAILABLE}
)

add_subdirectory(${googlebenchmark_SOURCE_DIR} ${googlebenchmark_BINARY_DIR} EXCLUDE_FROM_ALL)

# ==============================================================================================
set(ApproxMVBB_TESTS_OUTPUT_FILES_DIR "${PROJECT_BINARY_DIR}")
set(ApproxMVBB_TESTS_INPUT_FILES_DIR "${ApproxMVBB_ROOT_DIR}/tests/files")
set(ApproxMVBB_TESTS_INPUT_FILES_ADD_DIR "${ApproxMVBB_ROOT_DIR}/additional/tests/files")
set(ApproxMVBB_TESTS_VALIDATION_FILES_DIR "${ApproxMVBB_ROOT_DIR}/additional/tests/files/validation")

# WRITE CONFIGURATION FILE
configure_file (
  "${ApproxMVBB_ROOT_DIR}/tests/include/TestConfig.hpp.in.cmake"
  ${PROJECT_BINARY_DIR}/include/TestConfig.hpp
)

set(SOURCE_FILES
    ${ApproxMVBB_SRC}
    ${ApproxMVBB_ROOT_DIR}/tests/src/CommonFunctions.cpp
)

set(INCLUDE_FILES
    ${ApproxMVBB_INC}
    ${ApproxMVBB_ROOT_DIR}/tests/include/CommonFunctions.hpp
)

set(INCLUDE_DIRS
    ${ApproxMVBB_INC_DIRS}
    ${PROJECT_SOURCE_DIR}/include/
    ${PROJECT_BINARY_DIR}/include/
    ${ApproxMVBB_ROOT_DIR}/tests/include/
)

include_directories(${INCLUDE_DIRS})

set(EXEC_NAME1 ${PROJECT_NAME}-MVBB)
add_executable(${EXEC_NAME1}  ${PROJECT_SOURCE_DIR}/src/main_mvbbBenchmarks.cpp ${SOURCE_FILES} ${INCLUDE_FILES})
target_link_libraries(${EXEC_NAME1} ApproxMVBB benchmark)
if( NOT "${ApproxMVBB_DEPENDING_TARGETS}" STREQUAL "")
    add_dependencies(${EXEC_NAME1} ${ApproxMVBB_DEPENDING_TARGETS})
endif()
