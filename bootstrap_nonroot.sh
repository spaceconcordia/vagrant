# Clone the SpacecraftSoftware repo.
mkdir -p /vagrant/space-concordia
cd /vagrant/space-concordia
if [ ! -d SpacecraftSoftware ]; then
	git clone --recursive https://github.com/spaceconcordia/SpacecraftSoftware/
fi
cd -

# We are no longer using Buildroot as a submodule so this command purges it from
# the repo.
cd /vagrant/space-concordia/SpacecraftSoftware
if [ -d buildroot ]; then
	git submodule deinit buildroot
	rm -rf buildroot
	rm -rf .git/modules/buildroot
fi

# gdb-dashboard.
if [ ! -f ~/.gdbinit ]; then wget -q -P ~ git.io/.gdbinit; fi
