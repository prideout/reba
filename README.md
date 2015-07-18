## Reba (rEE - buh)

Writing your very own C++ server-side renderer?  Reba provides a set of third-party libraries, and a build environment that uses Docker, so that you can hit the ground running.

```
+-----------------------+
|  YourAwesomePbrEngine |
+-----------------------+
|         Reba          |
+-----------------------+
| OpenImageIO, TBB, etc |
+-----------------------+
```

Reba provides commonly used libraries like [OpenImageIO]() and [glm]() all in one place, and includes a Dockerfile and travis file for highly reproduceable builds.

## Setup for OS X

1. Install [boot2docker](https://github.com/boot2docker/osx-installer/releases/latest).

2. Type the following into your terminal:
```
boot2docker init
boot2docker start && eval "$(boot2docker shellinit)"
```

3. Clone this repo and cd into it:
```
git clone BLAH && cd BLAH
```

4. Use the Dockerfile to create a machine image:
```
docker build -t prideout/reba .
```
The above process can take a while, you wight want to make the image available somewhere using an image repository, to save your team time.

5. Create an instance of the image and get a terminal to it:
```
docker run -it -v $(pwd):/src --name=devinst prideout/reba bash
```

Now, every subsequent time you want to get a terminal to your instance:
```
docker start devinst && docker attach devinst
```


## Links

- https://github.com/OpenImageIO/oiio
