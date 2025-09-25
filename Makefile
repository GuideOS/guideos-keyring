.PHONY: build clean install test

# Build the package
build:
	dpkg-buildpackage -b --no-sign

# Build with signing
build-signed:
	dpkg-buildpackage -b

# Clean build artifacts
clean:
	rm -f ../guideos-keyring_*.deb
	rm -f ../guideos-keyring_*.dsc
	rm -f ../guideos-keyring_*.tar.xz
	rm -f ../guideos-keyring_*.changes
	rm -f ../guideos-keyring_*.buildinfo
	rm -rf debian/.debhelper/
	rm -f debian/files
	rm -f debian/debhelper-build-stamp
	rm -f debian/guideos-keyring.substvars

# Clean using debhelper (use this for proper debian cleaning)
dh-clean:
	dh clean

# Install build dependencies
deps:
	sudo apt update
	sudo apt install debhelper-compat curl gnupg

# Update GPG keys from repositories
update-keys:
	curl -fsSL https://download.opensuse.org/repositories/home:guideos:cinnamon-trixie/Debian_Testing/Release.key | \
		gpg --dearmor > usr/share/keyrings/home_guideos_cinnamon-trixie.gpg
	curl -fsSL https://download.opensuse.org/repositories/home:guideos:trixie/Debian_Testing/Release.key | \
		gpg --dearmor > usr/share/keyrings/home_guideos_trixie.gpg
	curl -fsSL https://download.opensuse.org/repositories/home:guideos:universe/Debian_Testing/Release.key | \
		gpg --dearmor > usr/share/keyrings/home_guideos_universe.gpg
	@echo "GPG keys updated successfully!"

# Test installation (requires sudo)
test: build
	sudo dpkg -i ../guideos-keyring_*.deb
	@echo "Testing repository access..."
	sudo apt update
	@echo "Package installed successfully!"

# Remove test installation
test-remove:
	sudo apt remove guideos-keyring
	sudo apt update