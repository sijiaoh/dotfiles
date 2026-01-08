# CLAUDE.md

## Rules

- Think in English, output in Japanese.
- 「claudeの設定ファイル」は `./claude` ディレクトリを指す（`./.claude` ではない）。

## Overview

sijiaohの個人dotfilesリポジトリ。macOSとLinux間で一貫した開発環境を維持することが目的。

**ターゲット:** macOS (ARM64), Linux/Ubuntu (x86_64, ARM64)

## Quick Start

```bash
./bootstrap              # 全パッケージをインストール
./bootstrap zsh git nvim # 特定パッケージのみ
./bootstrap -I zsh       # パッケージマネージャ初期化をスキップ
```

## Project Structure

```
.dotfiles/
├── main.go        # パッケージ登録（setupFuncs配列）
├── bootstrap      # エントリーポイント
├── utils/         # ユーティリティ（必ず使用すること）
└── [package]/     # 各ツールのディレクトリ
    ├── setup.go   # Setup()関数
    └── *.zsh      # シェル統合（zshrc.zshからsource）
```

## Adding a New Package

1. `my_tool/setup.go`を作成
2. `main.go`にimportと`setupFuncs`登録を追加
3. `./bin/build`でリビルド

## Key Conventions

### utilsパッケージを使用すること

直接コマンドを書かず、`utils/`の関数を使用する。主要パターン:

```go
// パス展開: ~/ → $HOME, ./ → ~/.dotfiles
utils.CreateSymlink("./my_tool/config", "~/.config/my-tool")

// クロスプラットフォームインストール
utils.AutoInstall("pkg")  // macOS→brew, Linux→apt

// プラットフォーム分岐
if utils.IsMac() {
    utils.BrewCaskInstall("app")
} else if utils.IsLinux() {
    if utils.IsAmd64() {
        utils.DownloadFile("https://.../linux-x64", "~/bin/app")
    }
}

// GitCloneはExpandPathを呼ばないので手動展開
dest := utils.ExpandPath("~/.my-repo")
utils.GitClone("https://...", dest, nil)
```

### パッケージ名が異なる場合は個別関数

```go
utils.BrewInstall("fd")
utils.AptInstall("fd-find")
```

### エラーハンドリング

- Go: `panic()`（fail-fast）
- Shell: `set -eu`

## Build

```bash
./bin/build  # darwin-arm64, linux-x86_64, linux-arm64
```
