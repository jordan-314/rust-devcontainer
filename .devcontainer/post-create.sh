#! /usr/bin/bash

RepoRoot="."
StdFileDir="${RepoRoot}/.devcontainer/std-files"

if [ -z $(which prek) ];
then
    prek self update
    echo -e "prek updated to $(prek --version)\n"
fi

cargo --version

cargo_init_cmd="cargo init -q"
if [ -z ${INIT_LIB} ];
then
    cargo_init_cmd="${cargo_init_cmd} --lib"
fi
# Create the desired cargo init.
# Upon failure i.e. crate already exists send bad output to dev/null
echo "$cargo_init_cmd" | bash 2> /dev/null

# Check if other YAML (YML) file extension exists. If not copy the std config
# into the pre-commit YAML (not YML) file, --update=none, serves not to overwrite
# any existsing config. 
if [ ! -f "${RepoRoot}/.pre-commit-config.yml" ];
then
    cp "${StdFileDir}/pre-commit.yaml" "${RepoRoot}/.pre-commit-config.yaml"
fi
prek auto-update --cooldown-days=31
prek install

# Copy basic gitignore if one doesn't exist.
cp --no-clobber "${StdFileDir}/gitignore" "${RepoRoot}/.gitignore"
