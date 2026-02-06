---
name: deploy
description: Deploy the application to specified environment
---

# /deploy Command

Deploy the application to a specified environment with safety checks.

## Usage

```
/deploy [environment]
```

## Environments

| Environment | Description |
|-------------|-------------|
| `dev` | Development environment (default) |
| `staging` | Staging/QA environment |
| `prod` | Production environment (requires confirmation) |

## Process

1. **Validate environment** - Check environment name is valid
2. **Run checks** - Execute pre-deployment verification
   - All tests pass
   - No uncommitted changes
   - Branch is up to date
3. **Confirm** - For production, require explicit confirmation
4. **Deploy** - Execute deployment script
5. **Verify** - Confirm deployment succeeded

## Safety Checks

Before deploying to production:
- [ ] All tests passing
- [ ] Code reviewed and approved
- [ ] No pending migrations
- [ ] Rollback plan documented

## Example

```bash
# Deploy to development
/deploy dev

# Deploy to production (will prompt for confirmation)
/deploy prod
```
