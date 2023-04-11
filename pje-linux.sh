#!/bin/bash

# Verifica se está rodando no Arch Linux ou sistema baseado em Arch
if ! grep -q '^ID="arch"' /etc/os-release
then
    read -p "Este script é destinado apenas para o Arch Linux ou sistemas baseados em Arch. Deseja continuar mesmo assim? [s/N] " choice
    case "$choice" in 
      s|S ) echo "Continuando execução do script...";;
      * ) echo "Abortando execução do script..."; exit;;
    esac
fi

# Verifica se o yay está instalado, se não, instala
if ! command -v yay &> /dev/null
then
    echo "yay não encontrado, instalando..."
    if ! command -v sudo &> /dev/null
    then
        echo "sudo não encontrado, por favor, instale manualmente e tente novamente."
        exit 1
    fi
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
else
    echo "yay já instalado"
fi

# Verifica se o opensc e jre11-openjdk já estão instalados, se não, instala
if ! pacman -Qi opensc &> /dev/null || ! pacman -Qi jre11-openjdk &> /dev/null
then
    echo "Instalando opensc e jre11-openjdk..."
    sudo pacman -S --noconfirm opensc jre11-openjdk
else
    echo "opensc e jre11-openjdk já instalados"
fi

# Habilita o serviço pcscd.service
if ! systemctl is-active --quiet pcscd.service
then
    echo "Habilitando o serviço pcscd.service..."
    sudo systemctl enable pcscd.service
    sudo systemctl start pcscd.service
else
    echo "pcscd.service já habilitado e em execução"
fi

# Verifica se o safesignidentityclient e pje-office já estão instalados, se não, instala
if ! yay -Qi safesignidentityclient &> /dev/null || ! yay -Qi pje-office &> /dev/null
then
    echo "Instalando safesignidentityclient e pje-office..."
    yay -S --noconfirm safesignidentityclient pje-office
else
    echo "safesignidentityclient e pje-office já instalados"
fi

echo "TUDO OK"
