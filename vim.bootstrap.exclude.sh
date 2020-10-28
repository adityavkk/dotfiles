# Bootstrap a few things (install plugins and stuff) for vim config

# Note that sh doesn't have source (but does support . )
# And I guess the absolute path is needed when executing via sh
. "$( pwd )/utils.exclude.sh"

PROMPT='[ VimBootstrapper ]'

echo_with_prompt "Installing the color scheme"
mkdir -p ~/.vim/colors

# Creates swap and back directories if they don't exist (Make sure they match in .vimrc)
echo_with_prompt "Making swap and backup directories"
mkdir ~/.vim/swaps
mkdir ~/.vim/backups