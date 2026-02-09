# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    /etc/nixos/hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader = {
    # systemd-boot.enable = true;
    # systemd-boot.configurationLimit = 5;
    # systemd-boot.consoleMode = "auto";
    efi.canTouchEfiVariables = true;
    grub.enable = true;
    grub.efiSupport = true;
    # grub.useOSProber = true;
    grub.device = "nodev";
    # grub.theme = "${pkgs.grub-theme}";
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Nix
  nix = {
    settings = {
      auto-optimise-store = true;

      # Enable flakes
      experimental-features = ["nix-command" "flakes"];
    };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };
  };

  networking.hostName = "gaming"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };

  # Configure keymap in X11
  services = {
    displayManager = {
      autoLogin = {
        enable = true;
        user = "user";
      };
      sddm = {
        enable = true;
      };
    };

    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        options = "ctrl:nocaps";
      };
      videoDrivers = ["nvidia"];
    };
    desktopManager.plasma6.enable = true;
  };

  hardware.graphics.enable = true;
  hardware.nvidia = {
    open = false;
    modesetting.enable = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = ["networkmanager" "wheel" "docker"];
  };

  users.users.server = {
    isNormalUser = true;
    description = "user";
    extraGroups = ["docker"];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Cli Apps
    vim
    neovim
    fzf
    fd
    ripgrep
    feh
    wget
    git
    curl
    tmux
    rofi
    rsync
    inetutils
    xclip
    unzip
    jq
    starship
    direnv

    # Wine
    wineWowPackages.stable
    winetricks
    wineWowPackages.waylandFull

    # Plasma Packages
    wayland-utils
    wl-clipboard

    # Theme
    gruvbox-dark-icons-gtk

    # Utils
    zip
    texliveFull # TeX Live Environment

    # Gui App
    pavucontrol
    flameshot
    alacritty
    ghostty
    firefox
    alejandra
    docker
    peek
    keepassxc
    zathura
    networkmanagerapplet
    calibre
    discord
    libreoffice

    # Network utils
    nmap
    fping
    wireguard-tools
    openvpn

    # Programming
    gnumake
    gcc
    clang
    rustup
    python3
    jdk17
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/user/.steam/root/compatibilitytools.d";
  };

  documentation = {
    enable = true;
    man = {
      enable = true;
      generateCaches = true;
    };
    nixos.enable = true;
    info.enable = true;
    doc.enable = true;
    dev.enable = true;
  };

  fonts.packages = with pkgs; [
    pkgs.nerd-fonts.iosevka
    pkgs.nerd-fonts.meslo-lg
  ];

  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [
  ];

  virtualisation.docker.enable = true;

  virtualisation.vmware.host.enable = false;
  virtualisation.vmware.guest.enable = false;
  # virtualisation.virtualbox.guest.enable = true;
  # rtkit is optional but recommended

  services.avahi.publish = {
    enable = true;
    userServices = true;
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true; # if not already enabled
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
    wireplumber = {
      extraConfig = {
        bluetoothEnhancements = {
          "monitor.bluez.properties" = {
            "bluez5.enable-sbc-xq" = true;
            "bluez5.enable-msbc" = true;
            "bluez5.enable-hw-volume" = true;
            "bluez5.roles" = ["hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag"];
          };
        };
      };
    };
  };

  hardware.enableAllFirmware = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    applications = {
      env = {
        PATH = "$(PATH):$(HOME)/.local/bin";
      };
      apps = [
        {
          name = "Steam";
          detached = [
            "setsid steam"
          ];
          exclude-global-prep-cmd = "false";
        }
      ];
    };
  };

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
      Port = 2222;
      PermitRootLogin = "no";
    };
    listenAddresses = [
      {
        addr = "192.168.1.138";
        port = 3333;
      }
    ];

    banner = "
                 ___====-_  _-====___
           _--^^^#####//      \\#####^^^--_
        _-^##########// (    ) \\##########^-_
       -############//  |\^^/|  \\############-
     _/############//   (@::@)   \\############\_
    /#############((     \\//     ))#############\
   -###############\\    (oo)    //###############-
  -#################\\  / VV \  //#################-
 -###################\\/      \//###################-
_#/|##########/\######(   /\   )######/\##########|\#_
|/ |#/\#/\#/\/  \#/\##\  |  |  /##/\#/  \/\#/\#/\#| \|
`  |/  V  V  `   V  \#\| |  | |/#/  V   '  V  V  \|  '
   `   `  `      `   / | |  | | \   '      '  '   '
                    (  | |  | |  )
                   __\ | |  | | /__
                  (vvv(VVV)(VVV)vvv)
	";
  };

  networking.interfaces.enp34s0.wakeOnLan.enable = true; # WoL Nixos

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      47984
      47989
      47990
      48010 # Sunshine
      3333 # SSH
      4040 # Apache NiFi
    ];
    allowedUDPPortRanges = [
      {
        from = 47998;
        to = 48000;
      }
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
