# pylint: disable=broad-except
from __future__ import annotations

import json


try:
    from importlib import metadata

    __version__ = metadata.version(__package__ or __name__)
except Exception:
    # Fallback to build-generated version file
    try:
        from github_action_workflows.__version__ import __version__
    except ImportError:
        __version__ = "unknown"


def get_version_info():
    """Get detailed version information."""
    return {
        "version": __version__,
        "is_development": __version__ == "unknown",
        "source": "metadata" if __version__ != "unknown" else "fallback",
    }


__all__ = ["__version__", "get_version_info"]


def main():
    print(json.dumps(get_version_info(), indent=2))


if __name__ == "__main__":
    main()
