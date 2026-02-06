#!/bin/bash
# Pre-push hook - runs before git push
# Performs comprehensive checks before code reaches remote

set -e

BRANCH=$(git branch --show-current)
PROTECTED_BRANCHES="main master"

echo "Running pre-push checks on branch: $BRANCH"

# Prevent direct push to protected branches
for protected in $PROTECTED_BRANCHES; do
    if [ "$BRANCH" = "$protected" ]; then
        echo "Error: Direct push to $protected is not allowed"
        echo "Please create a feature branch and open a PR"
        exit 1
    fi
done

# Run tests
echo "Running tests..."
if [ -f "package.json" ]; then
    npm test 2>/dev/null || {
        echo "Tests failed. Push aborted."
        exit 1
    }
fi

# Run type check for TypeScript projects
if [ -f "tsconfig.json" ]; then
    echo "Running type check..."
    npm run typecheck 2>/dev/null || {
        echo "Type check failed. Push aborted."
        exit 1
    }
fi

# Check for TODO/FIXME in staged changes
echo "Checking for unresolved TODOs..."
if git diff origin/$BRANCH..HEAD --name-only | xargs grep -l "TODO\|FIXME" 2>/dev/null; then
    echo "Warning: Found TODO/FIXME comments in changes"
    # Uncomment to block push:
    # exit 1
fi

echo "All pre-push checks passed!"
exit 0
