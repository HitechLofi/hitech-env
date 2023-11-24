# Options
setopt NO_CASE_GLOB
setopt GLOB_COMPLETE
setopt AUTO_CD
HISTFILE=${HOME}/.zsh_history
setopt EXTENDED_HISTORY
SAVEHIST=5000
HISTSIZE=2000
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
# setopt CORRECT
# setopt CORRECT_ALL
unsetopt CORRECT
unsetopt CORRECT_ALL
DISABLE_CORRECTION="true"
#   
# %F{#4040a4} $(kube_ps1)
# PROMPT='%F{#4040a4}   %f'
# RPROMPT='%F{#4040a4} %F{blue}%1~ %F{#4040a4} %F{blue}$(git_branch_name) %F{#4040a4} %F{blue}%@'
PROMPT='%F{#4040a4}󰄛  %f'
RPROMPT='%F{#4040a4} %F{blue}%1~ %F{#4040a4} %F{blue}$(git_branch_name) %F{#4040a4}󱦟 %F{blue}%@'
XDG_CONFIG_HOME=${HOME}/.config/
VISUAL=nvim
EDITOR="$VISUAL"
export EDITOR="$VISUAL"
NPM_PACKAGES="${HOME}/.npm-packages"
BUN_PACKAGES="${HOME}/.bun/bin"
PATH="$PATH:$NPM_PACKAGES/bin:$BUN_PACKAGES"
MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
export RIPGREP_CONFIG_PATH=${HOME}/.ripgreprc
setopt globdots

# Aliases
alias notes='cd /Users/arthur/Documents/A\ Workspace/Notes && nv'
alias tt='task | lolcat'
alias t='task'
alias k=kubectl
alias image="kitty +kitten icat"
alias book='buku --suggest --colors aAeXf --stag'
alias bookb='ff $(buku --colors aAeXf -p -f4 | fzf -m --reverse --preview "buku -p {1}" --preview-window "up,20%,border-bottom,+{2}+3/3,~3" | cut -f2)'
alias ff='/Applications/Firefox.app/Contents/MacOS/firefox --new-tab --url'
alias reset='source ${HOME}/.zshrc'
alias python=python3
alias pip=pip3
alias l='eza --git --icons -a'
alias ls='eza --git --icons -a'
alias la='eza --tree --level 1 --git --icons --long'
alias npm='pnpm'
alias calc='qalc'
alias dict='trans'
alias nv='nvim'
alias neo='nvim'
alias clear='clear;startupRun'
alias cl='clear'
alias g='git'
alias b='bun'
alias tm="tmux attach -t 0"
alias rr="cargo run"
alias t-d="cd ~/Developer"
alias t-fs2="cd ~/Developer/fs2"
alias t-meuni="cd ~/Developer/meuni"
alias meuni="cd ~/Developer/meuni && ./dev.sh"
alias t-odyssey="cd ~/Developer/odyssey-elm"

# Autoload
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# Autosource
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# FZF preview theme
_gen_fzf_default_opts() {
  local base03="234"
  local base02="235"
  local base01="240"
  local base00="241"
  local base0="244"
  local base1="245"
  local base2="254"
  local base3="230"
  local yellow="136"
  local orange="166"
  local red="160"
  local magenta="125"
  local violet="61"
  local blue="33"
  local cyan="37"
  local green="64"
  export FZF_DEFAULT_OPTS="
   --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue
   --color info:$violet,prompt:$violet,pointer:$base03,marker:$base03,spinner:$blue
   --preview 'bat --theme=GitHub --color=always --style=header,grid --line-range :8000 {}'
   --bind ctrl-j:preview-down,ctrl-k:preview-up,up:preview-up,down:preview-down
  "
  export FZF_PREVIEW_COMMAND="bat --theme=GitHub --color=always --style=header,grid --line-range :8000 {}"
}
_gen_fzf_default_opts

# Print on startup
quotes=(
  "The sky above the port was the color of television, tuned to a dead channel."
  "You will be required to do wrong no matter where you go. It is the basic condition of life, to be required to violate your own identity."
  "Be grateful that you only see the outward man. Be grateful that you never see the passions, the hatreds, the jealousies, the malice, the sicknesses… Be grateful you rarely see the frightening truth in people."
  "Never underestimate the determination of a kid who is time-rich and cash-poor."
  "I can’t go underground for a year, ten years, my whole life, waiting for freedom to be handed to me. Freedom is something you have to take for yourself."
  "Part of the inhumanity of the computer is that, once it is competently programmed and working smoothly, it is completely honest."
  "The Internet is the first thing that humanity has built that humanity doesn’t understand, the largest experiment in anarchy that we have ever had."
  "The human eye is a wonderful device. With a little effort, it can fail to see even the most glaring injustice."
  "Have you any idea how successful censorship is on TV? Don’t know the answer? Hmm. Successful, isn’t it?"
  "It’s impossible to move, to live, to operate at any level without leaving traces, bits, seemingly meaningless fragments of personal information. Fragments that can be retrieved, amplifie..."
  "In a way, staring into a computer screen is like staring into an eclipse. It’s brilliant and you don’t realize the damage until its too late."
  "His mouth filled with an aching taste of blue. His eyes were eggs of unstable crystal, vibrating with a frequency whose name was rain and the sound of trains, suddenly sprouting a humming forest of hair-fine glass spines."
  "The ‘Net is a waste of time, and that’s exactly what’s right about it."
  "No matter where you go, everyone’s connected."
  "An imagination is a powerful tool. It can tint memories of the past, shade perceptions of the present, or paint a future so vivid that it can entice… or terrify, all depending upon how we conduct ourselves today."
  "And, for an instant, she stared directly into those soft blue eyes and knew, with an instinctive mammalian certainty, that the exceedingly rich were no longer even remotely human."
  "People no longer look at each other, but there are institutes for that. They no longer touch each other, but there is contactotherapy. They no longer walk, but they go jogging, etc. Everywhere one recycles lost faculties, or lost bodies, or lost sociality, or the lost taste for food. One reinvents penury, asceticism, vanished savage naturalness: natural food, health food, yoga."
  "I think I’d probably tell you that it’s easier to desire and pursue the attention of tens of millions of total strangers than it is to accept the love and loyalty of the people closest to us."
  "When you want to know how things really work, study them when they’re coming apart."
  "The future is there… looking back at us. Trying to make sense of the fiction we will have become."
  "It looked like a biology lesson for gods, or a snapshot of the kind of pornography which might be enjoyed by sentient planets."
  "Nightside, cities glistened in chains, and a spray of tinkertoy habitats girdled the planet. Gossamer starbridges reached from the equator towards orbit. "
  "Cyberculture has become synonymous with the so-called ‘new edge’ of the subcultural avant-garde; a bricolage of technoculture, neo-’60s psychedelia, transcendentalism, designer ‘smart’ drugs, modern primitivism and ‘strechnology’ (the do-it-yourself street ethic of finding a use for things). In a much more specialised sense, cyberculture is associated with cyberpunk. Cyberpunk is equally difficult to adequately define. However, most accounts tend to portray it as the wired successor of the punk sensibility of the late 1970s… Cyberpunk is a lifestyle, a way of living in a telematic society, as well as an attitude towards it. It is a hybrid blend of info-tech obsession, Situationist politics, poststructuralist savvy and liberterian utopics."
  "Grief causes you to leave yourself. You step outside your narrow little pelt. And you can’t feel grief unless you’ve had love before it - grief is the final outcome of love, because it’s love lost. […] It’s the cycle of love completed: to love, to lose, to feel grief, to leave, and then to love again. Grief is the awareness that you will have to be alone, and there is nothing beyond that because being alone is the ultimate final destiny of each individual living creature. That’s what death is, the great loneliness."
  "Evolution brings human beings. Human beings, through a long and painful process, bring humanity."
  "Words bend our thinking to infinite paths of self-delusion, and the fact that we spend most of our mental lives in brain mansions built of words means that we lack the objectivity necessary to see the terrible distortion of reality which language brings."
  "Let me show you an endless trail of sunsets."
  "If I cut the tape, he realized, my world will disappear. Reality will continue for others, but not for me. Because my reality, my universe, is coming to me from this miniscule unit. Fed into the scanner and then into my central nervous system as it snailishly unwinds."
  "His mouth filled with an aching taste of blue. His eyes were eggs of unstable crystal, vibrating with a frequency whose name was rain and the sound of trains, suddenly sprouting a humming forest of hair-fine glass spines."
  "Towns like this are for people who like the way down."
  "All the speed he took, all the turns he’d taken and the corners he’d cut in Night City, and still he’d see the matrix in his sleep, bright lattices of logic unfolding across that colorless voi..."
  "He couldn’t think. He liked that very much, to be conscious and unable to think."
  "The ruins of the unsustainable are the 21st century’s frontier."
  "In a way, staring into a computer screen is like staring into an eclipse. It’s brilliant and you don’t realize the damage until its too late."
  "I don’t have to write about the future. For most people, the present is enough like the future to be pretty scary."
  "It’s impossible to move, to live, to operate at any level without leaving traces, bits, seemingly meaningless fragments of personal information. Fragments that can be retrieved, amplifie..."
  "Cyberpunk is an interzone between hard technologies, the sciences, mysticism and nihilo-romantic surreality."
  "The human eye is a wonderful device. With a little effort, it can fail to see even the most glaring injustice."
  "Never send a human to do a machine’s job."
  "What I thought was fifty years away, was only ten years away. And what I thought was ten years away… it was already here. I just wasn’t aware of it yet."
  "Part of the inhumanity of the computer is that, once it is competently programmed and working smoothly, it is completely honest."
  "Things can change so abruptly, so violently, so profoundly, that futures like our grandparents’ have insufficient ‘now’ to stand on. We have no future because our present is too volatile."
  "World-changing marvels to us are only wallpaper to our children."
  "Time moves in one direction, memory in another."
  "When you want to know how things really work, study them when they're coming apart."
  "Cyberspace. A consensual hallucination experienced daily by billions of legitimate operators, in every nation, by children being taught mathematical concept."
  "A graphic representation of data abstracted from the banks of every computer in the human system. Unthinkable complexity. Lines of light ranged in the nonspace of the mind, clusters and constellations of data. Like city lights, receding."
  "It's impossible to move, to live, to operate at any level without leaving traces, bits, seemingly meaningless fragments of personal information."
  "I've seen things you people wouldn't believe. Attack ships on fire off the shoulder of Orion. I watched C-beams glitter in the dark near the Tannhäuser Gate. All those moments will be lost in time, like tears in rain. Time to die"
)
function getQuote() {
  RANDOM=$$$(date +%s)
  selectedexpression=${quotes[$RANDOM % ${#quotes[@]} ]}
  echo "$selectedexpression"
}

function getRandomGif() {
  gif="api.giphy.com/v1/gifs/random?api_key=iwKGIZ30tHLZ2wOYGhJFj0gIxys0TtLt&tag=vaporwave"
  gifUrl=$(curl -s $gif -H "Accept: application/json" | jaq .data.images.downsized.url)

  regex='^"(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]\.[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]"$'

  if [[ $gifUrl =~ $regex ]]
  then
    eval "kitty +kitten icat --align=left $gifUrl"
  else
    echo ""
  fi
}

# getQuote | cowsay | lolcat
function startupRun() {
  echo "「$(getQuote)」" | lolcat
  # getRandomGif
  # ls
}
startupRun

function c() {
  cd "$1"
  ls
}

# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo $branch
  fi
}

# Usage: palette
palette() {
    local -a colors
    for i in {000..255}; do
        colors+=("%F{$i}$i%f")
    done
    print -cP $colors
}
# Usage: printc COLOR_CODE
printc() {
    local color="%F{$1}"
    echo -E ${(qqqq)${(%)color}}
}

function printcolors() {
  for i in {0..255} ; do
    printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i"
    if (( i == 15 )) || (( i > 15 )) && (( (i-15) % 6 == 0 )); then
      printf "\n";
    fi
  done
}

function p() {
  readonly query=${@:?"The query must be specified."}

  echo "$query" | prqlc compile --color always | psql meuni
}

set -o ignoreeof

# bun completions
[ -s "/Users/arthur/.bun/_bun" ] && source "/Users/arthur/.bun/_bun"

. /opt/homebrew/opt/asdf/libexec/asdf.sh

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
PATH="/Users/arthur/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"

export K9SCONFIG=$HOME/.config/k9s

# kubectl completions
source <(kubectl completion zsh)

source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.zsh/kube-ps1/kube-ps1.sh
KUBE_PS1_PREFIX=''
KUBE_PS1_SUFFIX=''
KUBE_PS1_SYMBOL_PADDING=true
KUBE_PS1_SEPARATOR=''
KUBE_PS1_SYMBOL_ENABLE=false
KUBE_PS1_DIVIDER=' '
KUBE_PS1_CTX_COLOR='blue'
KUBE_PS1_NS_COLOR='blue'

source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh
FZF_TAB_GROUP_COLORS=(
    $'\033[38;5;18m' $'\033[38;5;18m' $'\033[38;5;18m' $'\033[38;5;18m' $'\033[38;5;18m' $'\033[38;5;18m' $'\033[38;5;18m' \
    $'\033[38;5;18m' $'\033[38;5;18m' $'\033[38;5;18m' $'\033[38;5;18m' $'\033[38;5;18m' \
    $'\033[38;5;18m' $'\033[38;5;18m' $'\033[38;5;18m' $'\033[38;5;18m'
)
zstyle ':fzf-tab:*' group-colors $FZF_TAB_GROUP_COLORS

# Secrets
export SSH_AUTH_SOCK=/Users/arthur/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh

# Python
# export PYTHONPATH=/opt/homebrew/lib/python3.12/site-packages
# export PATH="/opt/homebrew/opt/python@3.12/libexec/bin:$PATH"

export PATH
eval "$(zoxide init --cmd j zsh)"
