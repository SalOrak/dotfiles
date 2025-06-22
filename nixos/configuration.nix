# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}:
let 
	emacsTree = ((pkgs.emacsPackagesFor pkgs.emacs).emacsWithPackages (
	      epkgs: with epkgs; [
		(treesit-grammars.with-all-grammars)
	      ]
	    ));
in
{
  imports = [
    # Include the results of the hardware scan.
    /etc/nixos/hardware-configuration.nix
  ];

  # Overlays -- Custom Packages
  nixpkgs.overlays = [
    (self: super: {
      dwm = import ./packages/dwm.nix { inherit pkgs; };
      # dwm-bar = import ./packages/dwm-bar.nix { inherit pkgs; };
      dwm-blocks = import ./packages/dwm-blocks.nix { inherit pkgs; };
      # protonmail-desktop = import ./packages/protonmail-desktop.nix { inherit pkgs; };
      # grub-theme = import ./packages/grub-theme.nix { inherit pkgs; };
    })
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
      experimental-features = ["nix-command" "flakes"];
    };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
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

services.greetd = {
  enable = true;
  settings = rec {
    initial_session = {
      command = "${pkgs.sway}/bin/sway";
      user = "hector";
    };
    default_session = initial_session;
  };
};

programs.sway = {
	enable = true;
	wrapperFeatures.base= true; # Default is true
	wrapperFeatures.gtk = true;
	extraPackages = with pkgs; [
		waybar
		swaylock
		swayidle
		wl-clipboard
		wf-recorder
		grim
		slurp
		alacritty
		wmenu
	];
	extraSessionCommands = ''
		export SDL_VIDEODRIVER=wayland
		export QT_QPA_PLATFORM=wayland-egl
		export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
		export _JAVA_AWT_WM_NONREPARENTING=1
		
	'';
};

  programs.dconf.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    hector = {
      isNormalUser = true;
      description = "hector";
      extraGroups = ["networkmanager" "wheel" "docker" "syncthing" "wireshark" ];
      packages = with pkgs; [

      ];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

   # Wayland?
   greetd.wlgreet
   sway
   dbus
   wayland
   xdg-utils
   glib
   xdg-desktop-portal
   xdg-desktop-portal-wlr

    # Command Prompt
    starship
    android-tools
    
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
    brightnessctl
    unzip
    jq
    caligula # TUI Disk Burner
    ntfs3g # NTFS mount
    bat

    # PDF viewing and manipulation
    imagemagick
    
    isync # Mailbox Synchronizer
    notmuch # Mail Indexer
    pass  # Command Line password  manager 
    gnupg # GPG
    
    #Services
    # dwm-bar
    #dwm-blocks
    #picom
    dunst

    # Theme
    gruvbox-dark-icons-gtk

    # Utils
    zip
    texliveFull # TeX Live Environment

    # Video / Audio
    yt-dlp
    ffmpeg
    vlc
    blueman
    wireplumber
    pipewire
    bluez
    bluez-alsa
    bluez-tools
    
    # Gui App
    pavucontrol
    flameshot    
    alacritty
    firefox
    docker
    peek
    keepassxc
    zathura
    networkmanagerapplet
    calibre
    discord
    libreoffice
    qutebrowser
    (emacsTree.overrideAttrs (oldAttrs: {
      withNativeCompilation = true;
      withMailutils = true;
      withTreeSitter = true;
      withImageMagick = true;
      withGTK3 = false;
    }))
    
    # Network utils
    # Download the deb from here: https://www.netacad.com/resources/lab-downloads?courseLang=en-US
    # Then add it to the store: nix-store --add-fixed sha256 CiscoPacketTracer822_amd64_signed.debx
    # ciscoPacketTracer8
    nmap
    fping
    wireguard-tools
    openvpn
    
    # Programming
    gnumake
    gcc
    clang
    rustup
    clippy
    python3
    jdk17
    zig
    alejandra

    # Practice programming (I guess)
    exercism

    # Man pages
    man-pages
    man-pages-posix

    # Game Development
    # godot_4
    # aseprite # Animated sprite editor & pixel art tool
    
    # Wireshark
    wireshark

    # Qemu
    qemu
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
  	nerd-fonts.iosevka
  	nerd-fonts.meslo-lg
  ];

  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [
  ];

  virtualisation.docker.enable = true;

  virtualisation.vmware.host.enable = true;
  virtualisation.vmware.guest.enable = true;
  # virtualisation.virtualbox.host.enable = true;
  # virtualisation.virtualbox.host.enableExtensionPack = true;
  # virtualisation.virtualbox.guest.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.enableAllFirmware = true;
  services.blueman.enable = true; # bluetooth gui  
  
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
	    enable= true;
    };
  };


  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
    };
  };


  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  services.dbus.enable = true;

  xdg.portal = {
  	enable = true;
	wlr.enable = true;
	extraPortals = [pkgs.xdg-desktop-portal-wlr];
	config.common.default = "wlr";
  };

  services.syncthing = {
    enable = true;
    dataDir = "/home/hector/syncthing";
    key = "${/home/hector/syncthing/config/key.pem}";
    cert = "${/home/hector/syncthing/config/cert.pem}";
    openDefaultPorts = true;
    configDir = "/home/hector/.config/syncthing";
    guiAddress = "0.0.0.0:8384";
    user = "hector";
    group = "syncthing";
    overrideDevices = false;
    overrideFolders = false;
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
#    wallpaper = {
#    enable = false;
#      description = "Set wallpaper using feh";
#      wantedBy=["graphical-session.target"];
#      after = ["graphical-session.target"];
#      serviceConfig = {
#        Type = "oneshot";
#        ExecStart=''${pkgs.feh}/bin/feh --bg-scale "/home/hector/Pictures/wallpaper.jpg"'';
#        Restart="on-failure";
#      };
#    };
#    picom = {
#      enable = false;
#      description = "Picom Compositor";
#      wantedBy=["graphical-session.target"];
#      after = ["graphical-session.target"];
#      serviceConfig = {
#        ExecStart=''${pkgs.picom}/bin/picom'';
#        RestartSec = 3;
#        Restart="always";
#      };
#    };
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
#    mbsync = {
#      enable = false;
#      description = "Mailbox synchronization service";
#      after = ["graphical-session.target" "network-online.target"];
#      wants = ["graphical-session.target" "network-online.target"];
#      serviceConfig = {
#        Type = "oneshot";
#        ExecStart="${pkgs.isync}/bin/mbsync -a";
#        ExecStartPost="${pkgs.notmuch}/bin/notmuch new";
#      };
#      wantedBy = ["graphical-session.target" "network-online.target"];
#    };
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

#  services.emacs = {
#    enable = false;
#    package = emacsTree;
#  };
  
  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
    };
  };
  
  programs.gnupg = {
    agent = {
      enable = true;
      enableSSHSupport = true;
      settings = {
        default-cache-ttl = 86400;
        default-cache-ttl-ssh = 86400;
        max-cache-ttl = 2592000;
        max-cache-ttl-ssh = 2592000;
      };
    };
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

  services.tlp = {
    enable = true;
    settings = {
      # Thinkpad
      ## Operation ##
      TLP_ENABLE=1;
      TLP_WARN_LEVEL=3;
      TLP_DEFAULT_MODE="AC";


      ## Audio ##
      SOUND_POWER_SAVE_ON_AC=0;
      SOUND_POWER_SAVE_ON_BAT=1;
      SOUND_POWER_SAVE_CONTROLLER="Y";

      ## Battery Care ##
      # Battery charge level below which charging will begin
      # when connecting the charger
      START_CHARGE_THRESH_BAT0=75;
      # Battery charge level above which charging will stop
      # while the charger is connected
      STOP_CHARGE_THRESH_BAT0=80;

      ## Optimization
      # Change CPU energy performance to power
      CPU_ENERGY_PERF_POLICY_ON_AC="performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT="power";
      
      # Enable platform profile on low-power
      PLATFORM_PROFILE_ON_AC="performance";
      PLATFORM_PROFILE_ON_BAT="low-power";

      # Disable turbo boost
      CPU_BOOST_ON_AC=1;
      CPU_BOOST_ON_BAT=0;

      # Increase ABM level
      AMDGPU_ABM_LEVEL_ON_AC=0;
      AMDGPU_ABM_LEVEL_ON_BAT=3;

      # Enable runtime power management
      # Set to `on` because it disconnects the keyboard
      ## auto -- enabled (power down idle devices)
      ## on -- disabled (devices powered on permanently)
      RUNTIME_PM_ON_AC="on";
      RUNTIME_PM_ON_BAT="on";

      # Autosuspend USB
      USB_AUTOSUSPEND=0;
    };
  };

  # Systemd User Timers
#  systemd.user.timers = {
#    mbsync = {
#      description = "Synchronize mbsync";
#      wantedBy = ["timers.target"];
#      timerConfig = {
#        OnBootSec = "2m";
#        OnUnitActiveSec = "2m";
#        Unit = "mbsync.service";
#      };
#    };
#  };

  services.blocky = {
    enable = true;
    settings = {
      ports.dns = 53; # Port for incoming DNS Queries.
      upstreams.groups.default = [
      	"1.1.1.1"
      	"208.67.222.123"
      	"8.8.8.8"
      	"9.9.9.9"
      ];
      # For initially solving DoH/DoT Requests when no system Resolver is available.
      bootstrapDns = {
        upstream = "208.67.222.123";
      };
      #Enable blocking of certain domains.
      blocking = {
        denylists = {
          #Adblocking
          ads = ["https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"];
          #Another filter for blocking adult sites
          adult = [
            "https://blocklistproject.github.io/Lists/porn.txt"
            "https://blocklistproject.github.io/Lists/tiktok.txt"
            "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/porn-social-only/hosts"
            "https://raw.githubusercontent.com/Sinfonietta/hostfiles/master/pornography-hosts"
          ];
          #You can add additional categories
        };
        #Configure what block categories are used
        clientGroupsBlock = {
          default = [ "ads" "adult" ];
        };
      };
      caching = {
        minTime = "5m";
        maxTime = "30m";
        prefetching = true;
      };
    };
  };

  networking = {
    interfaces.enp0s31f6 = {
      ipv4.addresses = [{
        address = "192.168.218.159";
        prefixLength = 24;
      }];
    };
  };
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ 8080 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  networking.nameservers = ["127.0.0.1"];
  environment.etc = {
    "resolv.conf".text = "nameserver 127.0.0.1\n";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
