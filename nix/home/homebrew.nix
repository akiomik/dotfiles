# docs: https://daiderd.com/nix-darwin/manual/index.html#opt-homebrew.enable

{
  enable = true;

  taps = [];

  brews = [];

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
