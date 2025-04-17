## Build Container
```podman build -t redhat-bug-report -f Containerfile .```
## Run Container (Build Code)
```podman run --rm redhat-bug-report:latest```

## Expected Output
```
-- The CXX compiler identification is Clang 19.1.7
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/clang - skipped
-- Detecting CXX compile features
CMake Warning (dev) at /usr/share/cmake/Modules/Compiler/CMakeCommonCompilerMacros.cmake:248 (cmake_language):
  CMake's support for `import std;` in C++23 and newer is experimental.  It
  is meant only for experimentation and feedback to CMake developers.
Call Stack (most recent call first):
  /usr/share/cmake/Modules/CMakeDetermineCompilerSupport.cmake:113 (cmake_create_cxx_import_std)
  /usr/share/cmake/Modules/CMakeTestCXXCompiler.cmake:83 (CMAKE_DETERMINE_COMPILER_SUPPORT)
  CMakeLists.txt:18 (project)
This warning is for project developers.  Use -Wno-dev to suppress it.

-- Detecting CXX compile features - done
-- Configuring done (0.1s)
CMake Error in CMakeLists.txt:
  The "CXX_MODULE_STD" property on the target "BugReport_lib" requires that
  the "__CMAKE::CXX23" target exist, but it was not provided by the
  toolchain.  Reason:

    Only `libc++` is supported


CMake Error in CMakeLists.txt:
  The "CXX_MODULE_STD" property on the target "BugReport" requires that the
  "__CMAKE::CXX23" target exist, but it was not provided by the toolchain.
  Reason:

    Only `libc++` is supported


-- Generating done (0.0s)
CMake Generate step failed.  Build files cannot be regenerated correctly.
```