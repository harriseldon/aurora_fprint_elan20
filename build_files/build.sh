#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y tmux 

# Install libfprint with Elan SoC support from COPR
echo "Enabling copr gaanee/libfprint-elanmoc2"
#dnf5 -y copr enable  ntibbitts/Libfprint-Elanmoc2 
dnf -y copr enable gaanee/libfprint-elanmoc2 fedora-42-x86_64
echo "install libfprint"
dnf5 -y swap libfprint libfprint-elanmoc2
# Disable COPRs so they don't end up enabled on the final image:
echo "disabling the image so it does not appear in final"
#dnf5 -y copr disable gaanee/libfprint-elanmoc2
dnf -y copr disable gaanee/libfprint-elanmoc2

#### Example for enabling a System Unit File

systemctl enable podman.socket
