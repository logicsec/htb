<img src="https://www.hackthebox.com/images/logo-htb.svg">


### How do I get this

<summary><b>1. Install the Dependencies</b></summary>
  
  - [awesome-git](https://aur.archlinux.org/packages/awesome-git)
  - [picom (ibhagwan fork)](https://github.com/ibhagwan/picom)
  - jq
  - inotify-tools
  - playerctl
  - brightnessctl
  - pulseaudio / pipewire-pulse
  - network-manager
  - mpd
  - mpDris2
  - ncmpcpp
  - xclip
  - maim
  - pamixer
  - rofi
  - wezterm
  - neovim
  - feh

<br>

**Required Fonts**

- [Material Design Icons](https://materialdesignicons.com/)
- Roboto

```sh
# Arch Linux
yay -S awesome-git mpd ncmpcpp jq inotify-tools playerctl brightnessctl \
pulseaudio networkmanager mpdris2 xclip maim pamixer rofi wezterm \
thunar neovim feh
```

```sh
# Debian Linux
sudo apt install mpd ncmpcpp jq inotify-tools playerctl brightnessctl \
pulseaudio network-manager mpdris2 xclip maim pamixer rofi wezterm \
thunar neovim feh
```

Start the MPD Service

```sh
systemctl enable --user mpd.service; systemctl start mpd.service
systemctl enable --user mpDris2.service; systemctl start mpd.service
```

<br>

<summary><b>2. Clone the repo</b></summary>

```sh
git clone https://github.com/lexlogic/htb
cd htb
git submodule init
git submodule update
```

Choose your /home disk in awesome.signals.disk. ex. /dev/sda2

Put your city name inside awesome.signals.weather


<br>

<summary><b>3. Move the config to .con directory</b></summary>

```sh
cd ..
cp -rf htb $HOME/.config/awesome
```


<br>