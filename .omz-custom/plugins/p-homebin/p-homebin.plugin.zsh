#!/usr/bin/env zsh
#
# Define home bin path
home_bin="$HOME/bin"
# Define home .local bin path
home_local_bin="$HOME/.local/bin"


# Escape special characters for use in regex
escaped_home_bin=${home_bin//\//\\/}
escaped_home_local_bin=${home_local_bin//\//\\/}

# Split PATH into an array
path_components=(${(s/:/)PATH})

# Check if exact home_bin is in the PATH before modifying
if [[ " ${path_components[@]} " =~ " ${escaped_home_bin} " ]]; then
  # Remove exact home_bin path if it exists (using array filtering)
  path_components=(${path_components:#$home_bin})

  # Rebuild the PATH without home_bin
  export PATH="${(j/:/)path_components}"
fi
# Check if exact home_local_bin is in the PATH before modifying
if [[ " ${path_components[@]} " =~ " ${escaped_home_local_bin} " ]]; then
  # Remove exact home_local_bin path if it exists (using array filtering)
  path_components=(${path_components:#$home_local_bin})

  # Rebuild the PATH without home_local_bin
  export PATH="${(j/:/)path_components}"
fi

# Prepend home_bin and home_local_bin to PATH
export PATH="${home_bin}:${home_local_bin}:${PATH}"
