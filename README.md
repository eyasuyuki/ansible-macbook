Setup Script for MacBook.

# Manualy Install Command Line Tools to your MacBook
```
xcode-select --install
```

# Manually Install homebrew to your MacBook
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

# Manually Install Java
c.f.) https://support.apple.com/kb/DL1572

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
```
[macbook]

<your MacBook's IP>
```

# Put your MacBook account to setup.yml
```
- hosts: all
  remote_user: <your account>
```

# Now Setup your MacBook!
```
ansible-playbook setup.yml
```

# Notice
It not copy private keys, ssh configs, keychains, etc.
