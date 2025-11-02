# misalign

[![CI](https://github.com/eddgineer/misalign/actions/workflows/ci.yml/badge.svg)](https://github.com/eddgineer/misalign/actions/workflows/ci.yml)
[![PyPI version](https://badge.fury.io/py/misalign.svg)](https://pypi.org/project/misalign/)
[![Python versions](https://img.shields.io/pypi/pyversions/misalign.svg)](https://pypi.org/project/misalign/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A Python library for handling data misalignment and synchronization.

## Installation

Install misalign using uv:

```bash
uv add misalign
```

Or with pip:

```bash
pip install misalign
```

## Quick Start

```python
from misalign import align

# Align your data
data = [1, 2, 3, 4, 5]
aligned_data = align(data)
print(aligned_data)
```

## Development

This project uses [uv](https://github.com/astral-sh/uv) for dependency management.

### Setup

1. Install uv:
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

2. Clone the repository:
```bash
git clone https://github.com/eddgineer/misalign.git
cd misalign
```

3. Install dependencies:
```bash
uv sync --dev
```

### Running Tests

```bash
uv run pytest
```

### Code Quality

```bash
# Linting
uv run ruff check .

# Formatting
uv run ruff format .

# Type checking
uv run mypy src/misalign tests
```

### Building

```bash
uv build
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

- **eddgineer** - edward@lgtmlabs.com