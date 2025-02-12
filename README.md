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

## Setup via Nix

1. Clone this repository:

```bash
git clone git@github.com:akiomik/dotfiles.git ~/.dotfiles
```

2. Install `nix` via [nix-installer](https://github.com/DeterminateSystems/nix-installer):

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install
```

3. Because of conflicting `/etc/nix/nix.conf` with nix-darwin's, back-up it:

```bash
sudo mv /etc/nix/nix.conf /etc/nix/nix.conf.before-nix-darwin
```

4. Apply nix-darwin (and install `darwin-rebuild`)

```bash
nix --extra-experimental-features "flakes nix-command" \
  run nix-darwin -- switch --flake ~/.dotfiles
```

After run the above command, you can use `darwin-rebuild` instead of `nix run nix-darwin`:

```bash
darwin-rebuild switch --flake ~/.dotfiles
```
