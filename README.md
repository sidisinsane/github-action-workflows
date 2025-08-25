# Git Branching & File Ops Cheat Sheet

| Task                                      | Old way (`git checkout`)                  | New way (`git switch` / `git restore`)               |
|-------------------------------------------|-------------------------------------------|------------------------------------------------------|
| Switch to an existing branch              | `git checkout main`                       | `git switch main`                                    |
| Create a new branch and switch to it      | `git checkout -b feature/login`           | `git switch -c feature/login`                        |
| Switch to previous branch                 | `git checkout -`                          | `git switch -`                                       |
| Discard local changes to a file           | `git checkout -- file.txt`                | `git restore file.txt`                               |
| Restore a file from a specific commit     | `git checkout abc123 -- file.txt`         | `git restore --source=abc123 file.txt`               |
| Restore all files to last commit state    | `git checkout -- .`                       | `git restore .`                                      |
| Create a new branch from a commit         | `git checkout -b hotfix abc123`           | `git switch -c hotfix abc123`                        |
| Detach HEAD at a specific commit (no branch) | `git checkout abc123`                   | `git switch --detach abc123`                         |
| Cancel staged changes (unstage a file)    | `git reset HEAD file.txt` *(not checkout)*| `git restore --staged file.txt` (new, clearer syntax) |

> `git checkout` still works, but `git switch` (branches) and `git restore` (files) make commands clearer and less error-prone.
