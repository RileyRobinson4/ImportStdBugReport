cmake_minimum_required(VERSION 3.29)

#Reference docs: 
# https://www.kitware.com/import-std-in-cmake-3-30/
# https://cmake.org/cmake/help/latest/manual/cmake-cxxmodules.7.html

set(CMAKE_EXPERIMENTAL_CXX_IMPORT_STD
  # This specific value changes as experimental support evolves. See
  # `Help/dev/experimental.rst` in the CMake source corresponding to
  # your CMake build for the exact value to use.
  "0e5b6991-d74f-4b3d-a41c-cf096e0b2508")

# Tell CMake that we explicitly want `import std`. This will initialize the
# property on all targets declared after this to 1
set(CMAKE_CXX_MODULE_STD ON)

# https://cmake.org/cmake/help/latest/manual/cmake-cxxmodules.7.html
# Support for import std is limited to the following toolchain and standard library combinations:
#  * Clang 18.1.2 and newer with -stdlib=libc++
set(CMAKE_CXX_COMPILER "clang")

project(BugReport LANGUAGES CXX)

# Libraries and Exe
add_executable(BugReport main.cxx)

target_link_libraries(BugReport PRIVATE BugReport_lib)

# Needed for module support
target_compile_features(BugReport PUBLIC cxx_std_23)