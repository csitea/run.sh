#!/bin/bash
# -----------------------------------------------------------------------------
# Purpose:
#   Compresses the current working directory into a zip file, excluding specific directories.
# -----------------------------------------------------------------------------
do_zip_me() {

  # Check if 'zip' command is available
  if ! command -v zip &>/dev/null; then
    echo "zip command not found. Please install zip."
    exit 1
  fi

  local current_dir=$(basename $(pwd))   # Get the current directory name
  local parent_dir=$(dirname $(pwd))     # Get the parent directory path
  local zip_file="../${current_dir}.zip" # Define the zip file path

  # Remove any pre-existing zip file
  [[ -f $zip_file ]] && rm -v $zip_file

  # Zip everything except the .git, .terraform, .venv and node_modules dirs
  zip -r $zip_file . \
    -x '.git/*' \
    -x '*/.terraform/*' \
    -x '*/.venv/*' \
    -x '*/node_modules/*' \
    --symlinks
  rv=$?

  # Improved echo statement for unzipping
  echo -e "\n\nTo unzip run the following cmd:"
  echo -e "\n mkdir -p /tmp/${current_dir} && unzip -o ${parent_dir}/${current_dir}.zip -d /tmp/${current_dir} \n\n"

  export exit_code=$rv
}

# -----------------------------------------------------------------------------
# do_zip_me
# -----------------------------------------------------------------------------
# Usage:
#   source ./lib/bash/funcs/zip-me.func.sh
#   do_zip_me
#
# Dependencies:
#   zip - This function requires the 'zip' utility.
#
# Description:
#   This function creates a zip file named after the current working directory.
#   It excludes directories such as .git, .terraform, .venv, and node_modules
#   to minimize the size and scope of the zip file. The generated zip file is
#   stored in the parent directory of the current working directory.
#   If a zip file with the same name already exists, it is removed before
#   creating a new one. The function also echoes a command to unzip the
#   created file in a temporary directory for verification or other purposes.
#
# Environment Variables:
#   exit_code - The function exports this variable, which contains the exit code
#               of the zip operation. It can be used to check if the operation
#   was successful.
