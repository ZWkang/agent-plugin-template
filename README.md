# Claude Plugin Template

A comprehensive template for building Claude Code plugins with skills, hooks, commands, and agents.

## Quick Start

```bash
# Clone this template
git clone https://github.com/zwkang/claude-plugin-template.git my-plugin
cd my-plugin

# Install dependencies (for TypeScript hooks)
npm install

# Make scripts executable
npm run prepare
```

## Structure

```
├── skills/          # Workflow definitions (Markdown)
├── hooks/           # Event-triggered scripts (Shell/TypeScript)
├── commands/        # Custom slash commands (Markdown)
├── agents/          # Subagent definitions (Markdown)
├── examples/        # Advanced examples
└── scripts/         # Build utilities
```

## Components

### Skills

Define reusable workflows in `skills/*.md`:

```markdown
---
name: my-skill
description: Brief description for discovery
---

# My Skill

## Process
1. Step one
2. Step two
```

### Hooks

Event-triggered scripts in `hooks/`:

| Hook | Trigger |
|------|---------|
| `pre-commit.sh` | Before git commit |
| `session-start.ts` | Session begins |

### Commands

Custom slash commands in `commands/*.md`:

```markdown
---
name: mycommand
description: What this command does
---

# /mycommand

Instructions for the command...
```

### Agents

Subagent definitions in `agents/*.md`:

```markdown
---
name: my-agent
description: Agent purpose
tools:
  - Read
  - Glob
---

# My Agent

## Capabilities
...
```

## Development

```bash
# Build TypeScript
npm run build

# Type check
npm run typecheck
```

## License

MIT
