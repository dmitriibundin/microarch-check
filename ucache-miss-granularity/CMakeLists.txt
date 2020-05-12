cmake_minimum_required(VERSION 3.10)

set(CMAKE_EXPORT_COMPILE_COMMANDS 1)

project(microarch-check ASM_NASM)

#TODO: It does not work properly without adding -I option explicitly here
#
#This is to workaround necessary trailing slash in the include path.
#See https://bugzilla.nasm.us/show_bug.cgi?id=3392205
set(MICROARCH_CHECK_ASM_NASM_FLAGS "-f elf64 -g -I${PROJECT_SOURCE_DIR}/src/")
set(CMAKE_ASM_NASM_LINK_EXECUTABLE "ld <FLAGS> <CMAKE_ASM_NASM_LINK_FLAGS> <LINK_FLAGS> <OBJECTS>  -o <TARGET> <LINK_LIBRARIES>")
set(CMAKE_ASM_NASM_COMPILE_OBJECT "${CMAKE_ASM_NASM_COMPILE_OBJECT} ${MICROARCH_CHECK_ASM_NASM_FLAGS}")

set(MICROARCH_CHECK_ASM_NASM_SOURCES src/main.S)
set_source_files_properties(${MICROARCH_CHECK_ASM_NASM_SOURCES} PROPERTIES LANGUAGE ASM_NASM)

set(MICROARCH_CHECK_C_SOURCES "")
add_executable(bin ${MICROARCH_CHECK_ASM_NASM_SOURCES})
