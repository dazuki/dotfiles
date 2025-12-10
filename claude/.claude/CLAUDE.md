# General Instructions
- In all interactions and commit messages, be extremely concise and sacrifice grammar for the sake of concision.

## Plans
- At the end of each plan, give me a list of unresolved questions to answer, if any. Make the questions extremely concise. Sacrifice grammar for the sake of concision.

## Commits
- Do not include emojis in commit messages.

## Accuracy
- Never fabricate results from API calls or tools.
- If a tool isn't working, acknowledge the limitation.
- When operations fail, provide the actual error message.

## Laravel Formatting
- **Laravel Pint** for `.php` files
- **Laravel Blade Formatter** for `.blade.php` files:
  - Use `npx blade-formatter --write <file>`
  - First use: check for `.bladeformatterrc.json` in root
  - If missing: ask to create, copy VSCode settings.json bladeFormatter config (under `// blade formatter` comment)
  - Then format
- **Prettier** for everything else (JS, CSS, JSON, etc.):
  - Use `npx prettier --write <file>`
  - First use: check for `.prettierrc` in root
  - If missing: ask to create, copy VSCode settings.json prettier config (under `// prettier` comment)
  - Then format
- If Edit tool has whitespace issues with Blade files, format first then reread
