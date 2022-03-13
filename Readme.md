# JRPC Build Systèmes for ImGui Manual

![JRPC_hello_imgui banner](https://user-images.githubusercontent.com/63042547/155890352-ce39a8b9-61bd-4166-94c9-7993bcc77123.png)

Source for imgui interactive manual [imgui manual](https://github.com/pthom/imgui_manual).

# First time Build (Linux binaries only supported for now):

1. `chmod +x install.sh`

2. `./install.sh` 

The resulting files will be in the bin directory. This is a very long build process. 20 minutes +

This project has been born due to the fact that I was developing on imgui_manual code, and my SSD failed. I lost all my backups, and had to start afresh. To my dismay, I found I had to install all these unneccessary libraries on my Linux machine, just to get back to coding to get the project runnning again. I almost gave up on it, but in the end I decided the best choice was to create a build system that would handle the building independently of my OS, outside of my machine scope, inside a Docker Container called jrpc-linux-buildsystem.

Every resulting build process after the first should only take minutes if not seconds, unless you modified the build container dockerfile.


Donations:

BTC: `1LG7rjbc3vUXUkxAQ8RBC2tD7q2yAFwFdK`

ETH: `0x4aabba4195d1f9309c81a93cd762b76d3b0a1283`

IOTX: `io1098h946aa5us8h4fql6zptv9kjqn7cu9x9uzm0`

POKT: `2d7877c7dddf5a8b130e00709fa4d0402863a1b4`
