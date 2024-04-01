#!/usr/bin/env zsh

declare script_dir="$(realpath $(dirname -- "$0"))"
source $script_dir/functions.sh

# Menu for selecting the installation steps
while true; do
    echo 'Please select an option:'
    echo '1. Update and patch your Mac (Will be prompted for admin password)'
    echo '2. Rename your Mac (Will be prompted for admin password)'
    echo '3. Install Xcode Command Line Tools'
    echo '4. Install Homebrew'
    echo '5. Install Homebrew Packages'
    echo '6. Download and install Droid SansM Nerd Font'
    echo '7. Install Oh My Zsh and Powerlevel10k'
    echo '8. Install asdf'
    echo '9. Execute All'
    echo '0. Exit'
    echo -n 'Enter the number of your choice: '
    read choice

    case $choice in
        1)  
            update_patch_mac
            ;; 
            
        2)  
            rename_mac
            ;; 

        3)  
            install_xcode_clt 
            ;; 
    
        4)  
            install_homebrew
            ;;

        5)  
            install_homebrew_packages
            ;;
        
        6)  
            install_font
            ;;
        
        7) 
            install_oh_my_zsh
            ;;
            
        8) 
            install_asdf
            ;;

        9)
            update_patch_mac
            rename_mac
            install_xcode_clt
            install_homebrew
            install_homebrew_packages
            install_font
            install_oh_my_zsh
            install_asdf
            ;;    

        0)
            echo 'Exiting.'
            break
            ;;
        *)
            echo 'Invalid option. Please try again.'
            ;;
    esac
done