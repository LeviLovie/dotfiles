{
  description = "Darwin System";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, homebrew-core, homebrew-cask }:
  let
    configuration = { pkgs, config, ... }: {
      nix.settings.experimental-features = "nix-command flakes";

      nixpkgs.config.allowUnfree = true;

      environment.systemPackages =
        [ pkgs.vim
          pkgs.neovim
          pkgs.mkalias
          pkgs.git
          pkgs.alacritty
          pkgs.nerd-fonts.jetbrains-mono
          pkgs.nerd-fonts.symbols-only
          pkgs.nodejs-slim_24
          pkgs.tmux
          pkgs.cargo
          pkgs.rustup
          pkgs.lazygit
          pkgs.yazi
          pkgs.ripgrep
          pkgs.eza
          pkgs.fzf
          pkgs.fastfetch
          pkgs.ffmpeg
          pkgs.postgresql
          pkgs.python3
          pkgs.zsh-powerlevel10k
          pkgs.rust-analyzer
          pkgs.just
          pkgs.llvm
          pkgs.lld
          pkgs.nmap
          pkgs.tree
          pkgs.spotify
          pkgs.obsidian
          pkgs.gh
          pkgs.starship
          pkgs.zoxide
        ];

      homebrew = {
        enable = true;
        brews = [
          "sqlite3"
        ];
        casks = [
          "iina"
          "docker-desktop"
        ];
        # masApps = [];
        onActivation.cleanup = "zap";
      };

      system.activationScripts.applications.text = let
        env = pkgs.buildEnv {
          name = "system-applications";
          paths = config.environment.systemPackages;
          pathsToLink = "/Applications";
        };
      in
        pkgs.lib.mkForce ''
          echo "setting up /Applications..." >&2
          rm -rf /Applications/Nix\ Apps
          mkdir -p /Applications/Nix\ Apps
          find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
          while read -r src; do
            app_name=$(basename "$src")
            echo "copying $src" >&2
            ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
          done
        '';

      programs.zsh.enable = true;

      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 6;

      system.primaryUser = "levi";
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    darwinConfigurations."mac-air" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "levi";
            taps = {
              "homebrew/homebrew-core" = homebrew-core;
              "homebrew/homebrew-cask" = homebrew-cask;
            };
            mutableTaps = true;
          };
        }
        ({config, ...}: {
          homebrew.taps = builtins.attrNames config.nix-homebrew.taps;
        })
      ];
    };
  };
}
