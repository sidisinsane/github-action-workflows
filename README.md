# GitHub Action Workflows

[![PyPI - Version](https://img.shields.io/pypi/v/github-action-workflows)](https://pypi.org/project/github-action-workflows/)
[![PyPI - Python Version](https://img.shields.io/pypi/pyversions/github-action-workflows)](https://pypi.org/project/github-action-workflows/)
[![GitHub License](https://img.shields.io/github/license/sidisinsane/github-action-workflows)](https://github.com/sidisinsane/github-action-workflows/blob/main/LICENSE)

A collection of reusable GitHub Action workflows for modern Python projects,
featuring automated releases, documentation publishing, and best practices for
CI/CD.

## Features

- **Automated Releases** - Semantic versioning with automatic changelog
  generation
- **PyPI Publishing** - Automated publishing to PyPI and TestPyPI
- **Documentation** - Automated MkDocs and Sphinx documentation publishing
- **Quality Checks** - Pre-commit hooks with comprehensive linting and
  formatting
- **Modern Tooling** - Built with uv, asdf, and Python 3.12+

## Quick Start

### Installation

```bash
pip install github-action-workflows
```

Or with uv:

```bash
uv add github-action-workflows
```

### Basic Usage

```python
import github_action_workflows

# Example usage
github_action_workflows.main()
```

### Setting Up Workflows

1. **Copy the workflow files** from this repository to your `.github/workflows/`
   directory:

   - `publish-release.yaml` - Automated releases and PyPI publishing
   - `publish-docs.yaml` - Documentation publishing to GitHub Pages

2. **Configure your project** with the required files:

   - `pyproject.toml` - Project configuration with semantic-release setup
   - `.pre-commit-config.yaml` - Pre-commit hooks configuration
   - `.tool-versions` - asdf tool versions

3. **Set up repository secrets** (if publishing to PyPI):
   - Enable GitHub Pages in repository settings
   - Configure trusted publishing for PyPI/TestPyPI (recommended)

### Example Workflow Usage

#### Automated Releases

The `publish-release.yaml` workflow automatically:

- Detects when a release is needed based on conventional commits
- Creates GitHub releases with auto-generated changelogs
- Builds and publishes Python packages to PyPI

Trigger a release by pushing commits with conventional commit messages:

```bash
git commit -m "feat: add new awesome feature"
git commit -m "fix: resolve critical bug"
git commit -m "docs: update getting started guide"
```

#### Documentation Publishing

The `publish-docs.yaml` workflow automatically:

- Builds MkDocs documentation
- Generates Sphinx API reference
- Publishes to GitHub Pages

Simply push documentation changes to trigger updates.

## Project Structure

```asciidoc
your-project/
├── .github/
│   └── workflows/
│       ├── publish-release.yaml
│       └── publish-docs.yaml
├── docs/                          # MkDocs documentation
├── docs_sphinx/                   # Sphinx documentation
├── src/
│   └── your_package/
├── scripts/
│   └── check_version.py          # Version consistency checker
├── .pre-commit-config.yaml       # Pre-commit configuration
├── .tool-versions                # asdf tool versions
├── Makefile
├── pyproject.toml                # Project configuration
└── README.md
```

## Configuration

### pyproject.toml

Key configuration sections for the workflows:

```toml
[build-system]
requires = ["hatchling", "hatch-vcs"]
build-backend = "hatchling.build"

[tool.hatch.version]
source = "vcs"

[tool.semantic_release]
commit_parser = "conventional"
tag_format = "{version}"

[tool.semantic_release.commit_parser_options]
minor_tags = ["feat"]
patch_tags = ["fix", "perf"]
```

### Conventional Commits

Use conventional commit messages to trigger appropriate version bumps:

- `feat:` - New features (minor version bump)
- `fix:` - Bug fixes (patch version bump)
- `perf:` - Performance improvements (patch version bump)
- `docs:` - Documentation changes (no version bump)
- `chore:` - Maintenance tasks (no version bump)

## Requirements

- **Python 3.12+**
- **asdf** - For tool version management
- **uv** - For dependency management
- **Git** - With conventional commit messages

## Development

### Setting Up Development Environment

1. Clone the repository:

```bash
git clone https://github.com/sidisinsane/github-action-workflows.git
cd github-action-workflows
```

2. Install asdf and tools:

```bash
asdf install
```

3. Install dependencies:

```bash
uv sync --extra dev --extra docs
```

4. Install pre-commit hooks:

```bash
pre-commit install --install-hooks
```

### Running Tests

```bash
# Run tests (when available)
uv run pytest

# Run pre-commit checks
make pre-commit-run

# Check version consistency
python scripts/check_version.py
```

### Building Documentation

```bash
make docs-build
```

## Links

- **[Repository][1]** - Main GitHub repository
- **[Getting Started][2]** - This README with basic usage and examples
- **[Full Documentation][3]** - Complete guides, tutorials, and examples
- **[API Reference][4]** - Detailed API documentation and code reference
- **[Issues & Bug Reports][5]** - Report bugs or request features

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file
for details.

## Acknowledgments

Built with modern Python tooling:

- [uv][6] - Fast Python package installer and resolver
- [asdf][7] - Multi-language version manager
- [Semantic Release][8] - Automated versioning
- [Pre-commit][9] - Git hooks for code quality
- [MkDocs][10] - Documentation generator
- [Sphinx][11] - API documentation generator

[1]: https://github.com/sidisinsane/github-action-workflows
[2]: https://github.com/sidisinsane/github-action-workflows#readme
[3]: https://sidisinsane.github.io/github-action-workflows/
[4]: https://sidisinsane.github.io/github-action-workflows/reference/
[5]: https://github.com/sidisinsane/github-action-workflows/issues
[6]: https://docs.astral.sh/uv/
[7]: https://asdf-vm.com/
[8]: https://python-semantic-release.readthedocs.io/
[9]: https://pre-commit.com/
[10]: https://www.mkdocs.org/
[11]: https://www.sphinx-doc.org/
