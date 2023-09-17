# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(flutter_rdkafka_lib_library VERSION 0.0.1 LANGUAGES C)

add_library(flutter_rdkafka_lib SHARED
  "flutter_rdkafka_lib.c"
)

set_target_properties(flutter_rdkafka_lib PROPERTIES
  PUBLIC_HEADER flutter_rdkafka_lib.h
  OUTPUT_NAME "flutter_rdkafka_lib"
)

target_compile_definitions(flutter_rdkafka_lib PUBLIC DART_SHARED_LIB)
