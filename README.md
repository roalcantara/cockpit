# Cockpit

[![Verify](https://github.com/roalcantara/cockpit/actions/workflows/verify.yml/badge.svg)](https://github.com/roalcantara/cockpit/actions/workflows/verify.yml)
[![Release](https://github.com/roalcantara/cockpit/actions/workflows/release.yml/badge.svg)](https://github.com/roalcantara/cockpit/actions/workflows/release.yml)
[![Deployment](https://github.com/roalcantara/cockpit/actions/workflows/deployment.yml/badge.svg)](https://github.com/roalcantara/cockpit/actions/workflows/deployment.yml)
[![DockerHub](https://img.shields.io/docker/pulls/roalcantara/cockpit?style=flat&logo=docker)](https://hub.docker.com/r/roalcantara/cockpit)

An opiopnated Dev Environment based on [Alpine linux][12], [Git][6] and [ZSH][25]. Ready to Engage!

[![MIT license](https://img.shields.io/badge/License-MIT-brightgreen.svg)](LICENSE)
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

## Specs

- [x] [Alpine Linux][12]
  - [x] [Git][6]
    - [x] [Bat][18]
    - [x] [delta][19]
    - [x] [fd][20]
    - [x] [fzf][21]
    - [x] [git-credential-libsecret][22]
    - [x] [gnupg][23]
    - [x] [lazygit][24]
  - [x] [ZSH][25]
    - [x] [EXA][26]
    - [x] [jq][27]
    - [x] [RipGrep][28]
    - [x] [tree][29]
    - [x] [starship][30]
    - [x] [sheldon][31]
      - [x] [zsh-smartcache][32]
      - [x] [zsh-defer][33]
      - [x] [zsh-completions][34]
      - [x] [zsh-history-substring-search][35]
      - [x] [zsh-autosuggestions][36]
      - [x] [zsh-syntax-highlighting][37]
      - [x] [fzf-tab][38]

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
[18]: https://github.com/sharkdp/bat "bat: A cat(1) clone with wings."
[19]: https://github.com/dandavison/delta "A syntax-highlighting pager for git, diff, and grep output"
[20]: https://github.com/sharkdp/fd "fd: A simple, fast and user-friendly alternative to find."
[21]: https://github.com/junegunn/fzf "fzf: A command-line fuzzy finder"
[22]: https://git-scm.com "git-credential-libsecret"
[23]: https://gnupg.org "The GNU Privacy Guard"
[24]: https://github.com/jesseduffield/lazygit "simple terminal UI for git commands"
[25]: https://zsh.sourceforge.io/ "Zsh: A shell designed for interactive use, although it is also a powerful scripting language."
[26]: https://the.exa.website "exa: A modern replacement for ls."
[27]: https://stedolan.github.io/jq/ "jq: Lightweight and flexible command-line JSON processor"
[28]: https://github.com/BurntSushi/ripgrep "ripgrep: ripgrep recursively searches directories for a regex pattern"
[29]: http://mama.indstate.edu/users/ice/tree/ "tree: A recursive directory listing command that produces a depth indented listing of files."
[30]: https://starship.rs "The minimal, blazing-fast, and infinitely customizable prompt for any shell!"
[31]: https://sheldon.cli.rs "A fast, configurable, command-line tool to manage your shell plugins"
[32]: https://github.com/QuarticCat/zsh-smartcache "Cache command output to improve shell startup time"
[33]: https://github.com/romkatv/zsh-defer "A zsh plugin that defers the execution of commands until the shell is idle."
[34]: https://github.com/zsh-users/zsh-completions "Additional completion definitions for Zsh."
[35]: https://github.com/zsh-users/zsh-history-substring-search "Zsh port of Fish shell history search"
[36]: https://github.com/zsh-users/zsh-autosuggestions "Fish-like autosuggestions for zsh"
[37]: https://github.com/zsh-users/zsh-syntax-highlighting "Fish shell like syntax highlighting for Zsh"
[38]: https://github.com/Aloxaf/fzf-tab "Replace zsh's default completion selection menu with fzf!"
