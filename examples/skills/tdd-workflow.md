---
name: tdd-workflow
description: Test-Driven Development workflow with red-green-refactor cycle
---

# TDD Workflow

## Overview

A structured approach to Test-Driven Development following the red-green-refactor cycle.

## When to Use

- Before implementing any new feature
- When fixing bugs (write failing test first)
- When refactoring existing code

## The Cycle

### 1. Red - Write Failing Test

```
Write a test that describes the expected behavior.
Run the test - it should FAIL.
```

**Checklist:**
- [ ] Test describes ONE specific behavior
- [ ] Test name clearly states what is being tested
- [ ] Test fails for the right reason

### 2. Green - Make It Pass

```
Write the MINIMUM code to make the test pass.
No extra features, no premature optimization.
```

**Checklist:**
- [ ] Test now passes
- [ ] No unrelated changes made
- [ ] Code is functional (not necessarily clean)

### 3. Refactor - Clean Up

```
Improve the code while keeping tests green.
Remove duplication, improve naming, simplify.
```

**Checklist:**
- [ ] All tests still pass
- [ ] Code is readable
- [ ] No duplication
- [ ] Good naming

## Example

```typescript
// 1. RED - Write failing test
test('add returns sum of two numbers', () => {
  expect(add(2, 3)).toBe(5);
});

// 2. GREEN - Minimal implementation
function add(a: number, b: number): number {
  return a + b;
}

// 3. REFACTOR - (already clean in this case)
```

## Tips

- Keep cycles short (minutes, not hours)
- One assertion per test when possible
- Test behavior, not implementation
