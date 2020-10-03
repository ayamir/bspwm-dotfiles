# My ArchLinux&Bspwm Config

## Dracula:

![dracula.png](shot/dracula.png)

![dracula-wallpaper](wallpaper/Dracula.jpg)

## Nord:

![nord.png](shot/nord.png)

![nord-wallpaper](wallpaper/NordPeeks.png)

## MacBigSur:

![macBigSurShot](shot/macBigSur.png)

![macRofi](shot/macBigSurRofi.png)

![mac-wallpaper](wallpaper/mac.jpg)

- **Dracula GTK Theme**: [Ant Dracula](https://www.gnome-look.org/p/1099856/)

- **Nord GTK Theme**: [Nordic](https://www.gnome-look.org/p/1267246/)

- **Terminal**: Dracula: xterm Nord: termite(suggested)

- **Audio output emulator**: cava

- **Message notifier**: dunst

- **Editor**: vim(with [**vim-plus**](https://github.com/chxuan/vimplus)), nano

  The icons for different file types need your terminal font is a nerd font to display.

- **File browser**: ranger

- **System monitor**: gotop

- **System information**: pfetch

- **Bar**: polybar

  **About dracula polybar, I customized [Material Polybar](https://github.com/Murzchnvok/polybar-collection)**

  **About nord polybar, I customized [Nord Polybar](https://github.com/Yucklys/polybar-nord-theme)**

- **Program start menu**: rofi

- **Compton**:

  if you use Dracula theme, please install **compton-tryone-git**

  if you use Nord or MacBigSlur theme, please install **picom-ibhagwan-git**

- **Lock**: i3lock(with blur and a lock png) ffmpeg xautolock

- **Wallpaper Manage**: feh and nitrogen

- **Font**: Droid Sans Mono Nerd Font:size=13 (**noto-fonts-complete** **powerline-fonts** needed)

  If you use the Dracula theme, in order to display the icon font, you should install [**nerd-fonts-complete**](https://github.com/ryanoasis/nerd-fonts)

  If you use the Nord or MacBigSur theme, in order to display the icon font, you should install **ttf-font-awesome** , **otf-font-awesome** and **ttf-dejavu**

- **Shell**: zsh(with oh-my-zsh)

------

**About Nord polybar:**

How to start the nord polybar : 

1. backup your old polybar config
2. cp -r bspwm-dotfiles/nord/polybar ~/.config/
3. sh ~/.config/polybar/launch.sh

You will get a lot of errors and warnings if you launch it for the first time.

1. About icon: You should install **ttf-font-awesome** , **otf-font-awesome**(to display workspace and status icons), **ttf-dejavu**(to display three mac like icons in the left-top corner) and **noto-fonts-emoji**(to display wttr.in weather emoji). You can see all of fonts used in **dark-config** file

2. About audio control: You should install **pulseaudio** and **pulseaudio-ctl**

3. If you get warn like this: "warn: Dropping unmatched character ️ (U+fe0f)"

   Don't worry, it doesn't matter. It caused by the wttr.in emoji. In fact, the weather icon has been displayed correctly if you have installed the noto-fonts-emoji.

4. If the polybar doesn't appear, please modify the monitor name in **dark-config** to your monitor name. The correct value can use **xrandr** command to get.

File structure:

1. dark-colors: define all nordic color used
2. dark-config: two bars config, about fonts used and directly control bar behavior
3. nord-config: define global settings constant like monitor name, width, height, offset and other settings. define two bars modules used(there are many unused modules)
4. nord-top: define modules needed in top bar
5. nord-down: define modules needed in bottom bar

More details you can look the original nord polybar:  [Nord Polybar](https://github.com/Yucklys/polybar-nord-theme)

------

**Archcraft-polybar**

![archcraft-polybar](./shot/archcraft-polybar.png)

------

**i3lock's config**: (About autolock's details, please look the bspwmrc)

![Nord-lock](shot/nord-lock.png)

You should install [i3lock-color](https://github.com/Raymo111/i3lock-color)

```bash
sudo cp lock/lock.sh /usr/bin/lock && cp lock/wallpaper.png ~/Pictures/Background
```

------

**Weather**:

I use [wttr.in](https://github.com/chubin/wttr.in) to get weather, so you'd better add follow lines in your /etc/hosts to solve the problem of DNS resolution


```bash
# wttr.in
5.9.243.187 wttr.in
```

You should change the city in **polybar/script/weather-bar.sh** to your city to get correct weather.

If you encounter a problem like this:

![weather-trouble](shot/weather-trouble.png)

Please make sure you have connected to the Internet, then

```bash
sh ~/.config/polybar/launch.sh
```
