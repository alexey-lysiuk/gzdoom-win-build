### Environment for building (G)ZDoom on Windows

#### Prerequisites
Visual Studio 2015 with Visual C++ is required to build (G)ZDoom.

Microsoft offers [Visual Studio Community 2015](https://www.visualstudio.com/en-us/products/visual-studio-community-vs.aspx) for free. However this edition doesn't install Visual C++ by default. You need to enable it by hand in the Programming Languages category during installation.

#### Getting the build environment

You can get the build environment by cloning this repository (if you are familiar with Git) or by using `Download ZIP` button on the main page.

#### Build process

Run **switch_version.cmd** and select version you want to build. When the process complete run **build_x86.cmd** (for 32-bit version) or **build_x64.cmd** (for 64-bit version). Built executables are located in **bin_x86** and **bin_x64** folders respectively.
