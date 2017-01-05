![Privacy Modeling Tool](http://watech.herokuapp.com/images/privacy_modeling_logo.png)
# Privacy Modeling Tool

## About Privacy Modeling Tool

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

## Application Setup
Ruby 2.3.1

Database configuration:
Rename database.yml.example to database.yml

Configuration for env variables: 
Rename application.yml.example to application.yml

Check default credentials in seeds.rb

### Install Homebrew

```sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Install ruby 

```sh
\curl -L https://get.rvm.io | bash -s stable --ruby
rvm install ruby-2.3.1
rvm --default use ruby-2.3.1

source ~/.rvm/scripts/rvm

echo "[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*" >> ~/.bash_profile 
echo "export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting" >> ~/.bash_profile 
```

### PostgreSQL

```sh
brew install postgresql
# To have launchd start postgresql at login:
ln -sfv /usr/local/opt/postgresql/*plist ~/Library/LaunchAgents

# Then to load postgresql now:
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```

### Finally 

```sh
git clone git@gitlab.com:watech-newnormal/watech.git
cd watech
bundle 
rails db:setup
rails s
open http://localhost:3000
```

## Contributing
When contributing to this repository, please first discuss the change you wish to make via issue, email, or any other method with the owners of this repository before making a change.

## License
The Privacy Modeling Tool is open-sourced software licensed under the MIT license.