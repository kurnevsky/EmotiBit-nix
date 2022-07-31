# EmotiBit for nix

This is a nix flake to get working setup for EmotiBit. It will compile everything from source code and won't use binaries from openframeworks and EmotiBit repositories.

It contains of:

- openframeworks 0.11.0, EmotiBit doesn't compile with later versions
- EmotiBitOscilloscope
- EmotiBitFirmwareInstaller, it has [a stub](https://github.com/EmotiBit/ofxEmotiBit/blob/32c2e83e67f452b1afff575932f392e19bdcadcc/EmotiBitFirmwareInstaller/src/ofApp.cpp#L48-L53) for linux but I figured it out only after made it compiling. Probably it can be useful later.
- bossa version 1.7, later versions [don't work](https://github.com/shumatech/BOSSA/issues/96).
- FirmwareUploader
- arduino-fwuploader, this is a newer version of FirmwareUploader but it requires an additional argument `Fully Qualified Board Name` and I have no idea what should be specified for Adafruit Feather, so I haven't tested it.
