. "$( pwd )/utils.exclude.sh"

echo_with_prompt "RUNNING HOME BREW BOOTSTRAPPER"

# Install homebrew if it is not installed
which brew 1>&/dev/null
if [ ! "$?" -eq 0 ] ; then
	echo_with_prompt "Homebrew not installed. Attempting to install Homebrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	if [ ! "$?" -eq 0 ] ; then
		echo_with_prompt "Something went wrong. Exiting..." && exit 1
	fi
fi


# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)
# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed -- --with-default-names

# Install `wget` with IRI support.
brew install wget -- --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim -- --with-override-system-vi
brew install grep
brew install openssh
brew install tmux
brew install gmp

# Install other useful binaries.
brew install ack
brew install gs
brew install imagemagick -- --with-webp
brew install lynx
brew install pv
brew install rename
brew install ssh-copy-id
brew install tree
brew install httpie
brew cask install iterm2


# Display and fonts
brew tap homebrew/cask-fonts
brew cask install font-fira-code-nerd-font # Remember to set the font on iTerm

# Zsh Stuff
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


# Install Core Dev Tools
echo_with_prompt "Installing dev tools, runtimes, and DKs -- This will need some user input"

# EDIT THIS LIST TO ADD MORE TOOLS
# cs for scala
tools=(
	"install docker"
	"install minikube"
	"install python"
  "cask install adoptopenjdk"
  "install coursier/formulas/coursier && cs setup"
)
for i in "${tools[@]}"; do
		echo_with_prompt "Do you want to : $i? (y/n)"
		read resp
		if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
			command="brew ${i}"
			eval $command
			echo_with_prompt "--- $i completed ---"
		else
			echo_with_prompt "Skipping $i"
		fi
done

# Install Node if it is not installed
which node 1>&/dev/null
if [ ! "$?" -eq 0 ] ; then
	echo_with_prompt "Node not installed."
	echo_with_prompt "Do you want to : install the latest version of Node? (y/n)"
	read resp
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
		echo_with_prompt "Installing NVM v0.36.0"
		curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
		nvm install node
		echo_with_prompt "--- node install completed ---"
	else
		echo_with_prompt "Skipping $i"
	fi
	if [ ! "$?" -eq 0 ] ; then
		echo_with_prompt "Something went wrong. Exiting..." && exit 1
	fi
fi

# INSTALLING USEFUL NODE TOOLS
brew install yarn
yarn global add carbon-now-cli
yarn global add graphql-language-service-cli

# Remove outdated versions from the cellar.
brew cleanup

