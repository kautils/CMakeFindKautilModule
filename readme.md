### CMakeFindKautilModule
* result 
    * (0) find_package for specified module.
    * (1) generate string for installlaion of specified module. 
    * (2) installation command for specified module is automatically added.
* used with CMakeFetchKautilModule

```cmake
if(NOT EXISTS ${CMAKE_BINARY_DIR}/CMakeKautilHeader.cmake)
    file(DOWNLOAD https://raw.githubusercontent.com/kautils/CMakeKautilHeader/v0.0.1/CMakeKautilHeader.cmake ${CMAKE_BINARY_DIR}/CMakeKautilHeader.cmake)
endif()
include(${CMAKE_BINARY_DIR}/CMakeKautilHeader.cmake)
git_clone(https://raw.githubusercontent.com/kautils/CMakeFetchKautilModule/v0.0.1/CMakeFetchKautilModule.cmake)
git_clone(https://raw.githubusercontent.com/kautils/CMakeFindKautilModule/v0.0.1/CMakeFindKautilModule.cmake)

CMakeFetchKautilModule(c11_string_allocator
        GIT https://github.com/kautils/c11_string_allocator.git 
        REMOTE origin 
        TAG v0.0.1)
CMakeFindKautilModule(c11_string_allocator NAME KautilC11StringAllocator.0.0.1.static)

# (1)
# string for find pacakge. it is expected to be used in configure.in   
message(${c11_string_allocator.CONFIGURE_STRING})  

# (2)
# below command is added into cmake_install.cmake 
# execute_process(COMMAND cmake --install "${c11_string_allocator.BUILD_DIR}" --prefix='${CMAKE_INSTALL_PREFIX}' )
```