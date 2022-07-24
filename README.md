# peoxin/dwm

## 本配置使用方法

```shell
git clone https://github.com/peoxin/dwm.git
```

分别在`dwm`、`dwm/slstatus`和`dwm/dmenu`目录下，执行`sudo make clean install`。

安装其他所需工具。

将`dwm/.dwm`文件夹复制到`~`目录下。

如果使用显示管理器（如`SDDM`），在`/usr/share/xsessions`文件夹下，创建`dwm.desktop`文件，内容如下：

```
[Desktop Entry]
Type=Application
Name=dwm
Comment=Dynamic window manager
Exec=dwm
TryExec=dwm
```

如果不使用显示管理器，在`/etc/X11/xinit/xinitrc`或` ~/.xinitrc`文件中，添加以下内容：

```shell
exec dwm
```

可能需要对`~/.dwm`文件夹下的脚本，以及`dwm`、`slstatus`和`dmenu`的配置文件进行修改。

## dwm的安装和配置

### 安装dwm

```shell
git clone https://git.suckless.org/dwm
cd dwm
sudo make clean install
```

### 配置前准备

#### 安装dmenu

```shell
git clone https://git.suckless.org/dmenu
cd dmenu
sudo make clean install
```

#### 安装slstatus

```shell
git clone https://git.suckless.org/slstatus
cd slstatus
sudo make clean install
```

#### 安装其他工具

```shell
sudo pacman -S alacritty # 安装终端模拟器
sudo pacman -S wqy-microhei ttf-nerd-fonts-symbols # 安装字体
sudo pacman -S alsa-utils # 安装音量管理工具
sudo pacman -S feh # 安装壁纸工具
```

#### 应用补丁

| 补丁      | 下载链接                                                     |
| --------- | ------------------------------------------------------------ |
| autostart | https://dwm.suckless.org/patches/autostart/dwm-autostart-20210120-cb3f58a.diff |
| fullgaps | http://dwm.suckless.org/patches/fullgaps/dwm-fullgaps-toggle-20200830.diff |
| noborder | http://dwm.suckless.org/patches/noborder/dwm-noborderselflickerfix-2022042627-d93ff48803f0.diff | 

### 正式配置

dwm的配置文件：`config.h`

#### 更换终端模拟器

此处选择使用`alacritty`。如下更改：

```c
static const char *termcmd[] = { "alacritty", NULL };
```

#### 更换字体

如下更改：

```c
static const char *fonts[] = {
	"monospace:size=10",
	"WenQuanYi Micro Hei:size=10:type=Regular:antialias=true:autohint=true",
	"Symbols Nerd Font:pixelsize=14:type=2048-em:antialias=true:autohint=true"
};
```

#### 更改标签

根据自己的喜好更改标签名：

```
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };
```

可以在[Nerd Fonts](https://www.nerdfonts.com/cheat-sheet)中查找自己所要的符号，复制Icon并粘贴到对应位置。

#### 配置slstatus

slstatus的配置文件：`config.h`（注意不是dwm的配置文件）

根据注释配置即可。参考命令如下：

显示Linux内核版本：

```shell
uname -r | awk -F "-" '{print $1}'
```

显示音量：
```shell
amixer get Master | awk -F "[][]" '/Left:/ {print $2}'
amixer get Capture | awk -F "[][]" '/Left:/ {print $2}'
```

#### 配置autostart

autostart自动运行脚本：`~/.dwm/autostart.sh`

##### 设置分辨率

添加：

```shell
xrandr --output <monitor> --mode <width>x<height>
```

执行`xrandr`可以查看可选的显示器和分辨率。

##### 设置壁纸

添加：

```shell
feh --bg-scale <wallpaper-file>
# 随机选择壁纸 feh --bg-scale --randomize <wallpaper-folder>
```

##### 自动运行slstatus

添加：

```shell
exec slstatus &
```

#### 配置快捷键

根据习惯自行配置快捷键。

##### 音量控制快捷键

在`.dwm`文件夹下添加音量控制脚本，给予执行权限。

音量控制命令：

```shell
amixer set Master 100% # 设置音量
amixer set Master 5%-[5%+] # 相对设置音量
amixer set Master on/off/mute/unmute/toggle # 切换静音
# 除了Master，可能还需要设置PCM等
```

设置音量控制快捷键：

```c
static const char *voltogglecmd[] = { "~/.dwm/voltoggle.sh", NULL };
static const char *voldowncmd[] = { "~/.dwm/voldown.sh", NULL };
static const char *volupcmd[] = { "~/.dwm/volup.sh", NULL };

{ MODKEY, XK_F1, spawn, {.v = voltogglecmd } },
{ MODKEY, XK_F2, spawn, {.v = voldowncmd } },
{ MODKEY, XK_F3, spawn, {.v = volupcmd } },
```
