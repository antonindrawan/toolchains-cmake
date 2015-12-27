Toolchains cmake
===============
This project is meant to collect a list of toolchain files which can be used for cross-compiling a cmake project.

A typical cmake project which needs a cross-compiling would pass a toolchain file.

    cmake -G "Unix Makefiles" -DCMAKE_TOOLCHAIN_FILE=<cmake-toolchain-file> <src-dir>
    

