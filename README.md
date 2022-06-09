# Dotfiles

Require brew.

## File structure

- [package]
  - setup.lua
  - foo.bar

## setup.lua example

```lua
require "./src/utils"

CreateSymlink("foo.bar", "~/.foo")
```
