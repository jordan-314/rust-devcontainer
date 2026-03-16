# rust-devcontainer

A single rust devcontainer that is aimed to make starting with Rust really easy.

The repository:
- makes use of `prek` for pre-commit hooks.
- uses standard VSCode extensions (these may be updated as time goes on)
- mounts your `gitconfig` and `ssh` files for ease of use
- establishes a standard pre-commit and gitignore config on first devcontainer boot
- Inits a cargo crate on first devcontainer boot (change the `InitLib` `containerEnv` variable in the devcontainer config to init a library).

## Usage

Clone the repo or get it onto your local system however you wish. From there 

```bash
cp -r ./rust-devcontainer/.devcontainer ${myRepoPath}
```

## Contributing

Any sugestions are welcome, open an issue or pull request, whatever works for you! If you change anything ensure you test the usage of the devcontainer yourself.
