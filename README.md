Vagrant
=======

This repository contains the configuration files necessary to create the
Vagrant environment.

Linux
-----
1. Install git, Vagrant, and VirtualBox. On Ubuntu, for example, this can be
done with `sudo apt install git vagrant virtualbox`.

1. Clone this repository in the directory of your choice i.e. `git clone
https://github.com/ajpower/vagrant`.

1. If you plan on using the terminal for development, make a `files` directory
(i.e. `mkdir files`) and store any configuration files you think you may use,
such as your `.vimrc`. Note that the Vagrant VM shares the directory containing
the Vagrantfile with `/vagrant`, so you can access these files within the VM.

1. Run `vagrant up`. This will take several minutes to execute, as the box
must be downloaded and set.

1. Run `vagrant ssh` to SSH into the virtual machine. You should configure git
with `git config --global user.name "Your Name"` and `git config --global
user.email "youremail@example.com"`. You can find the configuration files you
made in step 3 in the directory `/vagrant/files`.

1. Create a directory `space-concordia` in `/vagrant`. You will clone all
repositories into this directory.

1. Once you are finished, you can exit the VM with `logout` or Ctrl-D.

1. Terminate the VM with `vagrant halt`.

Workflow
--------

If you want to write some code,

1. Open a terminal or git bash as appropriate and `cd` into the Vagrant directory.

1. Run `git pull`. If there were no changes to the repository, simply run
`vagrant up`. Otherwise, run `vagrant up --provision`.

1. If the SSH banner says that packages need to be upgraded, run `sudo apt
update; sudo apt upgrade`.

1. Run `cd /vagrant/space-concordia` and start hacking!

1. When you are finished, run `logout`. If you think you will resmume work soon,
run `vagrant suspend`. Otherwise, run `vagrant halt` to shut down the VM.
