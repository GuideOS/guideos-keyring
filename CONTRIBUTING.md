# Contributing to GuideOS Keyring

Thank you for your interest in contributing to the GuideOS Keyring project! 🎉

## How to Contribute

### Reporting Bugs 🐛

1. **Check existing issues** - Someone might have already reported it
2. **Use the bug report template** when creating new issues
3. **Provide detailed information**:
   - OS version and architecture
   - Package version
   - Installation logs
   - Steps to reproduce

### Suggesting Features 💡

1. **Use the feature request template**
2. **Explain the use case** - Why is this needed?
3. **Consider backwards compatibility** - Will this break existing installations?

### Code Contributions 🔧

#### Setting up Development Environment

```bash
# Fork and clone the repository
git clone https://github.com/YOUR_USERNAME/guideos-keyring.git
cd guideos-keyring

# Install development dependencies
make deps

# Test build
make build
```

#### Making Changes

1. **Create a feature branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Follow these guidelines**:
   - Test your changes thoroughly
   - Update documentation if needed
   - Follow Debian packaging best practices
   - Maintain backwards compatibility when possible

3. **Test your changes**:
   ```bash
   # Build and test
   make build
   make test
   
   # Clean up
   make test-remove
   ```

4. **Update relevant files**:
   - Update `debian/changelog` if needed
   - Update `README.md` for user-facing changes
   - Update `CHANGELOG.md`

#### Pull Request Process

1. **Ensure your PR**:
   - Has a clear description
   - References any related issues
   - Includes tests if applicable
   - Updates documentation

2. **PR will be reviewed for**:
   - Code quality and style
   - Debian packaging standards
   - Security implications
   - Backwards compatibility

3. **After approval**, maintainers will merge the PR

## Development Guidelines

### Debian Packaging Standards

- Follow [Debian Policy Manual](https://www.debian.org/doc/debian-policy/)
- Use `debhelper-compat (= 13)`
- Maintain proper package dependencies
- Write clear package descriptions

### Security Considerations

- GPG key handling must be secure
- Never commit private keys
- Verify GPG key authenticity
- Use proper file permissions

### Testing

- Test installation on clean systems
- Test upgrade scenarios  
- Test removal/purge operations
- Verify GPG signatures

### File Structure

```
.
├── debian/              # Debian packaging files
│   ├── control         # Package metadata
│   ├── rules           # Build rules
│   ├── postinst        # Post-installation script
│   ├── postrm          # Post-removal script
│   ├── changelog       # Package changelog
│   └── copyright       # License information
├── etc/                # Configuration files to install
│   └── apt/
│       ├── sources.list.d/
│       └── apt.conf.d/
├── usr/                # System files to install
│   └── share/keyrings/
└── .github/            # GitHub automation
```

### Commit Messages

Use clear, descriptive commit messages:

```
type: brief description

Longer explanation if needed.

- List specific changes
- Reference issues: Fixes #123
```

Types: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`

## Questions?

- **Issues**: [GitHub Issues](https://github.com/GuideOS/guideos-keyring/issues)
- **Email**: actionschnitzel@guideos.de
- **Website**: [https://guideos.org](https://guideos.org)

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for helping make GuideOS better! 🚀