Raneto on Docker
===

# How to use?

Create a data only container with your data directory mounted at /data

    mkdir -p ~/.data
    docker run -d -v ~/.data:/data --name data --entrypoint /bin/bash chanux/raneto true

    docker run -d --volumes-from data -p 3000:3000 --name raneto chanux/raneto

This will run Raneto with default content. Check it out at localhost:3000

You can edit/replace content at ~/.data/raneto

You can also build the image yourself using the Dockerfile.

    docker build -t chanux/raneto .

With Docker version 1.9+ you can pass Raneto version at build. (Only works with
versions up to 0.7.0, the last *simple* Raneto)

    docker build -t chanux/raneto --build-arg RANETO_VERSION=0.7.0 .
