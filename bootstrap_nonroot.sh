# Clone the SpacecraftSoftware repo.
mkdir -p /vagrant/space-concordia
cd /vagrant/space-concordia
if [ ! -d SpacecraftSoftware ]; then
	git clone https://github.com/spaceconcordia/SpacecraftSoftware/
fi
cd -

# Clone the MissionControl repo.
mkdir -p /vagrant/space-concordia
cd /vagrant/space-concordia
if [ ! -d MissionControl ]; then
	git clone https://github.com/spaceconcordia/MissionControl
fi
cd -

# Create global gitignore.
if [ ! -f ~/.gitignore_global ]; then
	echo ".idea/" >> ~/.gitignore_global
	echo "*.swp" >> ~/.gitignore_global

	git config --global core.excludesfile ~/.gitignore_global
fi

# Create the virtual environments.
if [ ! -d ~/.virtualenvs/MC ]; then
	VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'
	export WORKON_HOME=$HOME/.virtualenvs
	source /usr/local/bin/virtualenvwrapper.sh
	mkvirtualenv MC

	# Add activation commands to .bashrc.
	echo "VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'" >> ~/.bashrc
	echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.bashrc
	echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
fi

# gdb-dashboard.
if [ ! -f ~/.gdbinit ]; then wget -q -P ~ git.io/.gdbinit; fi

# Basic vimrc.
if [ ! -f ~/.vimrc ]; then
	cd
	git clone https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim .vimrc
	cd -
fi

# We are no longer using Buildroot or Googletest as submodules so this command
# purges them from the repo.
cd /vagrant/space-concordia/SpacecraftSoftware
if [ -d buildroot ]; then
	git submodule deinit -f buildroot
	rm -rf .git/modules/buildroot
	git rm -rf buildroot
fi
if [ -d googletest ]; then
	git submodule deinit -f googletest
	rm -rf .git/modules/googletest
	git rm -rf googletest
fi
cd ~

