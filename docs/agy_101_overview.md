# Antigravity (AGY) 101 Overview & Installation Guide

Welcome to **Antigravity (AGY) 101**! This guide covers what Antigravity is, how an **agent harness** differs from a raw frontier model, the different surface flavors of AGY (Desktop 2.0, CLI, VS Code IDE extension), and step-by-step instructions to install and configure each variant for your hackathon workspace.

---

## 💡 1. What is Antigravity (AGY)?

**Antigravity (AGY)** is Google’s AI-first development platform. Rather than acting as a simple text chatbot, AGY operates as an **agentic pair programmer** that understands your codebase, creates structured implementation plans, executes terminal commands, runs background tasks, inspects compiler logs, and verifies its own work.

```
+-----------------------------------------------------------------------------------+
|                            ANTIGRAVITY (AGY) PLATFORM                             |
|                                                                                   |
|  +---------------------+   +---------------------+   +--------------------------+ |
|  |    User Interface   |   |   Agentic Harness   |   |  Frontier Model Engine   | |
|  | (2.0 App/IDE/CLI)  | <-> |  (Tools/Plan/Exec)  | <-> |  (Gemini 1.5/3.6/Pro)   | |
|  +---------------------+   +---------------------+   +--------------------------+ |
+-----------------------------------------------------------------------------------+
```

---

## 🧠 2. Harness vs. Frontier Model: What's the Difference?

Understanding the distinction between an **LLM / Frontier Model** and an **Agent Harness** is key to getting the most out of AGY during the hackathon:

| Feature | Raw Frontier Model (LLM) | AGY Agent Harness |
| :--- | :--- | :--- |
| **Primary Function** | Text in $\rightarrow$ Text out prediction. | End-to-end task execution & code generation. |
| **Environment Interaction** | Cannot run shell commands, edit files, or execute tests. | Executes shell commands, edits project files, and runs test suites directly. |
| **Planning & Autonomy** | Generates static code snippets for manual copy-pasting. | Creates interactive `implementation_plan.md` artifacts, breaks down tasks, and self-corrects on errors. |
| **Context & Workspaces** | Limited to prompt window size; requires manual code uploads. | Reads entire directory structures, git status, compiler outputs, and custom project rules. |
| **Tool Integration** | No built-in tool execution. | Native support for MCP (Model Context Protocol), subagents, custom skills, and sidecars. |

> 💡 **In short**: The *Frontier Model* is the brain (reasoning & language), while the *Agent Harness* (AGY) provides hands, eyes, tools, and workspace agency to act on the code directly.

---

## 🖥️ 3. The 3 Flavors (Surfaces) of AGY

AGY is available in three distinct surfaces depending on your preferred workflow:

```
                  +-----------------------------------+
                  |  Antigravity (AGY) Capabilities  |
                  +-----------------------------------+
                                    |
        +---------------------------+---------------------------+
        |                           |                           |
        v                           v                           v
+------------------+    +-----------------------+    +-------------------+
| 1. AGY 2.0 App   |    | 2. VS Code Extension  |    | 3. AGY CLI (`agy`)|
| (Desktop Canvas) |    |   (Inline / Sidebar)  |    |  (Terminal / TUI) |
+------------------+    +-----------------------+    +-------------------+
```

### Flavor 1: Antigravity 2.0 (Desktop App)
- **Best for**: Non-technical users, architects, and developers who prefer a visual workspace with parallel subagents, artifacts pane, and background task management.
- **Key Features**:
  - Full Chat Canvas with `@` mentions, slash commands (`/grill-me`, `/goal`), and image/file drop.
  - Auxiliary side panel for real-time artifact previews, terminal outputs, and file diffs.
  - Multi-workspace project management.

### Flavor 2: Antigravity IDE / VS Code Extension
- **Best for**: Software engineers and developers who want agentic capabilities natively integrated into VS Code.
- **Key Features**:
  - **Inline Command (`⌘+I` / `Ctrl+I`)**: Highlight code for instant refactoring, docstring generation, or targeted edits.
  - **Antigravity Tab**: Predictive autocomplete, supercomplete diffs, and tab-to-import navigation.
  - **Sidebar Chat & Code Lenses**: Run agent commands directly above classes/functions in your editor.

### Flavor 3: Antigravity CLI (`agy`)
- **Best for**: Command-line power users, remote SSH environments, and fast terminal automation.
- **Key Features**:
  - Lightweight terminal UI (TUI) launched directly in any shell via `agy`.
  - Full access to slash commands, subagents, and background script executions.
  - Scriptable via command line flags and settings.

---

## 🛠️ 4. Installation & Setup Guide

### Prerequisites
- Operating System: macOS, Linux, or Windows (WSL2 recommended).
- Git installed on your system.
- Access credentials / Application Default Credentials (ADC) for Google Cloud / Vertex AI (if querying enterprise BigQuery).

---

### Step-by-Step Installation

#### 1. Installing AGY CLI (`agy`)
To install the terminal interface globally:

```bash
# Download and install the agy CLI binary
curl -fsSL https://antigravity.google/install.sh | bash

# Verify installation
agy --version

# Authenticate agy
agy auth login
```

To launch AGY CLI in any project directory:
```bash
cd /path/to/your/hackathon-project
agy
```

---

#### 2. Installing Antigravity 2.0 (Desktop Application)
1. Visit the official download portal: `https://antigravity.google/download` (or use internal Google distribution channel).
2. Download the installer for your OS (`.dmg` for macOS, `.deb`/`.AppImage` for Linux, `.exe` for Windows).
3. Run the installer and launch **Antigravity 2.0**.
4. Log in with your Google account / corporate SSO.
5. Click **Open Project** and select your hackathon repository folder.

---

#### 3. Installing Antigravity VS Code Extension / IDE
If using VS Code or Cursor:
1. Open **VS Code**.
2. Go to the Extensions panel (`Ctrl+Shift+X` / `⌘+Shift+X`).
3. Search for **Antigravity** (or install the `.vsix` extension package).
4. Click **Install**.
5. Press `Ctrl+Shift+P` / `⌘+Shift+P`, type `Antigravity: Sign In`, and complete authentication.
6. Open your project workspace.

---

## 🚀 5. First 5 Minutes: Your First AGY Workflow

Once installed, try this initial test prompt in any AGY flavor:

```text
AGY, introduce yourself! Inspect the current workspace directory, list any files present, and help me create a plan to build my hackathon project.
```

1. Watch AGY inspect your files automatically.
2. Review the generated `implementation_plan.md`.
3. Click **Proceed** to watch AGY build, edit, and test your code!
