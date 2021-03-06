set(ITK_PACKAGE_VERSION 4.0)
set(ITK_REPO_URL https://github.com/eile/ITK.git)
set(ITK_REPO_TAG release)
set(ITK_OPTIONAL ON)
set(ITK_CMAKE_INCLUDE "SYSTEM")

set(ITK_DISABLED_MODULES
  IOHDF5 # unrelocatable libhdf5
  # need c++0x
  IOTransformBase IOTransformHDF5 IOTransformInsightLegacy IOTransformMatlab)

set(ITK_CMAKE_ARGS -DITK_USE_SYSTEM_HDF5=ON
  -DBUILD_SHARED_LIBS=ON -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF
  -DCMAKE_CXX_FLAGS=${COMMON_CXXSTD_FLAGS})

foreach(ITK_DISABLED_MODULE ${ITK_DISABLED_MODULES})
  list(APPEND ITK_CMAKE_ARGS
    -DITK_MODULE_ITK${ITK_DISABLED_MODULE}_EXCLUDE_FROM_DEFAULT:BOOL=ON)
endforeach()
