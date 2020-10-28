. "$( pwd )/utils.exclude.sh"

PROMPT='[ Bootstrap ]'

source .exports

# Initialize creation
init () {
}

# Add Symlinks 
# TODO: Doesn't delete symlinks for deleted files
link () {
  for file in $( ls -A | grep -vE '\.exclude*|\.git$|\.gitignore|\.gitmodules|.*.md' ) ; do
    # Silently ignore errors here because the files may already exist
    ln -sv "$PWD/$file" "$HOME" || true
  done
}

install_tools () {
  local os=$(get_os)
  echo "OS IS: $os"
	if [ "$os" = 'darwin' ] ; then
    echo_with_prompt "Detected OS macOS"
		echo_with_prompt "This utility will install useful utilities using Homebrew"
		echo_with_prompt "Proceed? (y/n)"
		read resp
		# TODO - regex here?
		if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
			echo_with_prompt "Installing useful oh-my-zsh"
			sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
			echo_with_prompt "Installing useful stuff using brew et al. This may take a while..."
			sh tools.exclude.sh
		else
			echo_with_prompt "Tools installation cancelled by user"
		fi
	else
		echo_with_prompt "Skipping installations using Homebrew because MacOS was not detected..."
	fi

	if [ "$os" = 'debian' ] ; then
    echo_with_prompt "Detected OS $os"
		echo_with_prompt "This utility will install useful utilities using apt (this has been tested on Debian buster)"
		echo_with_prompt "Proceed? (y/n)"
		read resp
		# TODO - regex here?
		if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
			echo_with_prompt "Installing useful stuff using apt. This may take a while..."
			sh apt.exclude.sh
		else
			echo_with_prompt "Apt installation cancelled by user"
		fi
	else
		echo_with_prompt "Skipping installations using apt because Debian/Linux was not detected..."
	fi
}

bootstrap_crons() {
	# TODO consider sourcing this file
  	"$( pwd )/crontab.bootstrap.exclude.sh"
}

#init
#execute_func_with_prompt link "symlinking..."
install_tools
#execute_func_with_prompt bootstrap_crons "bootstrap the crontab"


# Exits script successfully
true
