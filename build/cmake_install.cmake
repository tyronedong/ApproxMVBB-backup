# Install script for directory: D:/Github/ApproxMVBB

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "D:/Github/ApproxMVBB/build/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB/Common" TYPE FILE FILES "D:/Github/ApproxMVBB/include/ApproxMVBB/Common/AssertionDebug.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB/Common" TYPE FILE FILES "D:/Github/ApproxMVBB/include/ApproxMVBB/Common/ContainerTag.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB/Common" TYPE FILE FILES "D:/Github/ApproxMVBB/include/ApproxMVBB/Common/CPUTimer.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB/Common" TYPE FILE FILES "D:/Github/ApproxMVBB/include/ApproxMVBB/Common/Exception.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB/Common" TYPE FILE FILES "D:/Github/ApproxMVBB/include/ApproxMVBB/Common/FloatingPointComparision.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB/Common" TYPE FILE FILES "D:/Github/ApproxMVBB/include/ApproxMVBB/Common/LogDefines.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB/Common" TYPE FILE FILES "D:/Github/ApproxMVBB/include/ApproxMVBB/Common/MyContainerTypeDefs.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB/Common" TYPE FILE FILES "D:/Github/ApproxMVBB/include/ApproxMVBB/Common/MyMatrixTypeDefs.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB/Common" TYPE FILE FILES "D:/Github/ApproxMVBB/include/ApproxMVBB/Common/Platform.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB/Common" TYPE FILE FILES "D:/Github/ApproxMVBB/include/ApproxMVBB/Common/SfinaeMacros.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB/Common" TYPE FILE FILES "D:/Github/ApproxMVBB/include/ApproxMVBB/Common/StaticAssert.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB/Common" TYPE FILE FILES "D:/Github/ApproxMVBB/include/ApproxMVBB/Common/TypeDefs.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB/Common" TYPE FILE FILES "D:/Github/ApproxMVBB/include/ApproxMVBB/Common/TypeDefsPoints.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB" TYPE FILE FILES "D:/Github/ApproxMVBB/include/ApproxMVBB/AABB.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB" TYPE FILE FILES "D:/Github/ApproxMVBB/include/ApproxMVBB/AngleFunctions.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB" TYPE FILE FILES "D:/Github/ApproxMVBB/include/ApproxMVBB/ComputeApproxMVBB.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB" TYPE FILE FILES "D:/Github/ApproxMVBB/include/ApproxMVBB/ContainerFunctions.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB" TYPE FILE FILES "D:/Github/ApproxMVBB/include/ApproxMVBB/ConvexHull2D.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB" TYPE FILE FILES "D:/Github/ApproxMVBB/include/ApproxMVBB/GreatestCommonDivisor.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB" TYPE FILE FILES "D:/Github/ApproxMVBB/include/ApproxMVBB/KdTree.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB" TYPE FILE FILES "D:/Github/ApproxMVBB/include/ApproxMVBB/KdTreeXml.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB" TYPE FILE FILES "D:/Github/ApproxMVBB/include/ApproxMVBB/MakeCoordinateSystem.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB" TYPE FILE FILES "D:/Github/ApproxMVBB/include/ApproxMVBB/MinAreaRectangle.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB" TYPE FILE FILES "D:/Github/ApproxMVBB/include/ApproxMVBB/OOBB.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB" TYPE FILE FILES "D:/Github/ApproxMVBB/include/ApproxMVBB/PointFunctions.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB" TYPE FILE FILES "D:/Github/ApproxMVBB/include/ApproxMVBB/ProjectedPointSet.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB" TYPE FILE FILES "D:/Github/ApproxMVBB/include/ApproxMVBB/RandomGenerators.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB/Diameter" TYPE FILE FILES "D:/Github/ApproxMVBB/external/Diameter/include/ApproxMVBB/Diameter/EstimateDiameter.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB/Diameter" TYPE FILE FILES "D:/Github/ApproxMVBB/external/Diameter/include/ApproxMVBB/Diameter/TypeSegment.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB/GeometryPredicates" TYPE FILE FILES "D:/Github/ApproxMVBB/external/GeometryPredicates/include/ApproxMVBB/GeometryPredicates/PredicatesInit.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB/GeometryPredicates" TYPE FILE FILES "D:/Github/ApproxMVBB/external/GeometryPredicates/include/ApproxMVBB/GeometryPredicates/Predicates.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB/GeometryPredicates" TYPE FILE FILES "D:/Github/ApproxMVBB/external/GeometryPredicates/include/ApproxMVBB/GeometryPredicates/Rounding.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB/GeometryPredicates" TYPE FILE FILES "D:/Github/ApproxMVBB/build/include/ApproxMVBB/GeometryPredicates/Config.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ApproxMVBB/Config" TYPE FILE FILES "D:/Github/ApproxMVBB/build/include/ApproxMVBB/Config/Config.hpp")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("D:/Github/ApproxMVBB/build/lib/cmake_install.cmake")
  include("D:/Github/ApproxMVBB/build/tests/cmake_install.cmake")
  include("D:/Github/ApproxMVBB/build/example/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "D:/Github/ApproxMVBB/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
