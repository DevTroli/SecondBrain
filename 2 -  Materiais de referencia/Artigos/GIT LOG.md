The git log command does more than display commit history—it’s a powerful tool for filtering, formatting, and analyzing commits. Here are some advanced ways to make git log work harder for you:

### Filtering Commits
You can filter commits by author, date, file path, and more. This is useful when searching for specific changes in a large project:

```bash
# Filter by author
git log --author="John Doe"

# Filter by date range
git log --since="2 weeks ago" --until="yesterday"
Formatting Output
You can use git log formatting options to create custom views of your commit history:
```

#### Pretty format with custom details
```bash
git log --pretty=format:"%h %s by %an on %ar"
```

The output will show each commit hash, message, author, and relative date, making it easier to scan through history.

#### Visualizing with Graph View
The ```--graph``` option shows a tree-like view, which is especially helpful for understanding branch structures:

#### Show commit history as a graph
```bash
git log --oneline --graph --all
```

These advanced options transform git log into a versatile tool for project history analysis.](<# Filter by author
git log --author="John Doe"
