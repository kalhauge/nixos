rsync -t *.nix /etc/nixos/
nixos-rebuild switch -I nixpkgs=/home/kalhauge/Develop/repos/nixpkgs --option use-binary-caches true
