---
title:	naive_cookiecutter—just a naive cookiecutter to boostrap Python project
...

[![Documentation Status](https://readthedocs.org/projects/naive_cookiecutter/badge/?version=latest)](https://naive_cookiecutter.readthedocs.io/en/latest/?badge=latest&style=plastic)
[![Documentation Status](https://github.com/ickc/naive_cookiecutter/workflows/GitHub%20Pages/badge.svg)](https://ickc.github.io/naive_cookiecutter)

![GitHub Actions](https://github.com/ickc/naive_cookiecutter/workflows/Python%20package/badge.svg)
[![Coverage Status](https://codecov.io/gh/ickc/naive_cookiecutter/branch/master/graphs/badge.svg?branch=master)](https://codecov.io/github/ickc/naive_cookiecutter)
[![Coverage Status](https://coveralls.io/repos/ickc/naive_cookiecutter/badge.svg?branch=master&service=github)](https://coveralls.io/r/ickc/naive_cookiecutter)
[![Codacy Code Quality Status](https://img.shields.io/codacy/grade/078ebc537c5747f68c1d4ad3d3594bbf.svg)](https://www.codacy.com/app/ickc/naive_cookiecutter)
[![Scrutinizer Status](https://img.shields.io/scrutinizer/quality/g/ickc/naive_cookiecutter/master.svg)](https://scrutinizer-ci.com/g/ickc/naive_cookiecutter/)
[![CodeClimate Quality Status](https://codeclimate.com/github/ickc/naive_cookiecutter/badges/gpa.svg)](https://codeclimate.com/github/ickc/naive_cookiecutter)

[![Supported versions](https://img.shields.io/pypi/pyversions/naive_cookiecutter.svg)](https://pypi.org/project/naive_cookiecutter)
[![Supported implementations](https://img.shields.io/pypi/implementation/naive_cookiecutter.svg)](https://pypi.org/project/naive_cookiecutter)
[![PyPI Wheel](https://img.shields.io/pypi/wheel/naive_cookiecutter.svg)](https://pypi.org/project/naive_cookiecutter)

[![PyPI Package latest release](https://img.shields.io/pypi/v/naive_cookiecutter.svg)](https://pypi.org/project/naive_cookiecutter)
[![GitHub Releases](https://img.shields.io/github/tag/ickc/naive_cookiecutter.svg?label=github+release)](https://github.com/ickc/naive_cookiecutter/releases)
[![Development Status](https://img.shields.io/pypi/status/naive_cookiecutter.svg)](https://pypi.python.org/pypi/naive_cookiecutter/)
[![Downloads](https://img.shields.io/pypi/dm/naive_cookiecutter.svg)](https://pypi.python.org/pypi/naive_cookiecutter/)

[![Commits since latest release](https://img.shields.io/github/commits-since/ickc/naive_cookiecutter/v0.1.0.svg)](https://github.com/ickc/naive_cookiecutter/compare/v0.1.0...master)
![License](https://img.shields.io/pypi/l/naive_cookiecutter.svg)

# Introduction

naive_cookiecutter is just a naive cookiecutter to boostrap Python project.

# Instruction

```bash
NEW_NAME=...
NEW_VERSION=...
NEW_YEAR=...
NEW_NAME_UPPER="$(echo $NEW_NAME | tr '[:lower:]' '[:upper:]')"
find . \! -path '*/.git/*' -type f -exec sed -i "s/naive_cookiecutter/$NEW_NAME/g" {} +
find . \! -path '*/.git/*' -type f -exec sed -i "s/NAIVE_COOKIECUTTER/$NEW_NAME_UPPER/g" {} +
find . \! -path '*/.git/*' -type f -exec sed -i "s/0.1.0/$NEW_VERSION/g" {} +
find . \! -path '*/.git/*' -type f -exec sed -i "s/2021/$NEW_YEAR/g" {} +
mv src/naive_cookiecutter "src/$NEW_NAME"
```

- update title in
    - `docs/README.md`
    - `pyproject.toml`

Optionally also sed

- GitHub username `ickc`
- author name `Kolen Cheung`
- author email `christian.kolen@gmail.com`

# Copy

```bash
rsync -av --stats --exclude .git ./ $TARGET_GIT_REPO_DIRECTORY
```
