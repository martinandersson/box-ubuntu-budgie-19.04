# Changelog

All noteworthy changes to this project will be documented in this file.

The format is based on [Keep a Changelog][changelog-1].

Versioning adheres to [Semantic Versioning][changelog-2], i.e.
*Major.Minor.Patch*.

New box releases do not add additional software unless strictly necessary for
bug fixes and system stability. New releases are most likely a result of a new
version of the included VirtualBox Guest Additions, VMware Tools or a new Linux
kernel.

A version change that affects the "major" part of one of these software
components also bumps the "major" part of this box version. The same strategy is
applied for the "minor" and "patch" parts. The software versions of these
components are documented below.

[changelog-1]: http://keepachangelog.com/en/1.0.0/
[changelog-2]: http://semver.org/spec/v2.0.0.html

## [Unreleased][unreleased-1]

- Nothing, yet.

[unreleased-1]: https://github.com/martinanderssondotcom/box-ubuntu-budgie-19.04/compare/v1.0.1...HEAD

## [1.0.1][101-1] - 2019-05-27

### Improved

- [issue martinanderssondotcom/box-ubuntu-budgie-17-x64#3][101-2]

[101-1]: https://github.com/martinanderssondotcom/box-ubuntu-budgie-19.04/compare/v1.0.0...v1.0.1
[101-2]: https://github.com/martinanderssondotcom/box-ubuntu-budgie-17-x64/issues/3

## 1.0.0 - 2019-05-25

Initial release.

### Software

- Ubuntu version: `19.04`
- Budgie version: `10.5`
- Linux Kernel: `5.0.0-15-generic`
- VirtualBox Guest Additions: `6.0.8 r130520`
- VMware Tools: `10.3.10.10540 (build-12406962)`
- Built with Packer: `1.4.0`
- ..on host: `Windows Pro 10.0.17763 Build 17763`