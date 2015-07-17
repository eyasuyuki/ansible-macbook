Setup Script for MacBook.

# Manualy Install Command Line Tools to your MacBook
```
xcode-select --install
```

# Manually Install homebrew to your MacBook
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

# Install Ansible to another host
```
brew install ansible
```

# Checkout this repository to another host
```
git clone git@github.com:eyasuyuki/ansible-macbook.git
cd ansible-macbook
```

# Put your MacBook's IP to hosts file
Please put your MacBook IP to hosts.

# Now Setup your MacBook!
```
ansible-playbook setup.yml
```

# Notice
It not copy private keys, ssh configs, keychains, etc.
