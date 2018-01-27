macro(getIncludeInstallFolderPostfix PATH RESULT)
    get_filename_component(dir "${PATH}" DIRECTORY)
    message(STATUS ${dir})
    string(REGEX MATCH "include/(ApproxMVBB/.*)" _Dummy "${dir}")
    set(${RESULT} ${CMAKE_MATCH_1})
    message(STATUS ${${RESULT}})
endmacro()