# Cockpit

[![Verify](https://github.com/roalcantara/cockpit/actions/workflows/verify.yml/badge.svg)](https://github.com/roalcantara/cockpit/actions/workflows/verify.yml)
[![Release](https://github.com/roalcantara/cockpit/actions/workflows/release.yml/badge.svg)](https://github.com/roalcantara/cockpit/actions/workflows/release.yml)

An opiopnated Dev Environment based on [Alpine linux][12]. Ready to Engage!

[![MIT license](https://img.shields.io/badge/License-MIT-brightgreen.svg)](./../LICENSE)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.0-4baaaa.svg)][2]
[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg)][5]
[![Editor Config](https://img.shields.io/badge/Editor%20Config-1.0.1-crimson.svg)][4]
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-yellow.svg)][3]
[![CheckStyle: Hadolint](https://img.shields.io/badge/check_style-hadolint-ee503e.svg)][11]
[![Semantic Release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)][17]

## Install

```sh
git clone https://github.com/roalcantara/cockpit.git
```

## Dependencies

- [git][6]
- [gitlint][7]
- [pre-commit][8]
- [docker][9]

## Configuration

Edit the file [`.env`][15] and fill it up properly.

## Usage

- To pull the image

  ```sh
  docker pull roalcantara/cockpit:ncc-1701
  ```

- To push the image to Package Registry

  ```sh
  docker push roalcantara/cockpit:ncc-1701
  ```

### [Dockerfile][13]

- To run an autoremovable container

  ```sh
  docker run -it --rm roalcantara/cockpit:ncc-1701
  ```

- To run an autoremovable container overriding the values set durying the build

  ```sh
  docker run -it --rm -e USERNAME=naruto -e TZ=Asia/Tokyo roalcantara/cockpit:ncc-1701
  ```

- To build the image

  ```sh
  docker build -t roalcantara/cockpit:ncc-1701 .
  ```

- To build the image overriding the build arguments

  ```sh
  docker build -t roalcantara/cockpit:ncc-1701 --build-arg USERNAME=naruto --build-arg TZ=Asia/Tokyo .
  ```

- To remove the image

  ```sh
  docker rmi -f roalcantara/cockpit:ncc-1701
  ```

### [Docker Compose][14]

- To run an autoremovable container

  ```sh
  docker compose run --rm ncc-1701
  ```

- To run an autoremovable container overriding the values set durying the build

  ```sh
  docker compose run --rm -e USERNAME=naruto -e TZ=Asia/Tokyo ncc-1701
  ```

- To build the image

  ```sh
  docker compose build
  ```

- To stop and remove containers, networks, images and volumes from the image

  ```sh
  docker compose down --remove-orphans --rmi --volumes
  ```

## Acknowledgements

- [Standard Readme][5]
- [Conventional Commits][7]
- [CST (Container Structure Tests): validate the structure of your container images][16]
- [Semantic Release][17]

## Contributing

- Bug reports and pull requests are welcome on [GitHub][0]
- Do follow [Editor Config][4] rules.
- Do follow [Git lint][7] rules.
- Do follow the [Contributor Covenant][2] code of conduct.

## License

The project is available as open source under the terms of the [MIT][1] [License](LICENSE)

[0]: https://github.com/roalcantara/Dockers
[1]: https://opensource.org/licenses/MIT "Open Source Initiative"
[2]: https://contributor-covenant.org "A Code of Conduct for Open Source Communities"
[3]: https://conventionalcommits.org "Conventional Commits"
[4]: https://editorconfig.org "EditorConfig"
[5]: https://github.com/RichardLitt/standard-readme "Standard Readme"
[6]: https://git-scm.com "Git"
[7]: https://jorisroovers.com/gitlint "git commit message linter"
[8]: https://pre-commit.com "A framework for managing and maintaining multi-language pre-commit hooks"
[9]: https://docker.com "Docker: An open platform for developing, shipping, and running applications."
[11]: https://github.com/hadolint/hadolint "Dockerfile linter"
[12]: https://alpinelinux.org/ "Alpine Linux: A security-oriented, lightweight Linux distribution based on musl libc and busybox"
[13]: https://docs.docker.com/engine/reference/builder "Dockerfile reference"
[14]: https://docs.docker.com/compose/compose-file "Docker Compose"
[15]: https://docs.docker.com/compose/compose-file/#env_file "Docker Compose: Env_file format"
[16]: https://github.com/GoogleContainerTools/container-structure-test "CST (Container Structure Tests): validate the structure of your container images"
[17]: https://semantic-release.gitbook.io/semantic-release "Semantic Release"
