# .NET/C# Project Instructions
- Follow CLAUDE.md base instructions
- All C# conventions apply unless project files override

## Code Style
- Follow project: .editorconfig, .globalconfig, Directory.Build.props
- Naming: PascalCase (classes, methods, properties), camelCase (locals, parameters)
- Use modern C# features (pattern matching, records, null-coalescing, etc.)
- Prefer expression-bodied members when concise
- Explicit types over var when clarity matters

## Structure
- Follow project namespace structure
- One class per file (except nested/related types)
- Organize: usings → namespace → class
- Keep methods focused, extract when >20 lines

## .NET Patterns
- Use built-in DI container
- async/await by default for I/O
- IDisposable/using statements for resources
- Minimal API or controllers based on project style

## Error Handling
- Use exceptions for exceptional cases
- Result patterns for expected failures
- Validate inputs, fail fast
- Log errors, don't swallow

## Testing
- Match project test framework (xUnit/NUnit/MSTest)
- AAA pattern (Arrange, Act, Assert)
- Use FluentAssertions if present

## Documentation
- XML comments for public APIs only
- Context7 MCP for .NET docs when needed
