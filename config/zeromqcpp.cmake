set(ZEROMQ_PACKAGE_VERSION 4)
set(ZEROMQCPP_OPTIONAL ON)
set(ZEROMQCPP_REPO_URL https://github.com/zeromq/cppzmq.git)
set(ZEROMQCPP_REPO_TYPE git)
set(ZEROMQCPP_REPO_TAG master)
set(ZEROMQCPP_DEPENDS REQUIRED zeromq)

set(ZEROMQCPP_SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/src/cppzmq")
set(ZEROMQCPP_EXTRA
    CONFIGURE_COMMAND touch ${CMAKE_BINARY_DIR}
    BUILD_COMMAND touch ${CMAKE_BINARY_DIR}
    INSTALL_COMMAND
        ${CMAKE_COMMAND} -E make_directory ${INSTALL_PATH}/include/ &&
        # Copy header
        ${CMAKE_COMMAND} -E copy_if_different ${ZEROMQCPP_SOURCE}/zmq.hpp ${INSTALL_PATH}/include/
)
