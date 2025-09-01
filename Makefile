build:
	@docker build -t ubuntu-nix .

run:
	@docker run -it --rm ubuntu-nix
