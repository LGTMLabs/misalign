from misalign import __version__


def test_version() -> None:
    """Test that version is properly set."""
    assert __version__ == "0.1.0"
