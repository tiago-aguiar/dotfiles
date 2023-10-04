#!/bin/zsh

# Color constants
yellow="\e[33;40m"
red="\e[31;40m"
green="\e[32;40m"
reset="\e[39;49m"

me=`basename $0`
echo "basename is: $me"

# Get options.
LNOPTS=""
if [ $# -gt 0 ]; then
  if [[ "$1" == "-f" ]]; then
    LNOPTS="-f"
  else
    echo "Unrecognized option: $1"
    cat << EOF
Usage: $me [OPTIONS]

    Options:
    -f    Force symbolic link 'ln' to create a new one, even if one already exists with the same name.
EOF
    exit 1
  fi
fi

# The system name is used to link platform-specific files.
platform=`uname`
echo "current platform is: $platform"

pushd `dirname $0` > /dev/null
SCRIPTPATH=`pwd`
BINPATH="$SCRIPTPATH/bin"
SCRIPTPATH="$SCRIPTPATH/dots"
popd > /dev/null

pushd ~ > /dev/null

echo "current BINPATH is: $BINPATH"
echo "Creating symlinks for all configuration files in $SCRIPTPATH"
echo ""

# setup ohmyzsh
echo "Downloading zshell."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
rm -rf $HOME/.zshrc

# make symlink to folder $SCRIPTPATH
for dotfile in `find $SCRIPTPATH -mindepth 1 -maxdepth 1`; do
	linkfile=".${dotfile##*/}"

	if [ -e "$linkfile" ]; then
		echo -n "${yellow}Exists${reset}"
	else
		ln -s $LNOPTS "$dotfile" "./$linkfile" > /dev/null 2>&1

		if [ $? -eq 0 ]; then
			echo -n "${green}OK${reset}"
		else
			echo -n "${red}Failed${reset}"
		fi
	fi

	echo " $dotfile => $linkfile... "
done

# Build the bin
if [ ! -d "$HOME/bin" ]; then
  echo "Creating ~/bin directory."
  mkdir "$HOME/bin"
fi

# Build the config for vim or alacritty 
if [ ! -d "$HOME/.config" ]; then
	echo "Creating .config directory."
	mkdir "$HOME/.config"
fi

if [ ! -d "$HOME/.config/nvim" ]; then
	echo "Creating nvim directory."
	mkdir "$HOME/.config/nvim"
fi

# Return to original pwd.
popd > /dev/null

ln -s $LNOPTS "`pwd`/boilers/cpp.txt" "$HOME/.vim/boilers/cpp.txt" > /dev/null 2>&1
pushd "$HOME/bin" > /dev/null

echo ""
echo "Creating symlinks for executable scripts in $BINPATH."
echo ""

for script in `find $BINPATH -mindepth 1 -maxdepth 1`; do
  linkfile="${script##*/}"
  ln -s $LNOPTS "$script" "$linkfile" > /dev/null 2>&1
  chmod +x $linkfile
  if [ $? -eq 0 ]; then
    echo -n "${green}OK${reset}    "
  else
    if [ -f "$linkfile" ]; then
      echo -n "${yellow}Exists${reset}"
    else
      echo -n "${red}Failed${reset}"
    fi
  fi
  echo " $script -> $linkfile... "
done

# Return to original pwd.
popd > /dev/null
