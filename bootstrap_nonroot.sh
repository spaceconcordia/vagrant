# Clone the SpacecraftSoftware repo.
mkdir -p /vagrant/space-concordia
cd /vagrant/space-concordia
if [ ! -d SpacecraftSoftware ]; then
	git clone https://github.com/spaceconcordia/SpacecraftSoftware/
fi
cd -

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

# gdb-dashboard.
if [ ! -f ~/.gdbinit ]; then wget -q -P ~ git.io/.gdbinit; fi
