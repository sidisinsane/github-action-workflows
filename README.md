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

---

## After Publishing a Release

### Step 1: Pull the Latest Changes from the Remote

The first and most crucial step is to synchronize your local repository with the remote one. Since the CI/CD pipeline has pushed new commits (the release commit and tag), your local branch is now behind.

To pull the latest changes, use the following command:

```bash
git pull --rebase
```

  * **`--rebase`**: This option is highly recommended as it replays your local commits on top of the remote's latest commit, creating a clean, linear history and avoiding extra merge commits.

### Step 2: Resolve Any Conflicts (if they occur)

If you have made local changes that conflict with the new release commit, `git pull --rebase` will pause and ask you to resolve the conflicts.

  * **View conflicts**: Run `git status` to see a list of files with conflicts.
  * **Resolve conflicts**: Open the conflicting files and manually edit them. Look for the conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`) and choose the code you want to keep. After resolving each file, stage it with `git add <file-name>`.
  * **Continue the rebase**: Once all conflicts are resolved and staged, run `git rebase --continue` to finish the process.

### Step 3: Verify the Changes

After the pull and any conflict resolution are complete, your local branch should be up to date. Verify this by checking for the new release commit and tag.

  * **View the commit history**: Run `git log --oneline` to see the new release commit at the top of your history. It will likely have a message like "chore(release): 1.0.0 [skip ci]".
  * **Check the CHANGELOG.md file**: Open the `CHANGELOG.md` file in your editor. It should now contain a new section for the released version with a list of features and fixes.
  * **List the tags**: Run `git tag` to see all the tags in your local repository. The new version tag (e.g., `v1.0.0`) should now be present.

### Step 4: Continue Your Work

Your local branch is now in perfect sync with the remote. You are ready to continue your development workflow. You can create a new branch, start working on new features or bug fixes, and repeat the process for your next release.