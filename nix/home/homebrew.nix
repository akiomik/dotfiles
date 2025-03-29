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
    "mas"
    "poetry"
    "rye"
    "uv"
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
    "yt-dlp"

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
    "intellij-idea-ce"
    "leapp"
    "ngrok"
    "proxyman"
    "rapidapi"
    "raspberry-pi-imager"
    "session-manager-plugin" # for leapp
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
  # NOTE: iOS & iPadOS apps are currently not supported
  # https://github.com/mas-cli/mas
  masApps = {
    ADGUARD_FOR_SAFARI = 1440147259;
    GARAGEBAND = 682658836;
    # HAYAEMON = 717639970;
    IMOVIE = 408981434;
    KEYNOTE = 409183694;
    LADIOCAST = 411213048;
    LINE = 539883307;
    NOSTORE = 1666553677;
    NUMBERS = 409203825;
    PAGES = 409201541;
    SAVE_TO_RAINDROP = 1549370672;
    TAILSCALE = 1475387142;
    WAPPALYZER = 1520333300;
  };
}
