# vscode-devcontainer-python-cookiecutter

This cookiecutter template generates code for a basic Python project in a Visual Studio Code Dev Container (devcontainer) environment.

## Usage

```sh
cookiecutter https://github.com/ilyasotkov/python-vscode-devcontainer-bootstrap
```

Open the generated folder in VS Code, and you'll be prompted to re-open in Dev Container.

## Prerequisites

- Docker Desktop
- Visual Studio Code with *Remote - Containers* extension installed
- cookiecutter (can use through Docker as well)

## Features

- Go to definition, auto-complete
- Refactoring
- Code formatting on file save
- Import sorting on file save
- Debugger with ability to hit breakpoints and discover variables
- pytest integration for unit tests (run / debug / visualize test runs)
