{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "FirmwareUploader";
  version = "0.1.12";

  src = fetchFromGitHub {
    owner = "arduino";
    repo = "FirmwareUploader";
    rev = version;
    sha256 = "sha256-bFah1MTMhh3wYMgTfvGmtUL+oBm5abKsoFRdnn3fOYQ=";
  };

  vendorSha256 = "sha256-HL/ZpYYWSdyQJGCEgiyCF3qQEgeKWNk13kXqaG74P54=";
}
