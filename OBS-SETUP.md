# OpenBuild Service Integration Setup

This repository is configured to work with the OpenBuild Service (OBS) for automated package building across multiple distributions.

## Required GitHub Secrets

To enable OBS integration, you need to configure the following secrets in your GitHub repository:

### Repository Settings → Secrets and Variables → Actions

1. **`OBS_USERNAME`** - Your OBS username
2. **`OBS_PASSWORD`** - Your OBS password (or API token)
3. **`OBS_PROJECT`** - Your OBS project name (e.g., `home:yourusername`)
4. **`OBS_API_URL`** *(optional)* - OBS API URL (defaults to `https://api.opensuse.org`)

## OBS Project Setup

1. Create a project on build.opensuse.org (or your OBS instance)
2. Create a package called `guideos-keyring` in your project
3. Configure build targets for your desired distributions (Debian, Ubuntu, etc.)

## Workflow Overview

The OBS workflow (`obs-build.yml`) performs these steps:

1. **Prepare Source** - Creates source packages and uploads them as artifacts
2. **OBS Trigger** - Uploads sources to OBS and triggers builds (only on main/master/tags)
3. **Local Test Build** - Performs local test builds for validation
4. **GitHub Release** - Creates GitHub releases with packages (only on tags)

## Manual OBS Commands

If you want to work with OBS manually:

```bash
# Install osc (OBS command line tool)
sudo apt-get install osc

# Configure credentials
osc config
# Follow prompts to enter your OBS credentials

# Checkout your package
osc co home:yourusername/guideos-keyring

# Update package sources
cd home:yourusername/guideos-keyring
# Copy your debian/ directory and source files here

# Commit changes
osc ci -m "Update guideos-keyring"

# Check build status
osc results
```

## Supported Distributions

Configure these build targets in your OBS project:

- **Debian**: Debian_12, Debian_Testing, Debian_Unstable
- **Ubuntu**: xUbuntu_22.04, xUbuntu_23.10, xUbuntu_24.04
- **openSUSE**: openSUSE_Leap_15.5, openSUSE_Tumbleweed

## Benefits of OBS Integration

1. **Multi-Distribution Building** - Automatically build for multiple distributions
2. **Dependency Resolution** - OBS handles build dependencies automatically  
3. **Repository Integration** - Built packages can be served via OBS repositories
4. **Build Monitoring** - Web interface to monitor build status and logs
5. **Reproducible Builds** - Consistent build environment across all builds

## Repository Access

Once built, packages are available via OBS repositories:

```bash
# Add repository (example for openSUSE)
sudo zypper ar https://download.opensuse.org/repositories/home:/yourusername/openSUSE_Tumbleweed/ guideos-keyring

# Install package
sudo zypper install guideos-keyring
```

For Debian/Ubuntu:
```bash
# Add repository key and source
echo 'deb http://download.opensuse.org/repositories/home:/yourusername/Debian_12/ /' | sudo tee /etc/apt/sources.list.d/guideos-keyring.list
curl -fsSL https://download.opensuse.org/repositories/home:/yourusername/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/guideos-keyring.gpg > /dev/null
sudo apt update
sudo apt install guideos-keyring
```