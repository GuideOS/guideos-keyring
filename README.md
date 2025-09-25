# GuideOS Keyring

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Debian Package](https://img.shields.io/badge/Package-Debian-red.svg)](https://www.debian.org/)

Official Debian keyring package for GuideOS repositories. This package provides GPG keys and APT sources configuration for all GuideOS package repositories.

## Overview

The GuideOS Keyring package automatically configures your Debian-based system to use GuideOS repositories with proper cryptographic verification. It uses the modern deb822 sources format and includes automatic migration from older repository configurations.

## Features

- ✅ **Modern deb822 format**: Uses the latest APT sources format
- 🔑 **Secure GPG verification**: All packages are cryptographically verified
- 🔄 **Automatic migration**: Removes old repository configurations
- 🚫 **Clean installation**: Suppresses unnecessary APT warnings
- 📦 **Multiple repositories**: Supports Cinnamon, Trixie, and Universe repos

## Repositories Included

| Repository | Description | URL |
|------------|-------------|-----|
| **GuideOS Cinnamon** | Cinnamon desktop packages for Debian Testing | `home:guideos:cinnamon-trixie` |
| **GuideOS Trixie** | Core GuideOS packages for Debian Testing | `home:guideos:trixie` |
| **GuideOS Universe** | Additional packages and software | `home:guideos:universe` |

## Installation

### Quick Install

Download and install the latest package:

```bash
# Download the latest release
wget https://github.com/GuideOS/guideos-keyring/releases/latest/download/guideos-keyring_1.0-1_all.deb

# Install the package
sudo dpkg -i guideos-keyring_1.0-1_all.deb

# Update package cache
sudo apt update
```

### What happens during installation

1. **Old configuration cleanup**: Removes any existing old-format repository files
2. **New configuration**: Installs modern deb822 format sources
3. **GPG keys**: Installs cryptographic keys to `/usr/share/keyrings/`
4. **APT configuration**: Suppresses modernize-sources warnings
5. **Cache update**: Refreshes the APT package cache

## Building from Source

### Prerequisites

```bash
sudo apt update
sudo apt install debhelper-compat curl gnupg build-essential
```

### Build Process

```bash
# Clone the repository
git clone https://github.com/GuideOS/guideos-keyring.git
cd guideos-keyring

# Install build dependencies
make deps

# Build the package
make build

# The .deb file will be created in the parent directory
ls ../guideos-keyring_*.deb
```

### Build Targets

- `make build` - Build the package without signing
- `make build-signed` - Build and sign the package
- `make clean` - Clean build artifacts
- `make test` - Install and test the package
- `make test-remove` - Remove test installation

## Files Installed

| File | Purpose |
|------|---------|
| `/etc/apt/sources.list.d/guideos.sources` | APT sources configuration (deb822 format) |
| `/etc/apt/apt.conf.d/90guideos-modernize-sources-notice` | Suppresses APT modernization warnings |
| `/usr/share/keyrings/home_guideos_cinnamon-trixie.gpg` | GPG key for Cinnamon repository |
| `/usr/share/keyrings/home_guideos_trixie.gpg` | GPG key for Trixie repository |
| `/usr/share/keyrings/home_guideos_universe.gpg` | GPG key for Universe repository |

## Uninstallation

```bash
# Remove the package
sudo apt remove guideos-keyring

# Or completely purge (removes all configuration)
sudo apt purge guideos-keyring
```

The package scripts will automatically clean up all installed files and update the APT cache.

## Technical Details

### Repository Format

The package uses the modern deb822 sources format instead of the legacy one-line-per-source format:

```ini
Types: deb
Enabled: yes
URIs: http://download.opensuse.org/repositories/home:/guideos:/trixie/Debian_Testing/
Suites: /
Components: 
Signed-By: /usr/share/keyrings/home_guideos_trixie.gpg
```

### Security

- All repositories are signed with OpenSUSE Build Service GPG keys
- Keys are stored in the secure `/usr/share/keyrings/` directory
- Package verification is enforced by APT

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

- **Issues**: Report bugs and request features on [GitHub Issues](https://github.com/GuideOS/guideos-keyring/issues)
- **Website**: [https://guideos.org](https://guideos.org)
- **Email**: actionschnitzel@guideos.de

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for a detailed history of changes.

---

**GuideOS** - Making Debian better for everyone 🚀