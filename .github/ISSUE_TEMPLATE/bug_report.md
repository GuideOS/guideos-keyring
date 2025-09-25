---
name: Bug report
about: Create a report to help us improve
title: '[BUG] '
labels: bug
assignees: ''

---

**Describe the bug**
A clear and concise description of what the bug is.

**To Reproduce**
Steps to reproduce the behavior:
1. Install package with '...'
2. Run command '....'
3. See error

**Expected behavior**
A clear and concise description of what you expected to happen.

**System Information:**
 - OS: [e.g. Debian 12, Ubuntu 22.04]
 - Architecture: [e.g. amd64, arm64]
 - Package Version: [e.g. 1.0-1]

**Package Installation Log**
If applicable, paste the installation output:
```
sudo dpkg -i guideos-keyring_*.deb
```

**APT Sources Content**
If applicable, show current sources:
```bash
cat /etc/apt/sources.list.d/guideos.sources
ls -la /usr/share/keyrings/home_guideos_*.gpg
```

**Additional context**
Add any other context about the problem here.