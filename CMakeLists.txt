cmake_minimum_required(VERSION 3.10)

# 设置项目名称和版本
project(MyOpenSSLApp VERSION 1.0)

# 设置C语言标准
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

# 寻找OpenSSL库
find_package(OpenSSL REQUIRED)

# 包含OpenSSL头文件目录
# include_directories(${OPENSSL_INCLUDE_DIR})

# 定义可执行文件
add_executable(MyOpenSSLApp main.c)

# 链接OpenSSL库
# target_link_libraries(MyOpenSSLApp ${OPENSSL_LIBRARIES})
target_link_libraries(MyOpenSSLApp OpenSSL::Crypto)

