```bash
  █  █         ▐▌     ▄█▄ █          ▄▄▄▄
  █▄▄█ ▀▀█ █▀▀ ▐▌▄▀    █  █▀█ █▀█    █▌▄█ ▄▀▀▄ ▀▄▀
  █  █ █▄█ █▄▄ ▐█▀▄    █  █ █ █▄▄    █▌▄█ ▀▄▄▀ █▀█
  P  E  N   -   T  E  S  T  I  N  G     L  A  B  S
```


### How do I get this

### 1. Install the Dependencies
  
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

# Arch Linux
```sh
yay -S awesome-git mpd ncmpcpp jq inotify-tools playerctl brightnessctl \
pulseaudio networkmanager mpdris2 xclip maim pamixer rofi wezterm \
thunar neovim feh
```

<br>

# Debian Linux

Edit `/etc/apt/sources.list` and uncomment the deb-src line. Update apt repo:

```sh
sudo apt update
```

```sh
# Base dependencies
sudo apt install mpd ncmpcpp jq inotify-tools playerctl brightnessctl \
pulseaudio network-manager mpdris2 xclip maim pamixer rofi \
thunar neovim feh lua5.4 cmake luarocks

# Awesome dependencies
sudo luarocks install lgi
sudo luarocks install luacov

# Awesome-git
sudo apt build-dep awesome
git clone https://github.com/awesomewm/awesome
cd awesome
make package
cd build
sudo apt install ./*.deb

# Picom Install
sudo apt install libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libpcre3-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev meson

git clone https://github.com/yshui/picom
cd picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build install


# Install wezterm
curl -LO https://github.com/wez/wezterm/releases/download/20220905-102802-7d4b8249/wezterm-20220905-102802-7d4b8249.Ubuntu20.04.deb
sudo apt install -y ./wezterm-20220905-102802-7d4b8249.Ubuntu20.04.deb
```

Start the MPD Service

```sh
systemctl enable --user mpd.service; systemctl start mpd.service
systemctl enable --user mpDris2.service; systemctl start mpd.service
```

<br>

### 2. Clone the repo

```sh
git clone https://github.com/lexlogic/htb
cd htb
git submodule init
git submodule update
```

Choose your /home disk in awesome.signals.disk. ex. /dev/sda2

Put your city name inside awesome.signals.weather


<br>

### 3. Move the config to .config directory

```sh
cd ..
cp -rf htb $HOME/.config/awesome
```

### Screenshots

Main Screen
![Main Screen](screenshots/main.png)

<br>

Sidebar
![Sidebar](screenshots/sidebar.png)
<br>

Tiling
![Sidebar](screenshots/tiling.png)
<br>

Launcher
![Sidebar](screenshots/launcher.png)
<br>