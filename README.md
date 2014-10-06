Setting up Raneto in a docker container
===

# How to use?

Create a data only container with your data directory mounted at /data

    mkdir -p ~/.data
    sudo docker run -d -v ~/.data:/data --name data debian:wheezy true

    sudo docker run -d --volumes-from data -p 3000:3000 --name raneto chanux/raneto

This will run Raneto with default content. Check it out at localhost:3000

You can edit/replace content at ~/.data/raneto

You can also build the image yourself using the Dockerfile.

    sudo docker build -t raneto .

(Create the data only container as previously instructed.)

    sudo docker run -d --volumes-from data -p 3000:3000 --name my-raneto raneto
