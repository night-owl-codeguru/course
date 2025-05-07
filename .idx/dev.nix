# To learn more about how to use Nix to configure your environment
# see: https://firebase.google.com/docs/studio/customize-workspace
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-24.05"; # or "unstable"

  # Use https://search.nixos.org/packages to find packages
  packages = [
    # pkgs.python311
    # pkgs.python311Packages.pip
    # pkgs.nodejs_20
    # pkgs.nodePackages.nodemon
  ];

  # Sets environment variables in the workspace
  env = { };
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "vscodevim.vim"
    ];

    # Enable previews
    previews = { 
      enable = false;
      previews = {
        
      };
    };

    # Workspace lifecycle hooks
    workspace = {
      onCreate = {
      };
      onStart = {
        run-module-2 = "cd module_2 && flutter run -d web-server";
        run-module-3 = "cd module_3 && flutter run -d web-server";
        run-module-5-6 = "cd module_5_&_6 && flutter run -d web-server";
        run-module-7 = "cd module_7 && flutter run -d web-server";
        run-module_8-9-10 = "cd module_8_9_10 && flutter run -d web-server";
        run-module-11-12 = "cd module_11_12 && flutter run -d web-server";
        run-module-13 = "cd module_13 && flutter run -d web-server";
        run-module-14 = "cd module_14 && flutter run -d web-server";
      };
    };
  };
}
