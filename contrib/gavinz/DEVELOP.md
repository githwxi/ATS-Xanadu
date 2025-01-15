This document provides instructions on how to setup your environment to
develop/hack on ATS-Xanadu.

## Prerequisites

- The [`nix`](https://nixos.org/download/) package manager.

That's it! The hard job of setting up dependencies and configuring environment
variables are offloaded to Nix
([flakes](https://zero-to-nix.com/concepts/flakes/)), all while making sure
these changes are isolated for this project only and will not affect your
system.

## Steps

> [!WARNING]
> For advanced Make users: do **NOT** add `-j` flag to build in parallel. There
are still issues regarding the way compiler outputs are merged together.
The build is quick and shouldn't take more than 10 minutes to complete
even when building with one core.

1. Run `nix develop`. You will be dropped into a bash shell that contains all
   the dependencies and environment variables configured for you.

   The first run may take a while, because Nix needs to fetch dependencies.
   Subsequent `nix develop` runs are much faster due to caching.

2. Run `make -f Makefile_overall`.

3. Now you have a working ATS3 compiler! Checkout the `PGROUND` for examples.
