#!/usr/bin/env zsh

declare script_dir="$(realpath $(dirname -- "$0"))"
source $script_dir/macOSFunctions.sh

# Menu for selecting the installation steps
while true; do
    echo
    echo '==============================================='
    echo '    macOS Setup'
    echo '==============================================='
    echo 'Please select an option:'
    echo
    echo '  System Preparation:'
    echo '1. Update and patch your Mac (Will be prompted for admin password)'
    echo '2. Rename your Mac (Will be prompted for admin password)'
    echo '3. Install Xcode Command Line Tools'
    echo
    echo '  Package Management:'
    echo '4. Install Homebrew'
    echo '5. Install Homebrew Packages'
    echo '6. Install mise'
    echo
    echo '  Environment Setup:'
    echo '7. Download and install Droid SansM Nerd Font'
    echo '8. Install Oh My Zsh and Powerlevel10k'
    echo '9. Configure git'
    echo
    echo '10. Execute All'
    echo '0. Exit'
    echo
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
            install_mise
            ;;
        
        7) 
            download_install_font
            ;;
            
        8) 
            install_oh_my_zsh_powerlevel10k
            ;;

        9)  configure_git
            ;;

        10)
            echo "The 'Execute All' option includes steps that execute scripts from the internet via 'curl | sh'."
            echo "This can be a security risk."
            local user_ack_unsafe
            read -p "Do you want to approve all of these for this run? (y/n) " -n 1 -r reply
            echo
            if [[ "$reply" =~ ^[Yy]$ ]]; then
                user_ack_unsafe="y"
            else
                user_ack_unsafe="n"
            fi

            update_patch_mac
            rename_mac
            install_xcode_clt
            install_homebrew "$user_ack_unsafe"
            install_homebrew_packages
            install_mise "$user_ack_unsafe"
            download_install_font
            install_oh_my_zsh_powerlevel10k "$user_ack_unsafe"
            configure_git
            ;;

        0)
            echo 'Exiting.'
            break
            ;;
        *)
            echo 'Invalid option. Please try again.'
            ;;
    esac
    echo
    echo 'Press Enter to continue...'
    read
done