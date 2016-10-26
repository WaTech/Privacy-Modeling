# Application Setup

## Install Homebrew

```sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## Install ruby 

```sh
\curl -L https://get.rvm.io | bash -s stable --ruby
rvm install ruby-2.3.1
rvm --default use ruby-2.3.1

source ~/.rvm/scripts/rvm

echo "[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*" >> ~/.bash_profile 
echo "export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting" >> ~/.bash_profile 
```

## PostgreSQL

```sh
brew install postgresql
# To have launchd start postgresql at login:
ln -sfv /usr/local/opt/postgresql/*plist ~/Library/LaunchAgents

# Then to load postgresql now:
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```

## Finally 

```sh
git clone git@gitlab.com:watech-newnormal/watech.git
cd watech
bundle 
rails db:setup
rails s
open http://localhost:3000
```

