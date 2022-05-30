#i plan to hash the file after pulling it from github then compare that to a verified copy
sudo apt update && sudo apt upgrade && apt install wget apt-transport-https curl aptitude terminator xfburn gparted dolphin gnupg &&
apt install sddm xorg kde-plasma-desktop kwin-x11 kwin-wayland plasma-nm --no-install-recommends && apt purge ksys* kwallet* termit* &&

#flatpaks
sudo apt install flatpak &&
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo &&

# put a #in front if u dont want it
flatpak install flathub md.obsidian.Obsidian &&
flatpak install flathub com.spotify.Client &&
flatpak install flathub com.todoist.Todoist &&
flatpak install flathub io.freetubeapp.FreeTube &&
flatpak install flathub org.onlyoffice.desktopeditors &&
flatpak install flathub com.github.eneshecan.WhatsAppForLinux &&
flatpak install flathub network.loki.Session &&
flatpak install flathub com.discordapp.Discord &&

#tiling manager: bismuth for kde
echo "deb http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list > /dev/null &&
wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null &&
sudo apt update && sudo aptitude install kwin-bismuth &&

#for librewolf
distro=$(if echo " bullseye focal impish jammy uma una " | grep -q " $(lsb_release -sc) "; then echo $(lsb_release -sc); else echo focal; fi) &&
echo "deb [arch=amd64] http://deb.librewolf.net $distro main" | sudo tee /etc/apt/sources.list.d/librewolf.list &&
sudo wget https://deb.librewolf.net/keyring.gpg -O /etc/apt/trusted.gpg.d/librewolf.gpg &&
sudo apt update &&
sudo apt install librewolf -y &&

#for brave browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg  &&
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list &&
sudo apt update &&
sudo apt install brave-browser &&

#for signal
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg &&
cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null &&
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\ &&
  sudo tee -a /etc/apt/sources.list.d/signal-xenial.list &&
  sudo apt update && sudo apt install signal-desktop &&

#for session messenger idk commands that well will google another time

#for proprietary wifi drivers only

cd /etc/apt/sourceslist.d/ &&

echo "deb http://deb.debian.org/debian bullseye main contrib non-free
deb-src http://deb.debian.org/debian bullseye main contrib non-free

deb http://deb.debian.org/debian-security/ bullseye-security main contrib non-free
deb-src http://deb.debian.org/debian-security/ bullseye-security main contrib non-free

deb http://deb.debian.org/debian bullseye-updates main contrib non-free
deb-src http://deb.debian.org/debian bullseye-updates main contrib non-free" | sudo tee /etc/apt/sources.list.d/proprietarydebian.list &&

sudo apt update && sudo apt install firmware-iwlwifi && sudo rm /etc/apt/sources.list.d/proprietarydebian.list && sudo apt update
#skip

