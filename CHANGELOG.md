# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0-1] - 2025-09-25

### Added
- Initial release of GuideOS keyring package
- Support for GuideOS Cinnamon packages for Trixie
- Support for GuideOS Trixie packages  
- Support for GuideOS Universe packages
- Modern deb822 sources format configuration
- APT configuration to suppress modernize-sources warnings
- Automatic migration from old .list format repository files
- Automatic migration of GPG keys from old to new location
- Detailed installation feedback and status messages
- Complete package removal support with purge option

### Technical Details
- Uses `/usr/share/keyrings/` for secure GPG key storage
- Implements deb822 format in `/etc/apt/sources.list.d/guideos.sources`
- Includes APT configuration in `/etc/apt/apt.conf.d/90guideos-modernize-sources-notice`
- Automatic cleanup of legacy repository configurations during installation
- Proper debian packaging with postinst/postrm scripts

### Security
- All repositories verified with OpenSUSE Build Service GPG keys
- Cryptographic verification enforced by APT
- Secure key management following Debian best practices