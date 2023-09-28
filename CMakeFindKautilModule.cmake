macro(CMakeFindKautilModule prfx)
    set(${PROJECT_NAME}_m_evacu ${m})
    set(m ${PROJECT_NAME}.CMakeFindKautilModule)
    list(APPEND ${m}_unsetter ${m}_NAME ${m}_NO_INSTALL)
    cmake_parse_arguments(${m} "NO_INSTALL" "NAME" "" ${ARGV})
    
    find_package(${${m}_NAME} REQUIRED)
    if(NOT ${${m}_NO_INSTALL})
        install(CODE "execute_process(COMMAND cmake --install \"${${prfx}.BUILD_DIR}\" --prefix='\${CMAKE_INSTALL_PREFIX}' )")
    endif()
    
    list(APPEND ${prfx}.VARS_buf ${${prfx}.VARS} ${prfx}.CONFIGURE_STRING)
    list(REMOVE_DUPLICATES ${prfx}.VARS_buf)
    set(${prfx}.VARS ${${prfx}.VARS_buf} CACHE STRING "variables struct ${prfx} has." FORCE)
    string(APPEND ${prfx}.CONFIGURE_STRING 
            "set(${${m}_NAME}_DIR \"\\$\\{PACKAGE_PREFIX_DIR}/lib/cmake/${${m}_NAME}\")\n" 
            "find_package(${${m}_NAME} REQUIRED)\n" 
            "\n")
    foreach(__v ${${m}_unsetter})
        unset(${__v})
    endforeach()
    unset(${m}_unsetter)
    set(m ${${PROJECT_NAME}_m_evacu})
endmacro()

