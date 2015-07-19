## Reba

Writing your very own C++ server-side renderer?  Reba provides a set of third-party libraries and build environment using Docker, so that you can hit the ground running.

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
- [OpenImageIO](https://github.com/OpenImageIO/oiio), a high-quality image IO and texture sampling library.
- All OpenImageIO dependencies, which include ilmbase and OpenEXR.
- [RapidJSON](https://github.com/miloyip/rapidjson)
- [spdlog](https://github.com/gabime/spdlog), which includes [cppformat](https://github.com/cppformat/cppformat).

### Getting started on OS X.

1. Install [boot2docker](https://github.com/boot2docker/osx-installer/releases/latest), then type the following into your terminal:
```bash
boot2docker init
boot2docker start
```

1. Clone this repo and cd into it:
```bash
git clone https://github.com/prideout/reba.git && cd reba
```

1. Type the following into your terminal, which invokes docker to create the machine image:
```bash
./reba-build.sh
```

1. You may now use your new instance to build one of the example renderers:
    - simple island shape generator in ([reba-demo](https://github.com/prideout/reba-island))
    - my fork of the mitsuba renderer ([TBD]())
