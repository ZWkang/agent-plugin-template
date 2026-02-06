#!/bin/bash
# Pre-commit hook example
# This hook runs before each git commit

set -e

echo "Running pre-commit checks..."

# Example: Check for debug statements
if git diff --cached --name-only | xargs grep -l "console.log\|debugger" 2>/dev/null; then
    echo "Warning: Found debug statements in staged files"
    # Uncomment to block commit:
    # exit 1
fi

# Example: Run linter on staged files
# npm run lint --staged

# Example: Run type check
# npm run typecheck

echo "Pre-commit checks passed"
exit 0
