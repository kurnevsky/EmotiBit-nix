{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "arduino-fwuploader";
  version = "2.2.0";

  src = fetchFromGitHub {
    owner = "arduino";
    repo = "arduino-fwuploader";
    rev = version;
    sha256 = "sha256-NoWir/qKZZF7RZXkvCAiBjuuoWQITtY7VXUTN0vRUhU=";
  };

  vendorSha256 = "sha256-RItlSOSN+NpmWdQYZYzbSmMAEkZCnzVXJa5zgIZ2f3s=";

  postPatch = ''
    rm -rf docsgen
  '';

  doCheck = false;
}
