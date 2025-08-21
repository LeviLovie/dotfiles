{ pkgs, config, ... }:

{
  home.username = "levi";
  home.homeDirectory = "/Users/levi";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    alacritty
    eza
    fastfetch
    fd
    ffmpeg
    fzf
    gh
    git
    just
    lazygit
    mkalias
    neovim
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    nmap
    nodejs-slim_24
    obsidian
    postgresql
    python3
    ripgrep
    spotify
    starship
    tmux
    tree
    xxd
    yazi
    zoxide
  ];

  programs.git = {
    enable = true;
    userName = "Levi Lovie";
    userEmail = "leviiloviee@gmail.com";
  };

  programs.zsh.enable = true;

  home.sessionVariables.POST_INIT_SCRIPT = ''
    DOTFILES="~/.dotfiles"
    NVIM_CONFIG="~/.config/nvim"
    ALACRITTY_CONFIG="~/.config/alacritty"
    ZSH_CONFIG="~/.zshrc"
    TMUX_CONFIG="~/.tmux.conf"
    
    if [ ! -d "$DOTFILES" ]; then
      ${pkgs.git}/bin/git clone git@github.com:LeviLovie/dotfiles.git "$DOTFILES"
    fi
    
    mkdir -p "$(dirname $NVIM_CONFIG)"
    mkdir -p "$(dirname $ALACRITTY_CONFIG)"

    function link() {
      local target="$1"
      local source="$2"
      if [ -e "$target" ]; then
        rm -rf "$target"
      fi
      ln -s "$source" "$target"
    }
    
    link("$NVIM_CONFIG", "$DOTFILES/nvim");
    link("$ALACRITTY_CONFIG", "$DOTFILES/alacritty");
    link("$ZSH_CONFIG", "$DOTFILES/zshrc");
    link("$TMUX_CONFIG", "$DOTFILES/tmux.conf");
  '';
}

