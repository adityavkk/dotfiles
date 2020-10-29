# >>> coursier install directory >>>
export PATH="$PATH:/Users/kumaad3/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<

# We want to regularly go to our virtual environment directory
export WORKON_HOME=~/.virtualenvs
# If in a given virtual environment, make a virtual environment directory
# If one does not already exist
mkdir -p $WORKON_HOME

# Activate the new virtual environment by calling this script
# Note that $USER will substitute for your current user
# TODO: ADD LATEST VERSION
# . ~/.pyenv/versions/(ADD_LATEST_VERSION)/bin/virtualenvwrapper.sh
