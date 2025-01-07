# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    /etc/nixos/hardware-configuration.nix
  ];

  # Overlays -- Custom Packages
  nixpkgs.overlays = [
    (self: super: {
      dwm = import ./packages/dwm.nix { inherit pkgs; };
      dwm-bar = import ./packages/dwm-bar.nix { inherit pkgs; };
    })
  ];

  # Enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Nix
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 20d";
    };
  };

  networking.hostName = "nixos"; # Define your hostname.
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
        animation = "matrix";
        # bigclock = "en";
        initial_info_text = "Welcome back";
        vi_mode = true;
        vi_default_mode = "insert";
      };
      defaultSession = "none+i3";
    };

    xserver = {
      xkb = {
        layout = "us";
        options = "ctrl:nocaps";
      };
      enable = true;
      windowManager.dwm = {
        enable = true;
        package = pkgs.dwm;
      };
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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hector = {
    isNormalUser = true;
    description = "hector";
    extraGroups = ["networkmanager" "wheel" "docker" "syncthing"];
    packages = with pkgs; [
      emacsPackages.vterm
      # (pkgs.callPackage ./builds/cmatrix.nix {})
      (todoist-electron.overrideAttrs (oldAttrs: {
        pname = "todoist";
        meta.mainProgram = "todoist";
      }))
      apacheHttpd

      isync # Mailbox Synchronizer
      notmuch # Mail Indexer
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
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
    brightnessctl
    unzip

    isync # Mailbox Synchronizer
    notmuch # Mail Indexer
    pass  # Command Line password  manager 
    gnupg # GPG
    
    #Services
    dwm-bar
    picom
    dunst

    # Theme
    gruvbox-dark-icons-gtk

    # Utils
    texliveFull # TeX Live Environment
    
    # Gui App
    pavucontrol
    flameshot
    alacritty
    firefox
    alejandra
    docker
    emacs
    peek
    keepassxc
    zathura
    networkmanagerapplet
    calibre
    discord
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
            "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag"];
          };
        };
      };
    };
  };

  services.blueman.enable = true; # bluetooth gui
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  services.syncthing = {
    enable = true;
    dataDir = "/home/hector/syncthing";
    openDefaultPorts = true;
    configDir = "/home/hector/.config/syncthing";
    guiAddress = "0.0.0.0:8384";
    user = "hector";
    group = "syncthing";
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      gui = {
        user = "user";
        password = "$2y$12$r5OyOjbLBGAijRtoQ31xBOf0OKtJKYi6Pgl4CU9UiDeGUM9CwBffy";
      };
      devices = {
        "mobile" = {id = "CD2YOGC-PL6IVWC-TW3RGC4-AW6UPPI-LZGFIWB-7DNCN6G-QL4RZBS-HD65RQQ";};
      };
    };
  };
  # Custom Systemd Services
  systemd.user.services = {
    wallpaper = {
      description = "Set wallpaper using feh";
      wantedBy=["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        Type = "oneshot";
        ExecStart=''${pkgs.feh}/bin/feh --bg-scale "/home/hector/Pictures/wallpaper.png"'';
      };
    };
    picom = {
      description = "Picom Compositor";
      wantedBy=["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        ExecStart=''${pkgs.picom}/bin/picom'';
        RestartSec = 3;
        Restart="always";
      };
    };
    dunst = {
      description = "Dunst: Notification server";
      wantedBy=["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        ExecStart=''${pkgs.dunst}/bin/dunst'';
        RestartSec = 3;
        Restart="always";
      };
    };
    mbsync = {
      description = "Mailbox synchronization service";
      after = ["graphical-session.target" "network-online.target"];
      wants = ["graphical-session.target" "network-online.target"];
      serviceConfig = {
        Type = "oneshot";
        ExecStart="${pkgs.isync}/bin/mbsync -a";
        ExecStartPost="${pkgs.notmuch}/bin/notmuch new";
      };
      wantedBy = ["graphical-session.target" "network-online.target"];
    };
    # dwm-bar = {
    #   description = "Custom DWM bar script";
    #   wantedBy=["graphical-session.target"];
    #   after = ["graphical-session.target"];
    #   serviceConfig = {
    #     Type = "simple";
    #     ExecStart="${pkgs.dwm-bar}/bin/dwm-bar";
    #     User = "hector";
    #     Restart = "always";
    #     Environment = "DISPLAY=:0";
    #     EnvironmentFile = "/home/hector/.Xauthority";
    #   };
    # };
  };

  services.emacs.enable = true;
  
  programs.gnupg = {
    agent = {
      enable = true;
      settings = {
        default-cache-ttl = 86400;
        max-cache-ttl = 86400;
      };
    };
    dirmngr.enable = true;
  };

  # Systemd User Timers
  systemd.user.timers = {
    mbsync = {
      description = "Synchronize mbsync";
      wantedBy = ["timers.target"];
      timerConfig = {
        OnBootSec = "2m";
        OnUnitActiveSec = "2m";
        Unit = "mbsync.service";
      };
    };
  };

  

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
