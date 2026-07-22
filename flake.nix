{
  description = "My project dev environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs =
    { self, nixpkgs }:
    {
      devShells.x86_64-linux.default =
        let
          pkgs = import nixpkgs { system = "x86_64-linux"; };
        in
        pkgs.mkShell {
          packages = with pkgs; [
            pkg-config
            racket
            gnumake
          ];
          shellHook = ''
            raco pkg install --auto racket-langserver
            raco pkg install --auto fmt
            export CS2_CONFIG_DIR=$HOME/.local/share/steamgames/steamapps/common/Counter-Strike\ Global\ Offensive/game/csgo/cfg
          '';
        };
    };
}
