# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: let
  emacsTree = (pkgs.emacsPackagesFor pkgs.emacs).emacsWithPackages (
    epkgs:
      with epkgs; [
        (treesit-grammars.with-all-grammars)
      ]
  );
in {
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

  # Nix
  nix = {
    settings = {
      auto-optimise-store = true;

      # Enable flakes
      # experimental-features = ["nix-command" "flakes"];
    };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };
  };

  networking.hostName = "gaming"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

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
      ly.enable = true;
      ly.settings = {
        animation = "none";
        # bigclock = "en";
        initial_info_text = "Welcome back";
        vi_mode = true;
        vi_default_mode = "insert";
      };
      defaultSession = "none+i3";
    };

    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        options = "ctrl:nocaps";
      };
      videoDrivers = ["nvidia"];
      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          dmenu
          i3status
          i3lock
          i3blocks
        ];
      };
    };
  };

  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = ["networkmanager" "wheel" "docker"];
    packages = with pkgs; [
      (emacsTree.overrideAttrs (oldAttrs: {
        withNativeCompilation = true;
        withMailutils = true;
        withGTK3 = false;
        withTreeSitter = true;
        withImageMagick = true;
      }))
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # TODO: Remove

    # Cli Apps
    vim
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

    #Services
    picom
    dunst

    # Theme
    gruvbox-dark-icons-gtk

    # Utils
    zip
    texliveFull # TeX Live Environment

    # Gui App
    pavucontrol
    flameshot
    alacritty
    firefox
    alejandra
    docker
    emacsTree
    peek
    keepassxc
    zathura
    networkmanagerapplet
    calibre
    discord
    libreoffice

    ungoogled-chromium

    # Network utils
    # Download the deb from here: https://www.netacad.com/resources/lab-downloads?courseLang=en-US
    # Then add it to the store: nix-store --add-fixed sha256 CiscoPacketTracer822_amd64_signed.debx
    ciscoPacketTracer8
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
    (nerdfonts.override {fonts = ["Iosevka" "Meslo"];})
    iosevka
    meslo-lg
  ];

  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [
  ];

  virtualisation.docker.enable = true;

  virtualisation.vmware.host.enable = true;
  virtualisation.vmware.guest.enable = true;
  # virtualisation.virtualbox.guest.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # rtkit is optional but recommended
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

  # Custom Systemd Services
  systemd.user.services = {
    wallpaper = {
      description = "Set wallpaper using feh";
      wantedBy = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = ''${pkgs.feh}/bin/feh --bg-scale "/home/user/Pictures/wallpaper.png"'';
        Restart = "on-failure";
      };
    };
    picom = {
      enable = true;
      description = "Picom Compositor";
      wantedBy = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        ExecStart = ''${pkgs.picom}/bin/picom'';
        RestartSec = 3;
        Restart = "always";
      };
    };
    dunst = {
      description = "Dunst: Notification server";
      wantedBy = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        ExecStart = ''${pkgs.dunst}/bin/dunst'';
        RestartSec = 3;
        Restart = "always";
      };
    };
  };

  services.emacs = {
    enable = true;
    package = emacsTree;
  };

  services.openssh = {
    enable = false;
    settings = {
      PasswordAuthentication = true;
      Port = 2222;
      PermitRootLogin = "no";
      # AuthorizedKeys2File = "/home/hector/.ssh/authorized_keys";
    };
  };

  programs.steam.enable = true;

  # TODO DELETE THIS
  # networking = {
  #   interfaces.enp0s31f6 = {
  #     useDHCP = true;
  #   };
  # };
  # networking = {
  #   interfaces.enp0s31f6 = {
  #     ipv4.addresses = [{
  #       address = "192.168.1.13";
  #       prefixLength = 24;
  #     }];
  #   };
  # };
  # defaultGateway = {
  #   address = "192.168.218.1";
  #   interface = "enp0s31f6";
  # };
  # };
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
