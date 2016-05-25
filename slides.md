title: DevOps & Docker with Nginx
author: PastLeo

%%%%%%%%%%%%%%%%%%%
% Use '%' to comment or directive (ex:css below)
%%%%%%%%%%%%%%%%%%%
%% You can add some custom style rules here...

%css

.bg-when-present.active {
    background: rgba(59, 65, 62, 0.85);
    border-radius: 10px;
}

%end

%%%%%%%%%%%%%%%%%%%
%% occupation of scale=1:
%% x = 1200
%% y = 700
%% occupation of scale=2: [occupation of scale=1] * 2
%% x = 2400
%% y = 1400
%% occupation of scale=3: [occupation of scale=1] * 3
%% x = 3600
%% y = 2100
%% occupation of scale=4: [occupation of scale=1] * 4
%% ...
%% the location of one step (slide) is originated from the center!

%%%%%%%%%%%%%%%%%%%
%% Here we go...

%%%%%%%%%%%%%%%
!SLIDE x=0 y=0 scale=10

## DevOps & Docker with Nginx

#### PastLeo @ NCHUIT

%%%%%%%%%%%%%%%
!SLIDE center picture x=0 y=-7000 scale=10

### 先來暖個身，補充一下一些東西

![exercise](http://i.giphy.com/CYtgfH4vQfmdq.gif)

%%%%%%%%%%%%%%%
!SLIDE x=-3000 y=-4750 scale=2

### 首先打開終端機

#### Linux Terminal

#### SSH / Putty 來連上伺服器

```
ssh username@ip_or_hostname
```

%%%%%%%%%%%%%%%
!SLIDE x=0 y=-4750 scale=2

## `which` / `$PATH`

%%%%%%%%%%%%%%%
!SLIDE x=3000 y=-4750 scale=2

## 自救的能力 `man` / `--help`

%%%%%%%%%%%%%%%
!SLIDE unclickable x=0 y=-7000 scale=10

%%%%%%%%%%%%%%%
!SLIDE picture center x=-12000 y=-7000 scale=10

![Linux Penguin](http://i.imgur.com/KVVNpoJ.png)

#### 管理 Linux

%%%%%%%%%%%%%%%
!SLIDE picture center x=-7700 y=-9500 scale=4

![funny-sudo](http://i.stack.imgur.com/m1rI9.png)

### 權限管理

%%%%%%%%%%%%%%%
!SLIDE x=-7700 y=-8500 scale=3

## 超人身份

#### `su <user>` / `sudo <command>` / `sudo su` / `visudo`

%%%%%%%%%%%%%%%
!SLIDE x=-7700 y=-8000 scale=3

## +人

#### `useradd <user_name>` / `adduser <user_name>`

%%%%%%%%%%%%%%%
!SLIDE x=-7700 y=-7500 scale=3

## [修改人(?](http://linux.vbird.org/linux_basic/0410accountmanager.php#usermod)

#### `usermod <option> <user_name>`

#### 把人加到群組裡面: `usermod -aG docker <user_name>`

%%%%%%%%%%%%%%%
!SLIDE picture center x=-7700 y=-5500 scale=4

![funny-file-permission](http://i.imgur.com/upsemfw.jpg)

### 檔案權限

%%%%%%%%%%%%%%%
!SLIDE x=-7700 y=-4500 scale=3

## [把東西送人](http://linux.vbird.org/linux_basic/0210filepermission.php#chown)

#### `chown [-Rv] <user>[:<group>] <path>`

%%%%%%%%%%%%%%%
!SLIDE x=-7700 y=-4000 scale=3

## [誰可以做啥](http://linux.vbird.org/linux_basic/0210filepermission.php#chmod)

#### `ls -l` => `drwxr-xr-x`

#### `chmod [-Rv] <mod> <path>`

%%%%%%%%%%%%%%%
!SLIDE picture center x=-16300 y=-9500 scale=4

![htop](http://i.imgur.com/qZcM1SL.png)

### 一些系統狀態

%%%%%%%%%%%%%%%
!SLIDE x=-16300 y=-9350 scale=3

## 工作管理員

#### `ps` / `ps <-ef|aux> | grep <program>` / [more](http://www.thegeekstuff.com/2011/04/ps-command-examples/)

#### `kill [-9] <pid>` / `killall <program>`

#### `top` / `htop`

%%%%%%%%%%%%%%%
!SLIDE x=-16300 y=-8450 scale=3

## 背景服務的控制

#### [`systemctl [status|start|stop|enable|disable] <service>`](http://luyaku.pixnet.net/blog/post/183362281-c6.5%E8%88%87c7%E7%9A%84%E4%B8%80%E4%BA%9B%E5%B7%AE%E7%95%B0%E8%88%87-systemctl-%E7%9A%84%E4%BB%8B%E7%B4%B9)

%%%%%%%%%%%%%%%
!SLIDE x=-16300 y=-7950 scale=3

## 網路狀態

#### `ifconfig` (`ipconfig` on windows)

#### 有哪些程式在監聽 Port: `netstat -tenlp` 

%%%%%%%%%%%%%%%
!SLIDE picture center x=-16300 y=-6000 scale=4

![apt-get-wife](http://i.imgur.com/X3SNyeB.png)

### 安裝軟體 (for ubuntu and debian)

%%%%%%%%%%%%%%%
!SLIDE x=-16300 y=-5200 scale=3

## 使用安裝包

#### `dpkg -i foo.deb` / [dpkg usage](http://maxubuntu.blogspot.tw/2010/04/dpkg.html)

#### 到下張投影片你就會忘了這件事了

%%%%%%%%%%%%%%%
!SLIDE x=-16300 y=-4500 scale=3

## `apt-get <action> <options>` 

#### `apt-get update`

#### `apt-get cache search ...` (or google) / `apt-get instal ...`

#### `apt-get remove ...`

#### `apt-get upgrade [...]`

%%%%%%%%%%%%%%%
!SLIDE unclickable center x=-12000 y=-7000 scale=10

%%%%%%%%%%%%%%%
!SLIDE x=-12000 y=3000 scale=10

### 關於套件管理程式

#### 他們都大同小異，以下我把我所知道的列出來

* Linux systems:
    * ubuntu, debian: `apt-get` / `aptitude`
    * centos, redhat: `yum`
* 3rd-party made for Non-Linux system:
    * OSX: [`brew`](http://brew.sh/)
    * Windows: [`choco`](https://chocolatey.org/)

%%%%%%%%%%%%%%%
!SLIDE x=-12000 y=3000 z=-12500 scale=10

### for Programming languages

* Python: `pip`，通常伴隨 Python 一同安裝
* Ruby: `gem`，通常伴隨 Ruby 一同安裝
* NodeJs: `npm`，通常伴隨 NodeJS 一同安裝
* PHP: `composer`，和以上三者比較不同，[來這取得](https://getcomposer.org)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%
!SLIDE center picture x=12000 y=-7000 scale=10

![docker](http://i.imgur.com/afEjiqM.png)

#### Docker

%%%%%%%%%%%%%%%
!SLIDE center picture x=16300 y=-9500 scale=4

![docker-in-vm](http://i.imgur.com/cYCs6e0.jpg)

### Installation

%%%%%%%%%%%%%%%
!SLIDE x=16300 y=-8200 scale=3

## [https://get.docker.com/](https://get.docker.com/)

#### [其他作業系統](https://docs.docker.com/engine/installation/)

#### Docker 是 client-server 的，在 OSX 跟 Windows 上只有 client

%%%%%%%%%%%%%%%
!SLIDE center picture x=16300 y=-6500 scale=4

![hello-world](http://i.imgur.com/7YISj2P.jpg)

### Try `docker` / `docker run hello-world`

%%%%%%%%%%%%%%%
!SLIDE x=16300 y=-5300 scale=3

### 體驗一下它的威力

#### `docker run -it centos`

#### `docker run -it node`

#### `docker run [options] <image>[:version] [command]`

#### [DockerHub](https://hub.docker.com/explore/)

%%%%%%%%%%%%%%%
!SLIDE x=7700 y=-9500 scale=4

## 來點認真的

```
git clone https://github.com/NCHUIT/104B_devOps_docker.git
```

#### 接下來各位會在 `practice` 內操作

%% The End
%%%%%%%%%%%%%%%
