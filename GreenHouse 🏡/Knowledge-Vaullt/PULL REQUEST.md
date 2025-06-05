## What is a Pull Request?

A Pull Request (PR) is a way to propose changes to a code-base. Instead of directly changing the main code, you submit your changes for review before they are merged.

## Basic Flow of a Pull Request

1. **Create a Branch**
```bash
# Create and switch to a new branch
git checkout -b fix-login-bug
```

2. **Make Changes**
```bash
# Make your changes, commit them and then push your branch
git add .
git commit -m "Fix login validation"
git push origin fix-login-bug
```

3. **Create Pull Request**
- Go to repository on GitHub/GitLab
- Click "New Pull Request"
- Select your branch
- Fill description
- Submit

4. **Review Process**
- Other developers review code
- Automated tests run
- Changes requested or approved
- Merged when ready

## Review Process

1. **Reviewers check for:**
- Code correctness
- Test coverage
- Security issues
- Documentation

2. **Possible Outcomes:**
- Approved
- Changes requested
- Rejected

## When to Create a PR

Create a Pull Request when:
1. Fixing a bug
2. Adding a feature
3. Updating documentation
4. Improving existing code

Don't create a PR for:
1. Unfinished code
2. Multiple unrelated changes
3. Without testing first

**External Links:**
	
- [GitHub Pull Request Documentation](https://docs.github.com/en/pull-requests)
- [Git Branching Strategies](https://git-scm.com/book/en/v2/Git-Branching-Branching-Workflows)
- [Best practices for pull requests](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/getting-started/best-practices-for-pull-requests)
- [5 Tips to Make Your Pull Request Shine ✨](https://jtemporal.com/5-tips-to-make-your-pull-request-shine/)
- [How to manually link a pull request to a problem using the pull request sidebar](https://docs.github.com/pt/issues/tracking-your-work-with-issues/using-issues/linking-a-pull-request-to-an-issue#manually-linking-a-pull-request-to-an-issue-using-the-pull-request-sidebar)
