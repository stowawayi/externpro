# GEOGRPAHICLIB_FOUND - GeographicLib was found
# GEOGRPAHICLIB_INCLUDE_DIR - the GeographicLib include directory
# GEOGRPAHICLIB_LIBRARIES - the GeographicLib libraries

set(prj geogrpahiclib)
# this file (-config) installed to share/cmake
get_filename_component(XP_ROOTDIR ${CMAKE_CURRENT_LIST_DIR}/../.. ABSOLUTE)
get_filename_component(XP_ROOTDIR ${XP_ROOTDIR} ABSOLUTE) # remove relative parts
# targets file (-targets) installed to lib/cmake
if(EXISTS ${XP_ROOTDIR}/lib/cmake/${prj}-targets.cmake)
  include(${XP_ROOTDIR}/lib/cmake/${prj}-targets.cmake)
endif()
string(TOUPPER ${prj} PRJ)
unset(${PRJ}_INCLUDE_DIR CACHE)
find_path(${PRJ}_INCLUDE_DIR Config.h PATHS ${XP_ROOTDIR}/include/${prj} NO_DEFAULT_PATH)
set(${PRJ}_INCLUDE_DIRS ${${PRJ}_INCLUDE_DIR})
set(${PRJ}_LIBRARIES GeographicLib_STATIC
set(reqVars ${PRJ}_INCLUDE_DIR ${PRJ}_INCLUDE_DIRS ${PRJ}_LIBRARIES)
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(${prj} REQUIRED_VARS ${reqVars})
mark_as_advanced(${reqVars})
