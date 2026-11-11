# Jailbreak Repo

APT repository for rootful and rootless .deb packages. Place only packages you are permitted to redistribute in debs/. A package's architecture and dependencies must be preserved; rootful packages cannot be made rootless by changing metadata.

GitHub Pages: in repository settings, select Pages > Build and deployment > GitHub Actions. Push packages to main to build and deploy. Repository URL, once deployed: https://rom4ikg2000-lab.github.io/jailbreak-repo/

No third-party packages are included. Paid or authenticated downloads should remain on their original repositories. Each package needs individual permission, provenance, compatibility and dependency checks. The source list is for research, not automatic mirroring.

Build on Linux with dpkg-dev, apt-utils, gzip and bzip2: `bash scripts/build-repo.sh public`. Use a fresh output directory.

## Included packages

- **CCSupport 1.3.13-2** — Lars Fröder / opa334; iPhone rootful and rootless builds. Original repository: https://opa334.github.io/ ; source: https://github.com/opa334/CCSupport ; [MIT license](licenses/CCSupport-MIT.txt). The .deb files match the SHA-256 hashes in the original APT index. This is a support library for Control Center modules and requires compatible jailbreak dependencies.
- **AltList 1.0.10** — opa334; rootful and rootless. [Source](https://github.com/opa334/AltList) · [MIT license](licenses/AltList-MIT.txt).
- **Choicy 1.5.4-2** — opa334; rootful and rootless. [Source](https://github.com/opa334/Choicy) · [MIT license](licenses/Choicy-MIT.txt). Requires AltList, PreferenceLoader and a compatible tweak loader.
