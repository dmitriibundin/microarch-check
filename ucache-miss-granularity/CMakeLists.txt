cmake_minimum_required(VERSION 3.10)

set(CMAKE_EXPORT_COMPILE_COMMANDS 1)

project(microarch-check C ASM_NASM)

set(MICROARCH_CHECK_C_FLAGS "-Werror \
                         -Wextra \
                         -Wall \
                         -pedantic \
                         -Wno-stack-protector \
                         -g3 \
                         -O3 \
                         -Wno-unused-result \
                         -Wno-unused-parameter\
                         -Wstrict-prototypes")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${MICROARCH_CHECK_C_FLAGS}")

set(MICROARCH_CHECK_ASM_NASM_FLAGS "-f elf64 -g")
set(CMAKE_ASM_NASM_LINK_EXECUTABLE "ld <FLAGS> <CMAKE_ASM_NASM_LINK_FLAGS> <LINK_FLAGS> <OBJECTS>  -o <TARGET> <LINK_LIBRARIES>")
set(CMAKE_ASM_NASM_COMPILE_OBJECT "${CMAKE_ASM_NASM_COMPILE_OBJECT} ${MICROARCH_CHECK_ASM_NASM_FLAGS}")

set(MICROARCH_CHECK_ASM_NASM_SOURCES src/ucache-miss-check.S)
set_source_files_properties(${MICROARCH_CHECK_ASM_NASM_SOURCES} PROPERTIES LANGUAGE ASM_NASM)

set(MICROARCH_CHECK_C_SOURCES "src/main.c")
add_executable(bin ${MICROARCH_CHECK_C_SOURCES} ${MICROARCH_CHECK_ASM_NASM_SOURCES})
target_include_directories(bin PRIVATE include)
set_target_properties(bin PROPERTIES LINKER_LANGUAGE C)
