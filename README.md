## File structure

- dotfiles\_root
  - [package]
    - setup.rb
    - foo.bar
    - .dotfiles-that-will-autolink-to-home-directory

## Auto link dotfiles

All files starting with `.` are automatically symlinked to the home directory by `./src/link_dotfiles.rb` which is called in `./bootstrap`.

## setup.rb

You can create a file `[package]/setup.rb`. This will be called from `./bootstrap`. Using the `Utils` class, you can easily create a setup script.

## ./exec

If you want to run a single setup script, you can run `./exec xxx/setup.rb`.

## LazyVim

### Update

You can run `./update_lazyvim` to update /nvim/lazyvim subtree.

### Project root

Root marker is `.marksman.toml` and `.project_root`.

## Mac

以下の画面でMacのCtrl+Spaceを適当なキーに変更する。macismで使用するため無効化してはいけない。

1. システム環境設定
2. キーボード
3. キーボードショートカット
4. 入力ソース
5. 前の入力ソースを選択
