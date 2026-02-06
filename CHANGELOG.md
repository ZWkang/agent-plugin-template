# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.1.0] - 2026-02-06

### Added
- **Project Structure**: Established standard Claude Code plugin directory layout (`skills/`, `agents/`, `hooks/`, `.claude-plugin/`).
- **Documentation**:
  - Comprehensive `README.md` in English with Quick Start and visual diagrams.
  - Full Chinese translation `README_zh-CN.md`.
  - Visual assets: Custom Banner SVG and Footer Wave SVG.
- **Manifests**:
  - Added `.claude-plugin/plugin.json` for plugin metadata and configuration.
  - Added `.claude-plugin/marketplace.json` template for distribution.
- **Components**:
  - `hooks/hooks.json`: Configuration for event handlers.
  - `hooks/session-start.ts`: Example SessionStart hook.
  - `skills/example-skill/SKILL.md`: Example skill structure.
  - `.mcp.json` & `.lsp.json`: Placeholders for connectivity configuration.

### Changed
- Refactored `skills/` directory to use the recommended `<skill-name>/SKILL.md` structure instead of flat files.
- Updated `package.json` with necessary scripts (`build`, `typecheck`, `prepare`).
