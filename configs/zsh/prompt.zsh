
# Colors.
red='\e[0;31m'
RED='\e[1;31m'
green='\e[0;32m'
GREEN='\e[1;32m'
yellow='\e[0;33m'
YELLOW='\e[1;33m'
blue='\e[0;34m'
BLUE='\e[1;34m'
purple='\e[0;35m'
PURPLE='\e[1;35m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
NC='\e[0m'

# Prompt
user_info="%F{070}%n%f@%F{025}%m"
working_dir="%F{036}%(4~|%-1~/.../%1~|%~)%f"
PROMPT='${user_info} ${working_dir} %# '
# Spelling prompt
SPROMPT='%F{197}Do you mean %B%r%b ? %F{3}Nyae!%f 🐱 '
# Right prompt
#RPROMPT='%(?,%F{green}:%),%F{yellow}%? %F{red}:()%f'

function precmd() {
    vcs_info
    if [[ -z ${vcs_info_msg_0_} ]]; then
        PROMPT='${user_info} ${working_dir} %# '
    else
        # show git repo relative path
        git_toplv="$(basename $(git rev-parse --show-toplevel))"
        git_prefix="$(git rev-parse --show-prefix)"; git_prefix=${git_prefix%?}
        git_working_dir="%F{041}${git_toplv}${git_prefix:+"/$git_prefix"}%f"
        PROMPT='${user_info} ${git_working_dir} ${vcs_info_msg_0_}%# '
    fi
}
