{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.hello
    pkgs.git
	pkgs.cowsay
  ];

  shellHook = ''
    echo "Welcome to your Nix shell inside Ubuntu 25.04!"
  '';
}

