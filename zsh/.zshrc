# ~/.zshrc - Standard Zsh Configuration File

# This `.zshrc` file uses a **drop-in directory pattern** to make maintenance
# and configuration of the zsh shell:
#
# - **Modular** – Keeps different types of configurations separate (e.g.,
#                 aliases, environment variables, functions).
# - **Mainteable** – You can edit individual files without touching the
#                    main config.
# - **Automated** - A simple loop ensures all files are included.
# - **Simple** – You can enable/disable features by adding/removing files.

 # Define colors using tput (if supported)
 if tput setaf 1 >/dev/null 2>&1; then
  export UNK=$(tput setaf 4)    # Blue
  export INF=$(tput setaf 2)  # Green
  export WRN=$(tput setaf 3)    # Yellow
  export ERR=$(tput setaf 1)   # Red
  export MSG=$(tput setaf 7)   # White color
  export RST=$(tput sgr0)      # Reset
 else
  # Fallback to basic color codes if tput isn't available
  export UNK='\033[1;34m'       # Blue
  export INF='\033[1;32m'       # Green
  export WRN='\033[1;33m'       # Yellow
  export ERR='\033[1;31m'      # Red
  export MSG='\033[1;37m'  # White color
  export RST='\033[0m'         # Reset
 fi


zshlog() {
 case "${1:l}" in
    "i" | "info")
      CLR=$INF
      LVL="INF"
      ;;
    "w" | "warn" | "warning")
      CLR=$WRN
      LVL="WRN"
      ;;
    "e" | "error" | "err")
      CLR=$ERR
      LVL="ERR"
      ;;
    *)
      CLR=$UNK
      LVL="UNK"
      ;;
  esac
 MSG=$2
 echo -e "${CLR}[${LVL}]${MSG}${RST}"
}

dotfiles_does_not_exist() {
if [ -e "$1" ] || [ -L "$1" ]; then
    zshlog "Error" "Setup Error: The path ${1} must NOT exist."
    # exit 400
  fi
}

dotfiles_config_folder() {
  CONFIG_FOLDER=$1
  TARGET_FOLDER=$2
  if [ ! -L $CONFIG_FOLDER ] || 
    [ "$(/usr/bin/readlink ${CONFIG_FOLDER})" != "${TARGET_FOLDER}" ]; then
    zshlog "Error" \
           "Setup Error: ${CONFIG_FOLDER} is not linked to ${TARGET_FOLDER}" 
    # exit 401
  fi
}

dotfiles_file_exists() {
  CONFIG_FILE=$1
  if [ ! -f $CONFIG_FILE ]; then
    zshlog "Error" "Setup Error: Config file ${CONFIG_FILE} does not exist."
    # exit 402
  fi
}

# Load all of the drop-ins
for rcfile in ~/.config/zsh/rc.d/*.rc; do
 zshlog info "Loading $rcfile"
 [ -r "$rcfile" ] && source "$rcfile"
done

# Un-define colors for logging
unset UNK
unset INF
unset WRN
unset ERR
unset MSG
unset RST

