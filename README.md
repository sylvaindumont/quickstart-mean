# Quickstart MEAN

Once you've installed vagrant, this project allows you to start a mean project in 3 commands :

    vagrant up
    vagrant ssh
    yo angular-fullstack

If you're familiar with another mean stack, you can find other generators on http://yeoman.io/generators/

## Requirements

#### On linux:

  * vagrant
  * docker

#### On windows:

  * vagrant
  * virtualbox
  * rsync

## Performance

To speed up the vagrant environments, some optimization have been done.
On linux, we use just use docker. On windows, we use an rsync synchronization instead of the slow virtualbox shared folder.

## Known Issues

On vagrant 1.8.0 and 1.8.1, rsync synchronization doesn't work. On vagrant 1.7.4, we need to start vagrant from a cygwin shell.

These issues should be fixed in the next versions of vagrant.

## Testing

This box support karma and protractor testing on chromium, you just need to configure chromium as here : https://github.com/sylvaindumont/docker-node5-karma-protractor-chrome

## Modifying the box

Vagrant allows you to install everything during "vagrant up" with provisionning, but if you want a faster start, you can modify the packer script which build the virtualbox and docker image.
