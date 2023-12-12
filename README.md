# khulnasoft-lab/codebase-setup

[![Test](https://github.com/khulnasoft-lab/codebase-setup/workflows/Test/badge.svg)](https://github.com/khulnasoft-lab/codebase-setup/actions?query=workflow%3ATest)
[![codebase](https://github.com/khulnasoft-lab/codebase-setup/workflows/codebase/badge.svg)](https://github.com/khulnasoft-lab/codebase-setup/actions?query=workflow%3Acodebase)
[![depup](https://github.com/khulnasoft-lab/codebase-setup/workflows/depup/badge.svg)](https://github.com/khulnasoft-lab/codebase-setup/actions?query=workflow%3Adepup)
[![release](https://github.com/khulnasoft-lab/codebase-setup/workflows/release/badge.svg)](https://github.com/khulnasoft-lab/codebase-setup/actions?query=workflow%3Arelease)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/khulnasoft-lab/codebase-setup?logo=github&sort=semver)](https://github.com/khulnasoft-lab/codebase-setup/releases)
[![action-bumpr supported](https://img.shields.io/badge/bumpr-supported-ff69b4?logo=github&link=https://github.com/haya14busa/action-bumpr)](https://github.com/haya14busa/action-bumpr)

This action installs :codebase: [codebase](https://github.com/khulnasoft/codebase).

## Input
```yaml
inputs:
  codebase_version:
    description: 'codebase version. [latest,nightly,vX.Y.Z]'
    default: 'latest'
```

## Usage

### Latest
```yaml
steps:
  - uses: khulnasoft-lab/codebase-setup@v1
  - run: codebase -version
```

### Specify codebase version
```yaml
steps:
  - uses: khulnasoft-lab/codebase-setup@v1
    with:
      codebase_version: v0.15.0
  - run: codebase -version
```

### Nightly
```yaml
steps:
  - uses: khulnasoft-lab/codebase-setup@v1
    with:
      codebase_version: nightly
  - run: codebase -version
```
