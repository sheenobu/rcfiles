{ config, pkgs, ... }:
let
	prometheus = (pkgs.callPackage ./default.nix {
		buildGoPackage = pkgs.go16Packages.buildGoPackage;
	}).bin // { outputs = ["bin"]; };

	dataDir = "/var/lib/prometheus";
	ymlConfig = ./prometheus.yml;
in
{
	# TODO: service could be made much more generic

	environment.systemPackages = with pkgs; [
		prometheus
	];

	systemd.services.prometheus = {
		description = "Prometheus server";
		wantedBy = [ "multi-user.target" ];
		after = [ "network.target" ];

		serviceConfig = {
			ExecStart = "${prometheus}/bin/prometheus -config.file ${ymlConfig}";
			WorkingDirectory = dataDir;
			User = "prometheus";
		};
	};

	users.extraUsers.prometheus = {
		description = "Prometheus user";
		home = dataDir;
		createHome = true;
	};

}
