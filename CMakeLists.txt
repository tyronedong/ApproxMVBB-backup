#The CMake Minimum version that is required.
cmake_minimum_required(VERSION 3.5)

set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/;${CMAKE_MODULE_PATH}")
message(STATUS "Module path is now set to: " ${CMAKE_MODULE_PATH} )

set(CMAKE_VERBOSE_MAKEFILE ON)

#The name of the project ===============================================
set(ApproxMVBBProjectName "ApproxMVBB")
if(${CMAKE_GENERATOR} MATCHES "Unix Makefiles")
        set(ApproxMVBBProjectName  "${ApproxMVBBProjectName}-${PROJECTNAMEPREFIX}")
endif()
message(STATUS "Project name is: " ${ApproxMVBBProjectName})
project(${ApproxMVBBProjectName})

set(ApproxMVBB_BINARY_DIR ${PROJECT_BINARY_DIR})
set(ApproxMVBB_ROOT_DIR   ${PROJECT_SOURCE_DIR})

# PRECISION ISSUES =====================================================
# From http://christian-seiler.de/projekte/fpmath/
#x86 platforms support two types of floating point instruction sets nowadays:
#The classical x87 floating point unit and the new MMX/SSE instructions that can even perform parallel calculations.
#The characteristics of the x87 FPU are:

    #Different instructions for loading and storing different types of floating point numbers from and to memory.
    #A single instruction set for performing calculations.
    #An internal precision with which all calculations are done.
    #Instructions to change the internal precision
    #Support for single, double and double-extended precision.
#The characteristics of the MMX/SSE instructions are:

    #Different instructions for loading and storing different types of floating point numbers from and to memory.
    #Different instructions for performing caluclations depending on the data types in the registers.
    #Calculation precision is dependent on operhand types.
    #Supports only single and double precision
    #Support for parallel computation.
# What we wont in this library is, only the GeometricPredicates need "double precision" (not extended precision)
# That means either by using only sse instruction set this is enforced or by manually setting the FPU unit to double precision
# so far we manually set it to double precision in the Predicates,
# on Windows (64bit) we cannot change FPU precision, so we use the sse flag to ensure only "double precision"
#=======================================================================

message(STATUS "Compiler ID is: " ${CMAKE_CXX_COMPILER_ID})
if(NOT MYPROJECT_DONTSET_COMPILER_FLAGS_INTERNAL)
	if(${CMAKE_CXX_COMPILER_ID} STREQUAL "GNU")

		set(MYPROJECT_DONTSET_COMPILER_FLAGS_INTERNAL TRUE CACHE INTERNAL "x" FORCE)
		message(STATUS "Setting Values for GNU")
		set(CMAKE_C_FLAGS "-fmessage-length=0 -fmax-errors=50" CACHE STRING "Flags for C Compiler" FORCE)
		set(CMAKE_CXX_FLAGS "-std=c++11 -fmax-errors=50 -Werror=return-type" CACHE STRING "Flags for CXX Compiler" FORCE)
		set(CMAKE_CXX_FLAGS_DEBUG          "-g -fsanitize=address -Wall -Wpedantic -Wno-char-subscripts" CACHE STRING "Flags for CXX Compiler for debug builds" FORCE)

	elseif( ${CMAKE_CXX_COMPILER_ID} STREQUAL "Clang" )

		message(STATUS "Setting Values for Clang")
		set(MYPROJECT_DONTSET_COMPILER_FLAGS_INTERNAL TRUE CACHE INTERNAL "x" FORCE)
		set(CMAKE_C_FLAGS                "" CACHE STRING "Flags for C Compiler" FORCE)
		set(CMAKE_C_FLAGS_DEBUG          "-g -Weverything" CACHE STRING "Flags for C Compiler for debug builds" FORCE)
		set(CMAKE_C_FLAGS_MINSIZEREL     "-Os -DNDEBUG -w" CACHE STRING "Flags for C Compiler for release minsize builds" FORCE)
		set(CMAKE_C_FLAGS_RELEASE        "-O3 -DNDEBUG -w" CACHE STRING "Flags for C Compiler for release builds" FORCE)
		set(CMAKE_C_FLAGS_RELWITHDEBINFO "-O2 -g" CACHE STRING "Flags for C Compiler for release builds with debug info" FORCE)

		set(CMAKE_CXX_FLAGS                "-std=c++11 -Werror=return-type" CACHE STRING "Flags for CXX Compiler" FORCE)
		set(CMAKE_CXX_FLAGS_DEBUG          "-g -fsanitize=leak -fsanitize=address -Weverything -Wpedantic -Wno-deprecated-register -Wno-documentation -Wno-comment -Wno-float-equal -Wno-deprecated -Wno-c++98-compat -Wno-unused-macros" CACHE STRING "Flags for CXX Compiler for debug builds" FORCE)
		set(CMAKE_CXX_FLAGS_MINSIZEREL     "-Os -DNDEBUG -w" CACHE STRING "Flags for CXX Compiler for release minsize builds" FORCE)
		set(CMAKE_CXX_FLAGS_RELEASE        "-O3 -DNDEBUG -w" CACHE STRING "Flags for CXX Compiler for release builds" FORCE)
		set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O2 -g" CACHE STRING "Flags for CXX Compiler for release builds with debug info" FORCE)

        # SET(CMAKE_AR      "/usr/bin/local/llvm-ar" CACHE STRING "archiver" FORCE )
        # SET(CMAKE_LINKER  "/usr/bin/local/llvm-ld" CACHE STRING "linker tool" FORCE )
        # SET(CMAKE_NM      "/usr/bin/local/llvm-nm" CACHE STRING "nm tool" FORCE )
        # SET(CMAKE_OBJDUMP "/usr/bin/local/llvm-objdump" CACHE STRING "objdump tool" FORCE )
        # SET(CMAKE_RANLIB  "/usr/bin/local/llvm-ranlib" CACHE STRING "ranlib tool" FORCE )

	elseif( ${CMAKE_CXX_COMPILER_ID} STREQUAL "Intel" )

        message(STATUS "Setting Values for Intel")
		set(MYPROJECT_DONTSET_COMPILER_FLAGS_INTERNAL TRUE CACHE INTERNAL "x" FORCE)
		set(CMAKE_C_FLAGS                "" CACHE STRING "Flags for C Compiler" FORCE)
		set(CMAKE_C_FLAGS_DEBUG          "-g -Wall" CACHE STRING "Flags for C Compiler for debug builds" FORCE)
		set(CMAKE_C_FLAGS_MINSIZEREL     "-Os -DNDEBUG" CACHE STRING "Flags for C Compiler for release minsize builds" FORCE)
		set(CMAKE_C_FLAGS_RELEASE        "-O3 -DNDEBUG" CACHE STRING "Flags for C Compiler for release builds" FORCE)
		set(CMAKE_C_FLAGS_RELWITHDEBINFO "-O2 -g" CACHE STRING "Flags for C Compiler for release builds with debug info" FORCE)

		set(CMAKE_CXX_FLAGS                "-std=c++11 " CACHE STRING "Flags for CXX Compiler" FORCE)
		set(CMAKE_CXX_FLAGS_DEBUG          "-g -Wall" CACHE STRING "Flags for CXX Compiler for debug builds" FORCE)
		set(CMAKE_CXX_FLAGS_MINSIZEREL     "-Os -DNDEBUG" CACHE STRING "Flags for CXX Compiler for release minsize builds" FORCE)
		set(CMAKE_CXX_FLAGS_RELEASE        "-O3 -DNDEBUG" CACHE STRING "Flags for CXX Compiler for release builds" FORCE)
		set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O2 -g" CACHE STRING "Flags for CXX Compiler for release builds with debug info" FORCE)

  elseif( ${CMAKE_CXX_COMPILER_ID} STREQUAL "MSVC" )
    message(WARNING "MSVC is partially supported (Visual Studio 2013 Update 5), trying to set compiler flags anyway!")
    # add some flags
		set(CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS} "/arch:SSE2" CACHE STRING "Flags for CXX Compiler" FORCE)
    # We cannot control the FPU unit in 64bit mode, this flag makes MSVC to not use x87 stuff in 64bit (or 32bit) mode
    # so no extended precision should be used, if that does not work, there is the flag /fp:strict
		# NOTE: SSE is already enabled for x64 compiler
		# as per http://stackoverflow.com/questions/1067630/sse2-option-in-visual-c-x64
  endif()
endif()

# Add the ccache to the build system
if(${CMAKE_GENERATOR} MATCHES "Unix Makefiles")
find_program(CCACHE_FOUND ccache)
  if(CCACHE_FOUND)
      set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
      set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
  endif(CCACHE_FOUND)
endif()

#Add some multithreaded build support ==================================
mark_as_advanced(MULTITHREADED_BUILD)
set(MULTITHREADED_BUILD ON CACHE BOOL "Parallel build with as many threads as possible!")
if(MULTITHREADED_BUILD)
	if(${CMAKE_GENERATOR} MATCHES "Unix Makefiles")
            file(COPY ${ApproxMVBB_ROOT_DIR}/cmake/parallelmake.sh DESTINATION ${PROJECT_BINARY_DIR}
                FILE_PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE
                NO_SOURCE_PERMISSIONS
            )
            set(CMAKE_MAKE_PROGRAM "${PROJECT_BINARY_DIR}/parallelmake.sh")
            message(STATUS "Set make program to ${PROJECT_BINARY_DIR}/parallelmake.sh")
    elseif(MSVC)
      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}" "/MP")
      message(STATUS "Added parallel build arguments to CMAKE_CXX_FLAGS: ${CMAKE_CXX_FLAGS}")
    endif()
endif()
# ======================================================================

#Optional Stuff ========================================================
mark_as_advanced( CMAKE_DEBUG_POSTFIX )
set(CMAKE_DEBUG_POSTFIX "-dbg" CACHE STRING "Debug postfix for library/executable")

mark_as_advanced( ApproxMVBB_BUILD_LIBRARY )
set(ApproxMVBB_BUILD_LIBRARY ON CACHE BOOL "Build a shared library")

mark_as_advanced( ApproxMVBB_BUILD_TESTS)
set(ApproxMVBB_BUILD_TESTS OFF CACHE BOOL "Build the tests")

mark_as_advanced( ApproxMVBB_BUILD_BENCHMARKS)
set(ApproxMVBB_BUILD_BENCHMARKS OFF CACHE BOOL "Build the benchmarks (only meaningful in Release!)")

mark_as_advanced( ApproxMVBB_BUILD_EXAMPLE )
set(ApproxMVBB_BUILD_EXAMPLE OFF CACHE BOOL "Build the example, the library is automatically built if this is true")

mark_as_advanced( ApproxMVBB_FORCE_MSGLOG_LEVEL)
set(ApproxMVBB_FORCE_MSGLOG_LEVEL "0" CACHE STRING "Force the message log level (0-3), 0 = use deubg/release settings in LogDefines.hpp!")

mark_as_advanced( ApproxMVBB_USE_OPENMP)
set(ApproxMVBB_USE_OPENMP ON CACHE BOOL "Try to use OpenMp for parallel speedup")

mark_as_advanced( ApproxMVBB_BUILD_LIBRARY_STATIC  )
set(ApproxMVBB_BUILD_LIBRARY_STATIC OFF CACHE BOOL "Build a static library")
#=======================================================================

# Dependencies =========================================================
# Define Eigen
find_package(Eigen3 REQUIRED)
set(EIGEN_INCLUDE_DIR ${EIGEN3_INCLUDE_DIR})
list(APPEND ApproxMVBB_INC_DIRS_DEP ${EIGEN_INCLUDE_DIR})


# Try to find Meta and PugiXML if possible
find_package(Meta)
if(META_FOUND)
    list(APPEND ApproxMVBB_INC_DIRS_DEP ${Meta_INCLUDE_DIR})
    list(APPEND ApproxMVBB_DEPENDING_TARGETS_DEP ${Meta_TARGET})
    set(ApproxMVBB_SUPPORT_KDTREE ON)
endif()

find_package(PugiXML)
if(PUGIXML_FOUND)
    list(APPEND ApproxMVBB_INC_DIRS_DEP ${PUGIXML_INCLUDE_DIR} )
    list(APPEND ApproxMVBB_LIBRARIES_DEP ${PUGIXML_LIBRARIES})
    set(ApproxMVBB_SUPPORT_XML ON)
endif()

if(ApproxMVBB_USE_OPENMP)

    include(ProcessorCount)
    ProcessorCount(NPROCESSES)

    find_package(OpenMP)
    if(OpenMP_FOUND)
        set(MYPROJECT_CXX_FLAGS "${MYPROJECT_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
        set(ApproxMVBB_OPENMP_SUPPORT ON)

        mark_as_advanced( ApproxMVBB_OPENMP_USE_NTHREADS)
        set(ApproxMVBB_OPENMP_USE_NTHREADS OFF CACHE BOOL "If the number of threads should be fixed, otherwise determined at runtime!")

        if(ApproxMVBB_OPENMP_USE_NTHREADS)
            set(ApproxMVBB_OPENMP_NTHREADS ${NPROCESSES} CACHE STRING "The number of threads to use.")
            mark_as_advanced( ApproxMVBB_OPENMP_NTHREADS )
        endif()

    else()
        set(ApproxMVBB_OPENMP_SUPPORT OFF)
    endif()
endif()
# ======================================================================

if(ApproxMVBB_BUILD_EXAMPLE)
    set(ApproxMVBB_BUILD_LIBRARY On CACHE BOOL "Build a shared library" FORCE)
endif()

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${MYPROJECT_CXX_FLAGS}")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${MYPROJECT_CXX_FLAGS}")
message(STATUS "Added '${MYPROJECT_CXX_FLAGS}' to CMAKE_CXX and CMAKE_C_FLAGS: ${CMAKE_CXX_FLAGS} and ${CMAKE_C_FLAGS}")

# Define Install Directories
# Install stuff (default location is not some where on the system! for safty reasons)
if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    set(CMAKE_INSTALL_PREFIX "${PROJECT_BINARY_DIR}/../install" CACHE STRING "Install prefix (e.g. /usr/local/)" FORCE)
endif()
if(UNIX)
    include(GNUInstallDirs)
    set(ApproxMVBB_INC_INSTALL_DIR "${CMAKE_INSTALL_INCDIR}") 
    set(ApproxMVBB_RUNTIME_INSTALL_DIR "${CMAKE_INSTALL_BINDIR}") 
    set(ApproxMVBB_LIBRARY_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}")
    set(ApproxMVBB_ARCHIVE_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}")
    set(ApproxMVBB_FRAMEWORK_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}")

    set(ApproxMVBB_INSTALL_FULL_LIBDIR "${CMAKE_INSTALL_FULL_LIBDIR}")

    set(ApproxMVBB_CMAKE_CONFIG_INSTALL_DIR "${CMAKE_INSTALL_DATADIR}/ApproxMVBB/cmake")
    set(ApproxMVBB_ADDITIONAL_FILES_INSTALL_DIR "${CMAKE_INSTALL_DATADIR}/ApproxMVBB")
else(WINDOWS)
    set(ApproxMVBB_INC_INSTALL_DIR "${CMAKE_INSTALL_INCDIR}") 
    set(ApproxMVBB_RUNTIME_INSTALL_DIR "bin") 
    set(ApproxMVBB_LIBRARY_INSTALL_DIR "bin")
    set(ApproxMVBB_ARCHIVE_INSTALL_DIR "lib")
    set(ApproxMVBB_FRAMEWORK_INSTALL_DIR "bin")

    set(ApproxMVBB_CMAKE_CONFIG_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/cmake")
    set(ApproxMVBB_ADDITIONAL_FILES_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}")
endif()

# Define all MVBB Source files
include(DefineApproxMVBBSources)
set(ApproxMVBB_INCLUDE_DIR "${PROJECT_SOURCE_DIR}/include/ApproxMVBB")
set(ApproxMVBB_EXTERNAL_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/external/Diameter/include/ApproxMVBB"
                                     "${PROJECT_SOURCE_DIR}/external/GeometryPredicates/include/ApproxMVBB")

#Include all relevant sources
include_all_approxmvbb_source(ApproxMVBB_SRC
                              ApproxMVBB_INC
                              ApproxMVBB_INC_DIRS
                              ApproxMVBB_DEPENDING_TARGETS
                              ${PROJECT_SOURCE_DIR} ${ApproxMVBB_BINARY_DIR} )

set(ApproxMVBB_LICENSE_FILE "${CMAKE_CURRENT_SOURCE_DIR}/COPYING")
set(ApproxMVBB_README_FILE "${CMAKE_CURRENT_SOURCE_DIR}/README.md")

set(ApproxMVBB_LINK_LIBS ${ApproxMVBB_LIBRARIES_DEP})
message(STATUS "Linking Libs: ${ApproxMVBB_LINK_LIBS}")
list(APPEND ApproxMVBB_DEPENDING_TARGETS ${ApproxMVBB_DEPENDING_TARGETS_DEP})

if(ApproxMVBB_BUILD_LIBRARY)
    add_subdirectory(lib)
endif()

if(ApproxMVBB_BUILD_TESTS)
    enable_testing()
    add_custom_target(build_and_test ${CMAKE_CTEST_COMMAND} -V)
    add_subdirectory(tests)
endif()

if(ApproxMVBB_BUILD_BENCHMARKS)
    add_subdirectory(benchmarks)
endif()

if(ApproxMVBB_BUILD_EXAMPLE)
    add_subdirectory(example)
endif()
