---
description: Create a commit
---

Create a commit.

The user may have made changes, so always check the latest status, staged diff, and unstaged diff before committing.

## Prohibited

- **Do not use `--amend` unless explicitly specified as an argument.** Always create a new commit by default.

## When arguments are provided

Arguments: $ARGUMENTS

### If the argument contains "amend"
Amend the previous commit using `--amend`.

### If the argument is "staged"
**Never stage any new changes.** Only commit changes that are already staged.

### For any other arguments
Stage and commit only changes related to the specified topic or feature.

**Important:** Unstage any already-staged files that are not related to the specified topic using `git restore --staged`.

### If no arguments are provided
Include all changes.
