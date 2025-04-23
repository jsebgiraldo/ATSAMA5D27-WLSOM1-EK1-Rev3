# Yocto Development Environment

This development environment is designed for working with Yocto and Microchip layers.

## Prerequisites
- Docker installed on your machine.
- Visual Studio Code with the "Remote - Containers" extension.

## Setup
1. Clone this repository.
2. Open the folder in Visual Studio Code.
3. When prompted, select "Reopen in Container" to start the development environment.

## Usage
- The container includes all necessary dependencies to work with Yocto.
- Follow the steps in the "Build procedure" section of the project to build Yocto images.

## Notes
- The user inside the container is `dev`.
- The working directory inside the container is `/workspace`, which is linked to your local folder.