#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
out=${1:-public}
if [ -e "$out" ]; then echo "Output already exists: $out" >&2; exit 1; fi
mkdir -p "$out/debs"
cp -R licenses "$out/licenses"
cp poomsmart-packages.json "$out/poomsmart-packages.json"
find debs -type f -name '*.deb' -print0 | while IFS= read -r -d '' package; do
  arch=$(dpkg-deb -f "$package" Architecture)
  case "$arch" in iphoneos-arm|iphoneos-arm64|all) ;; *) echo "Unsupported architecture $arch: $package" >&2; exit 1;; esac
  dpkg-deb -f "$package" Package Version >/dev/null
  cp --parents "$package" "$out/"
done
(
  cd "$out"
  dpkg-scanpackages --multiversion debs /dev/null > Packages
  gzip -n -9 -c Packages > Packages.gz
  bzip2 -9 -c Packages > Packages.bz2
  apt-ftparchive -o APT::FTPArchive::Release::Origin='Jailbreak Repo' -o APT::FTPArchive::Release::Label='Jailbreak Repo' -o APT::FTPArchive::Release::Suite=stable -o APT::FTPArchive::Release::Codename=stable -o APT::FTPArchive::Release::Architectures='iphoneos-arm iphoneos-arm64 all' release . > ../release.tmp
  mv ../release.tmp Release
)
