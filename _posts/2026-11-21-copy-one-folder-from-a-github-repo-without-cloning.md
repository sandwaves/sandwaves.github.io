---
title: "Copy one folder from a GitHub repo without cloning"
date: 2026-11-21 20:30:00 +0300
categories: [Tools, Git]
tags: [git, github, degit, npx, cli] # TAG names should always be lowercase
---

Copy one folder from a GitHub repo into a local project, without cloning the whole repo or bringing its git history along.

## Command

[degit](https://github.com/Rich-Harris/degit) downloads a snapshot of a repo, or of one folder in it:

```powershell
npx degit <user>/<repo>/<path/to/folder> <local/destination>
```

## Example

Copy the `_sass` folder from the Chirpy theme repo into a local `_sass` folder:

```powershell
npx degit cotes2020/jekyll-theme-chirpy/_sass _sass
```

This downloads the files in `_sass` from the default branch, without any github history. 

To copy from a specific branch, tag, or commit, add `#<ref>` to the source:

```powershell
npx degit cotes2020/jekyll-theme-chirpy/_sass#master _sass
```

degit refuses to write into a destination folder that isn't empty. Add `--force` to overwrite it.
{: .prompt-warning }
