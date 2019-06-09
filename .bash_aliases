alias python=python3
alias pip=pip3
alias ls='ls -GFhx --color=auto'
alias l='ls -GFhx --color=auto'
alias la='ls -A --color=auto'
alias ll='ls -l --color=auto'
alias c='cd'
alias cx='cd ..; la'
alias cx2='cd ../..; la'
alias cx3='cd ../../..; la'
alias cx4='cd ../../../..; la'
alias cx5='cd ../../../../..; la'
alias ch='cd ~; l'
alias cw='cd ~/dev; l'
alias nv='nvim'
alias nvtmux='nvim ~/.tmux.conf'
alias nvbash='nvim ~/.bash_aliases'
alias clear='clear'
alias cl='clear'
alias g='git'
alias reset='source ~/.profile'
alias wguide='open http://linuxcommand.org/lc3_learning_the_shell.php'
alias parrot="curl parrot.live"
alias tm="tmux attach -t 0"

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

function startupRun() {
  getQuote | cowsay | lolcat
  # getQuote | cowsay
  # fortune | cowsay | lolcat
  # fortune | cowsay
}
startupRun

export VISUAL=nvim
export EDITOR="$VISUAL"
export PS1="🌀 \[\e[36;1m\]\w\[\e[35;2m\] \e[5m👾 \[\e[33;1m\]\[\e[m\]"
# export CLICOLOR=1
# export LSCOLORS=ExFxBxDxCxegedabagacad
# export TERM=xterm-256color
