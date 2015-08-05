## Reba

Reba is a **re**nderer **ba**se that builds a set of high quality open-source C++ libraries using Docker, so that you can hit the ground running when starting your graphics project.

---

Reba provides the following C++ libraries all in one place:
- [glm](https://github.com/g-truc/glm), a header-file only library for GLSL-like vector math.
- [OpenImageIO](https://github.com/OpenImageIO/oiio), a robust image IO and texture sampling library.
- Various precompiled boost packages, including `boost.python`
- All OpenImageIO dependencies, which include ilmbase and OpenEXR.
- [RapidJSON](https://github.com/miloyip/rapidjson), a highly efficient JSON parser written in C++.
- [spdlog](https://github.com/gabime/spdlog), which includes [cppformat](https://github.com/cppformat/cppformat).

### Getting started on OS X.

First, install [boot2docker](https://github.com/boot2docker/osx-installer/releases/latest).

Next, clone this repo and cd into it:
```bash
git clone https://github.com/prideout/reba.git && cd reba
```
Type the following into your terminal, which invokes docker to create the machine image:
```bash
boot2docker up
$(boot2docker shellinit)
docker build -t prideout/reba .
```
You may now use your new instance to build one of the example renderers:
- simple island shape generator in [reba-island](https://github.com/prideout/reba-island)
- my fork of the mitsuba renderer ([TBD]())
