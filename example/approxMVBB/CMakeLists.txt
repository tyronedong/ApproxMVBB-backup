

#The name of the project ====================================================================
project("ApproxMVBBExample")



set(SOURCE_FILES
    src/main.cpp
)

set(INCLUDE_FILES
    ${ApproxMVBB_INC}
)

set(INCLUDE_DIRS
    ${ApproxMVBB_INC_DIRS_DEP}
    ${ApproxMVBB_INC_DIRS}
)

add_executable(${PROJECT_NAME}  ${SOURCE_FILES} ${INCLUDE_FILES} )
target_link_libraries(${PROJECT_NAME} "ApproxMVBB")
target_include_directories(${INCLUDE_DIRS})
