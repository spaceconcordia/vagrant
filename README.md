Vagrant
=======

This repository contains the configuration files necessary to create the
Space Concordia development environment.

Installation
------------
Before outlining the installation steps, one feature of Vagrant should be clarified.
Vagrant will share the directory that contains the Vagrantfile with the `/vagrant`
directory on the VM. By "share" I mean that the two directories are identical.
Changes made in one directory will be immediately applied to the other, because they
are simply the same directory. This fact will be exploited to easily share and sync
files from the host machine to the VM and back.

1. Install git, Vagrant, and VirtualBox. On Linux, this can be done using your
distribution's package manager e.g. on Ubuntu, run the command `sudo apt install
git vagrant virtualbox`. Windows does not have a package manager so you will
need to visit the websites of each tool and install them manually. Note that if
you are on Windows, you should execute the remaining steps in Git Bash.

1. Clone this repository in the directory of your choice i.e. use `cd` to
navigate to the desired directory and run `git clone https://github.com/spaceconcordia/vagrant`.

1. If you plan on using the terminal for development, create a `files` directory
(i.e. `mkdir files`) and store any configuration files you think you may use,
such as your `.vimrc`. These files can be accessed from within the VM.

1. Run `vagrant up`. This will take several minutes to execute, as the box
must download and be provisioned.

1. Run `vagrant ssh` to SSH into the virtual machine. You should configure git
with `git config --global user.name "Your Name"` and `git config --global
user.email "your.email@example.com"`. You can find the configuration files you
made in step 3 in the directory `/vagrant/files`.

1. Run `sudo apt update; sudo apt upgrade` to upgrade packages. If you are prompted
about GRUB, just hit enter and say yes.

1. Create a directory `space-concordia` in `/vagrant`. All repositories will be
cloned here.

1. Once you are finished, you can exit the VM with `logout` or Ctrl-D.

1. Terminate the VM with `vagrant halt` if you so wish. Note that if you
do not terminate the VM you will essentially be having another OS running
in the background.

Workflow
--------

If you want to write some code,

1. Open a terminal or Git Bash as appropriate and `cd` into the Vagrant directory.

1. Run `git pull`. If there were no changes to the repository, simply run
`vagrant up`. Otherwise, run `vagrant up --provision`.

1. Run `cd /vagrant/space-concordia` and start hacking!

1. When you are finished, run `logout` or Ctrl-D. If you think you will resmume
work soon, run `vagrant suspend`. Otherwise, run `vagrant halt` to shut down the
VM.
