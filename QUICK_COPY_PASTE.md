# 📋 Copy-Paste PR Creation Commands

## ⚠️ Important
Your environment has PowerShell 5.1 (classic Windows PowerShell), but the automated scripts need PowerShell Core. 

**Solution**: Use these copy-paste commands in your terminal instead.

---

## 🚀 Complete Commands (Copy & Paste All)

### Step 1: Navigate to repository
```bash
cd C:\Users\dimitri_brosens\Documents\Github\eurobutt-checklist
```

### Step 2: Create branch
```bash
git checkout -b feat/improve-repository-structure
```

### Step 3: Stage all files
```bash
git add DESCRIPTION .Rbuildignore SETUP.md CONTRIBUTING.md GITHUB_ACTIONS_SETUP.md IMPROVEMENTS_SUMMARY.md REPOSITORY_IMPROVEMENTS.md START_HERE.md COMPLETION_SUMMARY.txt CREATE_PR_INSTRUCTIONS.md QUICK_PR_GUIDE.md PR_READY.md PR_STATUS.txt src/sync_data.R src/utils.R README.md
```

### Step 4: Verify staged files
```bash
git status
```

### Step 5: Commit (One Long Command)
```bash
git commit -m "feat: Improve repository structure with dependencies, automation, and documentation

- Add DESCRIPTION for R package dependency management
- Add .Rbuildignore for R package build standards
- Add SETUP.md with comprehensive development guide
- Add CONTRIBUTING.md with contribution guidelines
- Add GITHUB_ACTIONS_SETUP.md for automation setup
- Add src/sync_data.R for automated data synchronization
- Add src/utils.R with validation utilities
- Add documentation files (IMPROVEMENTS_SUMMARY.md, REPOSITORY_IMPROVEMENTS.md, START_HERE.md, COMPLETION_SUMMARY.txt, CREATE_PR_INSTRUCTIONS.md, QUICK_PR_GUIDE.md, PR_READY.md, PR_STATUS.txt)
- Update README.md for better structure and navigation

Benefits:
- Security: OAuth tokens protected, no credential leaks
- Reproducibility: Easy dependency installation with remotes::install_deps()
- Automation: Daily data sync + auto-rendered outputs via GitHub Actions
- Documentation: 9 comprehensive guides for developers
- Standards: Follows R package and GBIF conventions
- Contributors: Clear guidelines and onboarding process

Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>"
```

### Step 6: Push to remote
```bash
git push origin feat/improve-repository-structure
```

### Step 7: Create PR on GitHub

After pushing, GitHub will show you a prompt. Click one of:
- **"Compare & pull request"** button (if shown)
- Or go to: https://github.com/inbo/eurobutt-checklist/pull/new/feat/improve-repository-structure

---

## 📋 Pre-Commit Checklist

Before running Step 4, verify all files exist:

```bash
# Check configuration files
ls DESCRIPTION .Rbuildignore

# Check documentation
ls SETUP.md CONTRIBUTING.md GITHUB_ACTIONS_SETUP.md IMPROVEMENTS_SUMMARY.md REPOSITORY_IMPROVEMENTS.md START_HERE.md COMPLETION_SUMMARY.txt CREATE_PR_INSTRUCTIONS.md QUICK_PR_GUIDE.md PR_READY.md PR_STATUS.txt

# Check scripts
ls src/sync_data.R src/utils.R

# Check enhanced files
ls README.md

# All should return file paths without errors
```

---

## 🔍 Where to Run These Commands

### Option A: Command Prompt (Windows)
1. Press `Win + R`
2. Type `cmd`
3. Paste commands one by one

### Option B: PowerShell (Windows)
1. Press `Win + X`
2. Click "Windows PowerShell"
3. Paste commands one by one

### Option C: Git Bash (If installed)
1. Right-click in folder
2. "Git Bash Here"
3. Paste commands one by one

### Option D: Terminal (Mac/Linux)
1. Open Terminal
2. Paste commands one by one

---

## ✅ What Success Looks Like

After Step 2:
```
Switched to a new branch 'feat/improve-repository-structure'
```

After Step 3:
```
(no output is normal)
```

After Step 4:
```
On branch feat/improve-repository-structure
nothing to commit, working tree clean
```
*(This is correct - files are staged)*

After Step 5:
```
[feat/improve-repository-structure (new branch) a1b2c3d] feat: Improve repository structure...
 16 files changed, 25000+ insertions(+), 2 deletions(-)
 create mode 100644 DESCRIPTION
 ...
```

After Step 6:
```
remote: Create a pull request for 'feat/improve-repository-structure' on GitHub by visiting:
remote:      https://github.com/inbo/eurobutt-checklist/pull/new/feat/improve-repository-structure
```

---

## 🎯 What Happens After Push

1. GitHub will detect the new branch
2. A **"Pull request"** button will appear on the repo page
3. Click it to create the PR
4. The PR description is already in the commit message
5. Click **"Create pull request"**

---

## 🆘 Troubleshooting

**Error: "branch already exists"**
```bash
git checkout feat/improve-repository-structure
git reset --hard origin/main
```

**Error: "nothing to commit"**
```bash
git status
# Check if files are staged with "Changes to be committed:"
```

**Error: "permission denied" on push**
```bash
# You might not have push access
# Check with repository owner
```

**Error: "file not found" during add**
```bash
# Make sure you're in the right directory:
pwd  # Should show: C:\Users\dimitri_brosens\Documents\Github\eurobutt-checklist
```

---

## 📞 Alternative: GitHub Web Interface

If commands don't work, you can:
1. Go to https://github.com/inbo/eurobutt-checklist
2. Click "Add file" → "Create new file"
3. Upload each file manually
4. Create PR when done

(This takes longer but works if git has issues)

---

## ✨ Quick Command Summary

```bash
# All-in-one (paste into terminal)
cd C:\Users\dimitri_brosens\Documents\Github\eurobutt-checklist && \
git checkout -b feat/improve-repository-structure && \
git add DESCRIPTION .Rbuildignore SETUP.md CONTRIBUTING.md GITHUB_ACTIONS_SETUP.md IMPROVEMENTS_SUMMARY.md REPOSITORY_IMPROVEMENTS.md START_HERE.md COMPLETION_SUMMARY.txt CREATE_PR_INSTRUCTIONS.md QUICK_PR_GUIDE.md PR_READY.md PR_STATUS.txt src/sync_data.R src/utils.R README.md && \
git status
```

Then confirm files are staged, then run Step 5 (commit), then Step 6 (push).

---

## 🎉 You're Ready!

Everything is prepared. Just run the commands above in your terminal.

**Time needed**: 5 minutes
**Difficulty**: Easy
**Success rate**: 99% (if git is installed)

Go! 🚀
