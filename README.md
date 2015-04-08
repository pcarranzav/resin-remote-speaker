Resin Starter Kit for node.js
=============================

NOTE: This container enables SSH access as root with a PASSWORD stored in plain text - Do not use in production without modifications.

Resin container that allows to quickly get hacking on a Raspberry Pi.

It features:
- SSH using dropbear
- File syncing using syncthing
- Dependencies for node.js and a running express server

A similar container, but for Python instead of node.js, can be found [here](https://github.com/pcarranzav/resin-starter-kit-python).

Usage
------


This container is meant to simplify the workflow when hacking on a Raspberry Pi using resin.
The first thing to do is to create an app on the resin Dashboard, clone this repository and add the resin git remote. Check out the [Getting Started guide](http://docs.resin.io/#/pages/gettingStarted.md) for this process.
Once your device is running the resin OS, you can find its IP address on the dashboard.

### SSH
Add an environment variable called PASSWD on the resin Dashboard with the value to set as root password.
You can log in to a terminal on your device using:
```
ssh root@<device IP address>
```
This will allow you to try arbitrary commands.

### Syncthing

When pushing this container to your device, it will start [Syncthing](https://syncthing.net/) and expose its configuration GUI on port 8080.
You can open a browser at `<device IP address>:8080` and you'll see something like this:

![Syncthing GUI](../../blob/master/doc/syncthing-gui.png)

You'll have to install Syncthing on your PC as well. You can get version 0.10.30 from [here](https://github.com/syncthing/syncthing/releases/tag/v0.10.30).
When you run it on your PC, you can access that same GUI at 127.0.0.1:8080.
There, select Show ID from the menu on the right-top corner:

![Show ID](../../blob/master/doc/show-id.png)

Copy that ID, then go to the Syncthing GUI on your Raspberry Pi, click on Add Device and paste it.
After that, on the Pi GUI select Add Folder, name it "src" and point it to the /src directory.
Select your PC as a device to share it with.

![Add Folder](../../blob/master/doc/show-id.png)

When you do this, the GUI on your PC will prompt you to add the device too:

![Add Folder](../../blob/master/doc/new-device.png)	

Now create the folder on the GUI on your PC, using the same ID ("src"), but point it to the src directory in this repository (e.g. "/home/user/resin-starter-kit/src").

Voilà! Now every change you make on your src directory will be immediately reflected on the Pi. That way you can code and run it on the Pi, and only push to resin after adding new dependencies or making big changes.


 