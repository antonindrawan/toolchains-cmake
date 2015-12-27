include(CMakeForceCompiler)

set(CMAKE_SYSTEM_NAME QNX)

CMAKE_FORCE_C_COMPILER("$ENV{QNX_HOST}/usr/bin/qcc" QCC)
CMAKE_FORCE_CXX_COMPILER("$ENV{QNX_HOST}/usr/bin/QCC" QCC)

# Setting QNX compiler flags
set(QNX_FLAGS "-Vgcc_ntoarmv7le")
set(QNX_FLAGS "${QNX_FLAGS} -lang-c++")
set(QNX_FLAGS "${QNX_FLAGS} -Werror")
set(QNX_FLAGS "${QNX_FLAGS} -Wc,-fPIC")
set(QNX_FLAGS "${QNX_FLAGS} -Wc,-finline-functions")
set(QNX_FLAGS "${QNX_FLAGS} -lm")
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
  set(QNX_FLAGS "${QNX_FLAGS} -O0 -g")
elseif(CMAKE_BUILD_TYPE STREQUAL "Release")
  set(QNX_FLAGS "${QNX_FLAGS} -O2")
endif()

# As cmake C/CXX flags are set in this toolchain file (passed to cmake
# using -DCMAKE_TOOLCHAIN_FILE these cmake variables have to be cached.
set(CMAKE_C_FLAGS "${QNX_FLAGS}" CACHE STRING "")
set(CMAKE_CXX_FLAGS "${QNX_FLAGS}" CACHE STRING "")

# Detect the target architecture by checking the compiler flags
set(TARGET_ARCH "x86")
if(${CMAKE_CXX_FLAGS} MATCHES "ntoarmv7le")
  set(TARGET_ARCH "armle-v7")
endif()

# Set the target directories
set(CMAKE_FIND_ROOT_PATH "$ENV{QNX_TARGET}/${TARGET_ARCH}")
message(STATUS "CMAKE_FIND_ROOT_PATH: ${CMAKE_FIND_ROOT_PATH}")

# Search for programs in the build host directories.
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# Search for libraries and headers in the target directories.
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

add_definitions(-DQNX=1)
