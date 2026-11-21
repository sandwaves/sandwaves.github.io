---
title: "Copy one folder from a GitHub repo without cloning"
date: 2026-11-21 20:30:00 +0300
categories: [Tools, Git]
tags: [git, github, degit, npx, cli] # TAG names should always be lowercase
---

Copy a folder from a GitHub repo into a local project, without cloning the repo or bringing its git history.

## Command

[degit](https://github.com/Rich-Harris/degit) downloads a snapshot of a repo, or of one folder in it. Run it with {% glossary npx %}, so You don't have to install anything:

```powershell
npx degit USER/REPO/PATH/TO/FOLDER DESTINATION
```

## Example

Copy the `_sass` folder from the Chirpy theme repo into a local `_sass` folder:

```powershell
npx degit cotes2020/jekyll-theme-chirpy/_sass _sass
```

This downloads the files in `_sass` from the {% glossary default branch %}, without any github history. 

 Add `#REF` to the sourceTo copy from a specific branch, tag, or commit (a {% glossary ref %}),:

```powershell
npx degit cotes2020/jekyll-theme-chirpy/_sass#master _sass
```

degit refuses to write into a destination folder that isn't empty. Add `--force` to overwrite it.
{: .prompt-warning }
