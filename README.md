Toolchains cmake
===============
This project is meant to collect a list of toolchain files which can be used for cross-compiling a cmake project.

A typical cmake project which needs a cross-compiling would pass a toolchain file.

    cmake -G "Unix Makefiles" -DCMAKE_TOOLCHAIN_FILE=<cmake-toolchain-file> <src-dir>
    
## Adding toolchains-cmake as a sub-project ##
You can import/add this project as a sub-project of yours using the famous git subtree.

The first thing is to track toolchains-cmake in your project to save some typing later on.

    git remote add thirdparty-toolchains-cmake https://github.com/antonindrawan/toolchains-cmake.git
   
Secondly, add a subtree

    git subtree add --squash --prefix=thirdparty/toolchains-cmake thirdparty-toolchains-cmake master

After the step above, the toolchains-cmake is already your sub-project on your local repository. Now, you want to update the remote repository as well.

    git push origin master

## Syncing updates from the sub-project ##
To get the latest version from the sub-project, you can pull it from your project

    git subtree pull --squash --prefix=thirdparty/toolchains-cmake thirdparty-toolchains-cmake master

## Making changes and bringing back to toolchains-cmake ##
You can modify the source and contribute the toolchains-cmake repository by bringing back your changes to the original repository.
With git-subtree, you can do this from your project.

    git subtree push --prefix=thirdparty/toolchains-cmake thirdparty-toolchains-cmake feature-branch
The last argument is the branch to which you commit.

That's all.
