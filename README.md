# Dotfiles

Collection of configuration files that I use. More info: [http://dotfiles.github.io](http://dotfiles.github.io).

## Installation

You can clone the repository wherever you want. The `setup.sh` script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/lamberski/dotfiles.git && cd dotfiles && source setup.sh
```

To install everything, `cd` into your local `dotfiles` repository and then:

```bash
source install.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source update.sh
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository. It can be useful for setting Git author name and email etc.
