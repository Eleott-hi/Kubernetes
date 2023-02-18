cmake_minimum_required(VERSION 3.5)

project(app VERSION 1.0 LANGUAGES CXX)

add_compile_options(-O3)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(EXCLUDE_DIRS tests)

find_package(OpenCV REQUIRED)

include_directories(
    Crow
    ${OpenCV_INCLUDE_DIRS}
)

file(GLOB_RECURSE PROJECT_SOURCES *.cc *.h)

foreach(i ${EXCLUDE_DIRS})
    message("Excluding dir: " ${i})
    list(FILTER PROJECT_SOURCES EXCLUDE REGEX ".*${i}.*")
endforeach()

foreach(i ${PROJECT_SOURCES})
    message("Project file: " ${i})
endforeach()

add_executable(${PROJECT_NAME} ${PROJECT_SOURCES})

target_link_libraries(${PROJECT_NAME} PRIVATE ${OpenCV_LIBS})
