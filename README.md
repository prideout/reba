## Reba

Reba is a <b>ren</b>derer <b>ba</b>se that builds a set of high quality open-source C++ libraries using Docker, so that you can hit the ground running when starting your graphics project.

<!--div style="
    width:300px;
    border:solid 1px black;
    border-radius:10px;
    padding:5px"><div style="
        border:solid 1px black;
        background: #eee;
        border-radius:10px;
        padding:5px"><b style="padding:0">Your Awesome Teapot Renderer</b>
    </div><div style="
        margin-top: 5px;
        background: #eed;
        border:solid 1px black;
        border-radius:10px;
        padding:5px"><b style="
            ">Reba</b>
        <div>OpenImageIO, glm, ...</div></div><div style="
            margin-top: 5px;
            border:solid 1px black;
            border-radius:10px;
            background: #eee;
            padding:5px"><b style="
                ">Docker</b></div></div-->

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
<!-- pbrt too ? -->

