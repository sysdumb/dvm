
read -p "Do you want to install home-manager (y/n): " homie

if [ $homie = "y" ]
then
 nix-channel --add https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz home-manager
 nix-channel --update
 export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
 nix-shell '<home-manager>' -A install
fi

read -p "Do you want to configure git (y/n): " configGit

if [ $configGit = "y" ]
then
	cp ./git.nix ~/.config/nixpkgs/git.nix
	read -p "Enter your username: " username
	sed -i 's/gitUsername/${username}/g' ~/.config/nixpkgs/git.nix

	read -p "Enter your email: " email
	sed -i 's/gitEmail/${email}/g' ~/.config/nixpkgs/git.nix
fi

read -p "Do you want to create a ssh key for github (y/n): " key

if [ $key = "y" ]
then

	read -p "Enter an email for the ssh key: " email
	echo "Press enter when asked for storage location"

	ssh-keygen -t ed25519 -C $email
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_ed25519

	echo "Add this to your github as the public key:"
	cat ~/.ssh/id_ed25519.pub
fi

read -p "Do you want to add neovim config (y/n): " vim

if [ $vim = "y" ]
then
	cp ./nvim.nix ~/.config/nixpkgs/nvim.nix
fi

echo "You are going to have to import the .nix files into your home.nix"
