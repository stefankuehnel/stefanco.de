# stefanco.de

[![CI](../../actions/workflows/ci.yaml/badge.svg)](../../actions/workflows/ci.yaml)

My portfolio build with [Zola](https://getzola.org).

## Get Started

To get started with the project, follow these steps:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/stefankuehnel/stefanco.de.git
   cd stefanco.de
   ```

2. **Run the development server:**

   ```bash
   task dev
   ```

3. **Open your browser:**

   Navigate to `http://localhost:1111` to see the portfolio in action.

## Development

This project uses [Task](https://taskfile.dev) as a task runner.

### Available Tasks

```bash
# Run default tasks (build and deploy)
task

# Format code
task format

# Build the project
task build

# Deploy the project
task deploy

# Clean build artifacts
task clean
```

## Documentation

Below you will find a list of documentation for tools used in this project.

- **Nix**: Nix Package Manager - [Docs](https://wiki.nixos.org/wiki/Nix)
- **Nix Flakes**: An Experimental Feature for Managing Dependencies of Nix Projects - [Docs](https://wiki.nixos.org/wiki/Flakes)
- **GitHub Actions**: Automation and Execution of Software Development Workflows - [Docs](https://docs.github.com/en/actions)
- **Task**: A Task Runner for Automation - [Docs](https://taskfile.dev/)
- **Zola**: A Static Site Generator - [Docs](https://getzola.org/documentation/)

## Found a Bug?

Thank you for your message! Please fill out a [bug report](../../issues/new?assignees=&labels=&template=bug_report.md&title=).

## License

This project is licensed under the [GNU General Public License](https://www.gnu.org/licenses/gpl-3.0.txt).
