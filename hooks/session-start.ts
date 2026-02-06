#!/usr/bin/env npx ts-node
/**
 * Session start hook example
 * This hook runs when a new Claude Code session begins
 */

interface SessionContext {
  workingDirectory: string;
  gitBranch?: string;
  timestamp: Date;
}

async function main(): Promise<void> {
  const context: SessionContext = {
    workingDirectory: process.cwd(),
    gitBranch: await getGitBranch(),
    timestamp: new Date(),
  };

  console.log("Session started:", JSON.stringify(context, null, 2));

  // Example: Load project-specific configuration
  // await loadProjectConfig();

  // Example: Check for updates
  // await checkForUpdates();

  // Example: Initialize project state
  // await initializeState();
}

async function getGitBranch(): Promise<string | undefined> {
  try {
    const { execSync } = await import("child_process");
    return execSync("git branch --show-current", { encoding: "utf-8" }).trim();
  } catch {
    return undefined;
  }
}

main().catch(console.error);
