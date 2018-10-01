# Python project template

A dockerised python development environment with persisted cache after container shutdown.

Make sure you [have Docker installed](https://docs.docker.com/install/).

Running `startDev.sh` sets up 2 containers:
* A deamon that reruns app/main.py if it or its dependencies are saved.
* A jupyter notebook with access to `src` scripts and their cached results
