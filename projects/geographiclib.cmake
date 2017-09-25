# geographiclib
xpProOption(geographiclib)
set(VER 1.48)
set(PRO_GEOGRAPHICLIB
  NAME GeographicLib
  WEB "GeographicLib" https://geographiclib.sourceforge.io/ "GeographicLib website"
  LICENSE "MIT" "https://opensource.org/licenses/MIT" "GeographicLib license: MIT"
  DESC "GeographicLib is a small set of C++ classes for performing conversions between geographic, UTM, UPS, MGRS, geocentric, and local cartesian coordinates, for gravity (e.g., EGM2008), geoid height, and geomagnetic field (e.g., WMM2010) calculations, and for solving geodesic problems"
  REPO "repo" https://git.code.sf.net/p/geographiclib/code "GeographicLib git repo on sourceforge"
  VER ${VER}
  DLURL https://sourceforge.net/projects/geographiclib/files/distrib/GeographicLib-${VER}.tar.gz/download
  DLMD5 e99153cf41bf64998cc4f91c00aea167
  DLNAME GeographicLib-${VER}.tar.gz
  )
########################################
function(build_geographiclib)
  if(NOT (XP_DEFAULT OR XP_PRO_GEOGRAPHICLIB))
    return()
  endif()
  configure_file(${PRO_DIR}/use/usexp-geographiclib-config.cmake ${STAGE_DIR}/share/cmake/
    @ONLY NEWLINE_STYLE LF
    )
  xpCmakeBuild(geographiclib "" "" geographiclibTargets)
  if(ARGN)
    set(${ARGN} "${geographiclibTargets}" PARENT_SCOPE)
  endif()
endfunction()
########################################
