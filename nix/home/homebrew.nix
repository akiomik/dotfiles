# docs: https://daiderd.com/nix-darwin/manual/index.html#opt-homebrew.enable

{
  enable = true;

  taps = [
    "auth0/auth0-cli" # auth0
    "homebrew/test-bot" # brew test-bot
    "kayac/tap" # ecspresso
  ];

  brews = [
    # File Format
    "brotli"
    "snappy"
    "webp"
    "zstd"

    # Editor
    "emacs" # for agda
    "neovim"

    # Language
    "agda"
    "mise"
    "rustup"

    # Language server
    "elixir-ls"
    "solargraph"

    # Package Manager
    "cocoapods"
    "poetry"
    "rye"
    "yarn"

    # Build Tool
    "just"
    "make"
    "sccache"
    "wasm-pack"

    # Linter & Formatter
    "actionlint"
    "biome"
    "ruff"
    "shfmt"
    "staticcheck"
    "tflint"
    "typos-cli"

    # Git
    "aicommits"
    "gh"
    "ghq"
    "gibo"
    "git"
    "git-delta"
    "git-lfs"

    # AWS
    "awscli"
    "copilot"
    "ecspresso"

    # SaaS
    "auth0"

    # Container
    "docker"
    "docker-completion"

    # Performance
    "htop"
    "hyperfine"
    "k6"

    # Audio & Video
    "ffmpeg"
    "flac"

    # Image
    "imagemagick"

    # Utility
    "coreutils"
    "gnu-sed"
    "gnupg"
    "jq"
    "peco"
    "ripgrep"
    "tree"

    # Network Tools
    "curl"
    "websocat"
    "wget"

    # Terminal
    "tmux"

    # Database
    "postgresql@15"
    "redis"

    # Shell
    "starship"
    "zplug"
    "zsh-syntax-highlighting"
  ];

  casks = [
    # 📕Books
    "kindle"

    # 💼Business
    "adobe-acrobat-reader"
    "slack"
    "zoom"

    # 🛠️Developer Tools
    "android-studio"
    "chromedriver"
    "docker"
    "hex-fiend"
    "leapp"
    "ngrok"
    "proxyman"
    "rapidapi"
    "raspberry-pi-imager"
    "intellij-idea-ce"
    "utm"
    "visual-studio-code"
    "vmware-fusion"

    # 🎓Education

    # 🍿Entertainment
    
    # 💳Finance
    "tradingview"

    # 🍽️Food & Drink

    # 🎮Games
    "curseforge"
    "minecraft"
    "sameboy"
    "steam"

    # 🎨Graphics & Design
    "affinity-designer"
    "affinity-publisher"
    "figma"

    # 🚲Health & Fitness
    "garmin-express"

    # 🎈Kids

    # 🛋️Lifestyle

    # 📰Magazines & Newspapers

    # 🩺Medical

    # 🎵Music
    "audacity"
    "blackhole-2ch"
    "elektron-overbridge"
    "elektron-transfer"
    "ilok-license-manager"
    "izotope-product-portal"
    "musescore"
    "spotify"
    "sysex-librarian"

    # 🧭Navigation

    # 🆕News

    # 📷Photo & Video
    "affinity-photo"
    "blu-ray-player"
    "fujifilm-x-raw-studio"
    "obs"

    # 🚀Productivity
    "chatgpt"
    "cloudflare-warp"
    "deepl"
    "dropbox"
    "firefox"
    "google-chrome"
    "malwarebytes"
    "notion"
    "raycast"
    "rectangle"
    "todoist"
    "tor-browser"

    # 👀Reference

    # 🧩Safari Extensions

    # 🛍️Shopping

    # 💬Social Networking
    "discord"
    "keybase"

    # ⚽️Sports

    # 🧮Utility
    "appcleaner"
    "hhkb-keymap-tool"
    "keepingyouawake"
    "the-unarchiver"

    # 🌤️Weather

    # TODO: Add the followings
    # "bsnes+"
    # "uvi-portal"
    # "toast-20-titanium"
    # "blackmagic-media-express"
    # "beringer-vintage"
    # "adsr-sample-manager"
  ];

  # Mac App Store using mas
  # https://github.com/mas-cli/mas
  masApps = {
    LINE = 539883307;

    # TODO: Ad the followings
    # はやえもん
    # Ad guard for safari
    # save-to-raindrop
    # ladiocast
    # "tailscale"
    # spotify
    # "nostore"
    # Wappalyzer
  };
}
