#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


_urlencode() {
	local length="${#1}"
	for (( i = 0; i < length; i++ )); do
		local c="${1:$i:1}"
		case $c in
			%) printf '%%%02X' "'$c" ;;
			*) printf "%s" "$c" ;;
		esac
	done
}

osc7_cwd() {
	printf '\e]7;file://%s%s\e\\' "$HOSTNAME" "$(_urlencode "$PWD")"
}

PROMPT_COMMAND=osc7_cwd

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Aliases
alias v="nvim"   # Launch neovim with 'v'
alias mountUSB="sudo mount /home/flyingstitchman/ExternalDrive"		# Automagically mount and unmount my flash drive
alias umountUSB="sudo umount /home/flyingstitchman/ExternalDrive"
alias dotfiles='/usr/bin/git --git-dir=$HOME/Documents/Dotfiles/ --work-tree=$HOME'
