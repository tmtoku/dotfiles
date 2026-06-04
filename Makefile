init:
	ln -vsf ${PWD}/.aliases ${HOME}/.aliases
	ln -vsf ${PWD}/.envs ${HOME}/.envs
	ln -vsf ${PWD}/.xprofile ${HOME}/.xprofile
	ln -vsf ${PWD}/.gitconfig ${HOME}/.gitconfig
	ln -vsf ${PWD}/.xkb ${HOME}/.xkb

yay:
	sudo pacman -S --noconfirm --needed base-devel
	sudo pacman -S --noconfirm yay


tools:
	sudo pacman -S --noconfirm\
		downgrade fzf fd ripgrep bat watchexec evince poppler-data fastfetch xorg-xev discord xclip

development:
	sudo pacman -S --noconfirm\
		gcc gnuplot cmake cppcheck gdb lldb valgrind perf openmp openmpi

ssh:
	sudo pacman -S --noconfirm openssh
	mkdir -p ${HOME}/.ssh
	chmod 700 ${HOME}/.ssh

dropbox:
	yay -S --noconfirm dropbox
	dropbox

tlp:
	sudo pacman -S --noconfirm tlp
	sudo ln -vsf ${PWD}/tlp.conf /etc/default/tlp.conf
	systemctl enable tlp.service

fonts:
	sudo pacman -S --noconfirm ttf-meslo-nerd-font-powerlevel10k
	sudo pacman -S --noconfirm adobe-source-han-sans-jp-fonts
	yay -S --noconfirm ttf-cica ttf-times-new-roman
	mkdir ${PWD}/FantasqueSansMono
	cd FantasqueSansMono\
	&& curl -L -o FantasqueSansMono.tar.gz\
		https://github.com/belluzj/fantasque-sans/releases/download/v1.8.0/FantasqueSansMono-NoLoopK.tar.gz\
	&& tar xzf FantasqueSansMono.tar.gz
	sudo mv FantasqueSansMono /usr/share/fonts/

fcitx:
	sudo pacman -S --noconfirm fcitx5 fcitx5-configtool fcitx5-mozc fcitx5-gtk fcitx5-qt
	yay -S --noconfirm catppuccin-fcitx5-git
	mkdir -p ${HOME}/.config/fcitx5/conf
	ln -vsf ${PWD}/.config/fcitx5/conf/classicui.conf ${HOME}/.config/fcitx5/conf/classicui.conf
	ln -vsf ${PWD}/.config/fcitx5/config ${HOME}/.config/fcitx5/config

zsh:
	sudo pacman -S --noconfirm zsh
	ln -vsf ${PWD}/.zshrc ${HOME}/.zshrc
	ln -vsf ${PWD}/.zsh ${HOME}/.zsh
	mkdir -p ${HOME}/.zsh/.zinit
	git clone https://github.com/zdharma-continuum/zinit.git ${HOME}/.zsh/.zinit/bin

vim:
	sudo pacman -S --noconfirm gvim
	sudo pacman -S --noconfirm libz3
	ln -vsf ${PWD}/.vimrc ${HOME}/.vimrc
	ln -vsf ${PWD}/.vim ${HOME}/.vim

nvim:
	sudo pacman -S --noconfirm neovim
	ln -vsf ${PWD}/.config/nvim ${HOME}/.config/nvim

tmux:
	sudo pacman -S --noconfirm tmux
	ln -vsf ${PWD}/.tmux.conf ${HOME}/.tmux.conf
	git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm

urxvt:
	sudo pacman -S --noconfirm rxvt-unicode urxvt-perls
	ln -vsf ${PWD}/.Xresources ${HOME}/.Xresources
	xrdb -merge ${HOME}/.Xresources

ghostty:
	sudo pacman -S --noconfirm ghostty
	mkdir -p ${HOME}/.config/ghostty
	ln -vsf ${PWD}/.config/ghostty/config ${HOME}/.config/ghostty/config

termite:
	yay -S --noconfirm termite
	mkdir -p ${HOME}/.config/termite
	ln -vsf ${PWD}/.config/termite/config ${HOME}/.config/termite/config


i3wm:
	sudo pacman -S --noconfirm i3-gaps i3status feh jq
	ln -vsf ${PWD}/.config/i3 ${HOME}/.config/i3
	ln -vsf ${PWD}/.config/i3status ${HOME}/.config/i3status

plasma:
	sudo pacman -S --noconfirm plasma-x11-session

rofi:
	sudo pacman -S --noconfirm rofi
	ln -vsf ${PWD}/.config/rofi ${HOME}/.config/rofi

picom:
	sudo pacman -S --noconfirm picom
	ln -vsf ${PWD}/.config/picom.conf ${HOME}/.config/picom.conf

thunderbird:
	sudo pacman -S --noconfirm thunderbird

LaTeX:
	sudo pacman -S --noconfirm texlive-langjapanese texlive-most
	sudo pacman -S --noconfirm kile

docker:
	sudo pacman -S --noconfirm docker docker-compose
	sudo usermod -aG docker ${USER}
	sudo systemctl enable docker.service
	sudo systemctl start docker.service

python:
	sudo pacman -S --noconfirm uv

Rust:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	rustup update
	rustup component add rls rust-analysis rust-src

essential: yay ssh dropbox
basic: zsh fonts fcitx vim nvim tmux ghostty i3wm plasma rofi picom init
optional: tools development tlp urxvt termite thunderbird LaTeX docker python
