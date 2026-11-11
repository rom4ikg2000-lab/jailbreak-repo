# Jailbreak Repo

APT repository for rootful and rootless .deb packages. Place only packages you are permitted to redistribute in debs/. A package's architecture and dependencies must be preserved; rootful packages cannot be made rootless by changing metadata.

GitHub Pages: in repository settings, select Pages > Build and deployment > GitHub Actions. Push packages to main to build and deploy. Repository URL, once deployed: https://rom4ikg2000-lab.github.io/jailbreak-repo/

No third-party packages are included. Paid or authenticated downloads should remain on their original repositories. Each package needs individual permission, provenance, compatibility and dependency checks. The source list is for research, not automatic mirroring.

Build on Linux with dpkg-dev, apt-utils, gzip and bzip2: `bash scripts/build-repo.sh public`. Use a fresh output directory.
