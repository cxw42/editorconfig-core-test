# editorconfig-core-test

This project is a series of testing for [EditorConfig Core][editorconfig]. Please have
[cmake][] installed before using this project.

### Use editorconfig-core-test independently

After installing cmake, switch to the root directory of this project, and execute:

    cmake -DEDITORCONFIG_CMD=the_editorconfig_core_cmd_you_want_to_test .

After that, if testing files are generated successfully, execute `ctest .` to
start testings.

### Use editorconfig-core-test in your project as a git submodule

If you are using [git][] and cmake to manage your project, this method should
be suitable for you.

Suppose that you will add editorconfig-core-test repo as a
submodule in your root directory. First add editorconfig-core-test as a
git submodule in your repo by execute:

    git submodule add git://github.com/editorconfig/editorconfig-core-test.git tests

Then add the following lines to your project root `CMakeLists.txt`:

```cmake
enable_testing()
set(EDITORCONFIG_CMD the_editorconfig_core_path)
add_subdirectory(tests)
```

Now after executing `cmake .` in your project root directory, you should be able to
run the testings by executing `ctest .`.

### Contents of this repo

* `/CMakeLists.txt`: Defines the test routines used in the individual tests
* `/cmake`: Library routines
* `/meta`: Tests of the library routines and of this repo itself
* other directories under `/`: tests of the editorconfig core
* `*.in`: Editorconfig files used in various tests
* `/*/CMakeLists.txt`: The definitions of the individual tests, and their
  expected outputs

[cmake]: http://www.cmake.org
[editorconfig]: http://editorconfig.org
[git]: http://git-scm.com
