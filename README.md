# Nixy Containers

Using Nix as a package manager for container images.

## Features

A base `Ubuntu` image with `Nix` installed and configured, that pulls and uses a `shell.nix` file from the current directory to install packages. 

## Usage

```bash
make build
make run
```

This will build the Docker image and run a container with the [shell.nix](./shell.nix) file in the current directory and run the `cowsay` command (available in the `shell.nix` file).
