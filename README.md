dotfiles
========

## Abstract
my dotfiles for develop environment powered by [rcm](https://github.com/thoughtbot/rcm) and [brewdler](https://github.com/Homebrew/homebrew-brewdler).

## How to use

### dotfiles

1. clone this repository.

  ```sh
git clone git@github.com:akiomik/dotfiles.git ~/.dotfiles
  ```

2. install [rcm](https://github.com/thoughtbot/rcm).

  ```sh
brew tap thoughtbot/formulae
brew install rcm
  ```

3. create symlinks.

  ```sh
env RCRC=$HOME/.dotfiles/rcrc rcup
  ```

### Brewfile

1. install [brewdler](https://github.com/Homebrew/homebrew-brewdler).

  ```sh
gem install brewdler
  ```

2. generate `Brewfile`.

  ```sh
cd ~/.dotfiles
homebrew/brew2brewfile.sh
  ```

3. install homebrew packages.

  ```sh
brewdle install
  ```
