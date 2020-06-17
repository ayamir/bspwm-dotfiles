# My ArchLinux&Bspwm Config

Dracula:

![dracula.png](shot/dracula.png)

![dracula-wallpaper.png](wallpaper/Dracula.jpg)

Nord:

![nord.png](shot/nord.png)

![nord-wallpaper.png](wallpaper/Nord.png)

**Dracula GTK Theme**: [Ant Dracula](https://www.gnome-look.org/p/1099856/)

**Nord GTK Theme**: [Nordic](https://www.gnome-look.org/p/1267246/)

**Terminal**: Dracula: xterm Nord: termite

**Audio output emulator**: cava

**Message notifier**: dunst

**Editor**: vim(with vim-plus), nano

**File browser**: ranger

**System monitor**: gotop

**System information**: pfetch

**Bar**: polybar

About dracula polybar, I customized [Material Polybar](https://github.com/Murzchnvok/polybar-material)

About nord polybar, I customized [Nord Polybar](https://github.com/Yucklys/polybar-nord-theme)

**Program start menu**: rofi

**Compton**: compton-tryone-git

**Lock**: i3lock(with blur and a lock png) ffmpeg xautolock

**Wallpaper**: feh

**Font**: Droid Sans Mono Nerd Font:size=13 (nerd-fonts-complete needed)

**Shell**: zsh(with oh-my-zsh)

i3lock's config: (About autolock's details, please look the bspwmrc)

```bash
sudo cp lock/lock.sh /usr/bin/lock && sudo cp lock/lock.png /bin/
```

I use [wttr.in](https://github.com/chubin/wttr.in) to get weather, so you'd better add follow lines in your /etc/hosts to solve the problem of DNS resolution

```bash
# wttr.in
5.9.243.187 wttr.in
```
