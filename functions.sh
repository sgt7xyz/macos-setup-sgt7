#Update and patch your mac
update_patch_mac() {
  sudo softwareupdate -iaR --agree-to-license --verbose
}

#Function to rename your mac
rename_mac() {
    echo 'What would your like to rename your Mac to?'
    read choice
    sudo scutil --set HostName $choice
    sudo scutil --set LocalHostName $choice
    sudo scutil --set ComputerName $choice
    newHostName=$(scutil --get HostName)
    newLocalHostName=$(scutil --get LocalHostName)
    newComputerName=$(scutil --get ComputerName) 
    echo '#### Computer renaming successful! ####'
    echo "Your new HostName is $newHostName" 
    echo "Your new LocalHostName is $newLocalHostName"
    echo "Your new ComputerName is $newComputerName"
    echo '#######################################'
}

# Function to install Xcode Command Line Tools
install_xcode_clt () {
    echo 'Installing XCode Command Line Tools...'
    xcode-select --install
    echo 'Xcode Command Line Tools installed successfully.'
}

# Function to install Homebrew
install_homebrew() {
    echo 'Installing Homebrew...'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/steven/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    echo 'Homebrew installed successfully.'
}

# Function to download and install Droid SansM Nerd Font
install_font() {
    font_dir="./fonttmp"
    font_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/DroidSansMono.zip"
    mkdir -p $font_dir
    echo 'Downloading and Installing Fonts...'
    cd $font_dir
    curl -L $font_url -o "DroidSansMonoNerdFont.zip"
    echo "Unzipping the font..."
    unzip "DroidSansMonoNerdFont.zip" -d "./"
    cp *.otf ~/Library/Fonts/
    echo "Cleaning up..."
    cd ..
    rm -rf $font_dir
    echo 'Fonts installed successfully. Ensure you select the font in your terminal etc.'
}

# Function to install Oh My Zsh and Powerlevel10k
install_oh_my_zsh() {
    zshrc_file="$HOME/.zshrc"
    echo 'Installing Oh My Zsh and Powerlevel10k...'
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
    cp -p ~/.zshrc ~/.zshrc.orig
    ls -al ~/.zshrc*
    sed -i .bak 's|ZSH_THEME="robbyrussell"|ZSH_THEME="powerlevel10k\/powerlevel10k"|g' $zshrc_file
    source $zshrc_file
    echo 'Oh My Zsh installed successfully and configured it for powerlevel10k.'
}

# Function to install mas-cli using Homebrew
install_homebrew_packages() {
    echo 'Installing homebrew packages...'
    app_list="brew_install_list.txt"
    if ! command -v brew &> /dev/null; then
        echo "Homebrew not installed. Please install Homebrew first."
        exit 1
    fi
    
    while IFS= read -r app || [[ -n "$app" ]]; do
        echo "Installing ${app}..."
        brew install "$app"
        done < "$app_list"
    echo 'Homebrew pacakges installed successfully.'
}

# Function to install mas-cli using Homebrew
install_asdf() {
    zshrc_file="$HOME/.zshrc"
    echo 'Installing asdf...'
    if ! command -v brew &> /dev/null; then
            echo "Homebrew is not installed. Install it first."
    else
            brew install coreutils curl git
    fi
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
    sed -i .bak 's|plugins=(git)|plugins=(git asdf)|g' $zshrc_file
    source $zshrc_file
    echo 'asdf installed successfully.'
}