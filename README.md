# Claude Code Plugin Template

A comprehensive template for building [Claude Code](https://docs.claude.com/en/docs/claude-code/overview) plugins. This repository provides a standard structure for creating Skills, Agents, Hooks, and integrating MCP/LSP servers.

Reference documentation:
- [Plugin Reference](https://code.claude.com/docs/en/plugins-reference)
- [Plugin Marketplaces](https://code.claude.com/docs/en/plugin-marketplaces)

## Quick Start

### 1. Create your plugin
```bash
# Clone this template
git clone https://github.com/your-username/my-plugin.git
cd my-plugin

# Install dependencies (for TypeScript hooks/scripts)
npm install

# Make scripts executable
npm run prepare
```

### 2. Develop and Test
You can test your plugin without installing it by loading it directly in your current session:
```bash
claude --plugin-dir .
```
Or start the TUI with the plugin loaded:
```bash
claude --plugin-dir .
```

### 3. Verify
Run the validation command to check for configuration errors:
```bash
claude plugin validate
```

## Project Structure

This template follows the [Standard Plugin Layout](https://code.claude.com/docs/en/plugins-reference#plugin-directory-structure):

```text
my-plugin/
├── .claude-plugin/
│   ├── plugin.json          # Plugin manifest (metadata & config)
│   └── marketplace.json     # Marketplace definition (for distribution)
├── skills/                  # Skills (workflows & capabilities)
│   └── my-skill/
│       ├── SKILL.md         # Main skill definition
│       └── scripts/         # Skill-specific scripts
├── agents/                  # Subagent definitions
│   └── my-agent.md
├── hooks/                   # Event handlers
│   ├── hooks.json           # Hook configuration
│   └── session-start.ts     # Example hook script
├── commands/                # (Legacy) Simple slash commands
│   └── my-command.md
├── .mcp.json                # MCP Server configuration
├── .lsp.json                # LSP Server configuration
├── package.json             # Dependencies for scripts
└── README.md
```

## Configuration

### Plugin Manifest (`.claude-plugin/plugin.json`)
Defines metadata and component locations.
```json
{
  "name": "my-plugin",
  "version": "0.1.0",
  "description": "My awesome plugin",
  "skills": "./skills/",
  "agents": "./agents/",
  "hooks": "./hooks/hooks.json"
}
```

## Components

### 1. Skills (`skills/`)
Skills are specialized workflows. Create a directory in `skills/` with a `SKILL.md` file.
- **Location**: `skills/<skill-name>/SKILL.md`
- **Usage**: Claude invokes these automatically or via `/skill-name`.

### 2. Agents (`agents/`)
Specialized sub-agents for complex tasks.
- **Location**: `agents/<agent-name>.md`
- **Format**: Markdown with frontmatter.
```markdown
---
name: code-reviewer
description: specialized agent for reviewing PRs
---
Your system prompt here...
```

### 3. Hooks (`hooks/`)
Respond to Claude Code events (e.g., `SessionStart`, `PostToolUse`).
- **Config**: `hooks/hooks.json`
- **Important**: Use `${CLAUDE_PLUGIN_ROOT}` in command paths.

Example `hooks.json`:
```json
{
  "hooks": {
    "SessionStart": [
      {
        "type": "command",
        "command": "npx tsx ${CLAUDE_PLUGIN_ROOT}/hooks/session-start.ts"
      }
    ]
  }
}
```

### 4. MCP Servers (`.mcp.json`)
Connect external tools via the [Model Context Protocol](https://modelcontextprotocol.io).

### 5. LSP Servers (`.lsp.json`)
Add language intelligence (diagnostics, autocomplete) for specific file types.

## Development Rules

1. **Relative Paths**: All paths in `plugin.json` must be relative to the plugin root (start with `./`).
2. **Environment Variables**: Use `${CLAUDE_PLUGIN_ROOT}` to reference files in your scripts, as plugins are copied to a cache directory during execution.
3. **Dependencies**: If using `npm` dependencies in scripts, ensure they are installed or bundled.

## Distribution

To share your plugin:
1. Commit your changes to a public Git repository.
2. Update `.claude-plugin/marketplace.json` with your plugin details.
3. Users can install it via:
   ```bash
   claude plugin install <plugin-name>@<marketplace-url>
   ```

## Troubleshooting

- **Plugin not loading?** Run `claude --debug` to see loading logs.
- **Command not found?** Ensure scripts are executable (`chmod +x`).
- **Path errors?** Check if you are using `${CLAUDE_PLUGIN_ROOT}`.
