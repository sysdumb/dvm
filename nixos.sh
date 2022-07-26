read -p 'This script will replace your configuration.nix, proceed? (y\n)' prompt

if [ $prompt = "y" ]
then
	read -p "What is the hostname? " name

	sed -i "s/nixos/$name/g" configuration.nix

	rm /etc/nixos/configuration.nix
	cp ./configuration.nix /etc/nixos/configuration.nix
fi

