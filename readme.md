### Environment for building (G)ZDoom on Windows

#### Prerequisites
Visual Studio 2015 with Visual C++ is required to build (G)ZDoom.

Microsoft offers [Visual Studio Community 2015](https://www.visualstudio.com/en-us/products/visual-studio-community-vs.aspx) for free. However this edition doesn't install Visual C++ by default. You need to enable it by hand in the Programming Languages category during installation:![VS2015 Setup](https://raw.githubusercontent.com/alexey-lysiuk/gzdoom-win-build/master/images/vs2015_cpp.png)

#### Getting the build environment

You can get the build environment by cloning this repository (if you are familiar with Git) or by using `Download ZIP` button on the main page.

#### Build process

Run **switch_version.cmd**.
```
+----------------------------------------------------------+
|  Press the corresponding button to switch to a version:  |
+----------------------------------------------------------+
|  1 - GZDoom 1.x                                          |
|  2 - GZDoom 2.x                                          |
|  3 - GZDoom GPL                                          |
|  4 - GLOOME                                              |
|  5 - ZDoom                                               |
+----------------------------------------------------------+
|  0 - Exit                                                |
+----------------------------------------------------------+
```
Select a version you want to build by pressing the corresponding number button on the keyboard.

When the process complete run **build_x86.cmd** to make 32-bit executable or **build_x64.cmd** for 64-bit version. This may take a while.

Built executables are located in **bin_x86** and **bin_x64** folders respectively.

Run **deploy.cmd** to build both 32-bit and 64-bit versions and package them as 7-zip archives located in **deploy** folder.
