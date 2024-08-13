#!/bin/bash

# Usage example:
# export SRC_DIRS="<<SRC_DIRS>>" # Space-separated source directory paths
# export INCLUDE_FILE_GLOB="<<INCLUDE_FILE_GLOB>>" # Include file glob pattern
# export EXCLUDE_REGEX="<<EXCLUDE_REGEX>>" # Exclude regex pattern
# ./script_name.sh # Assuming this code is saved as script_name.sh
#  SRC_DIRS="/opt/vei/chronos/admin-tool-api-server /opt/vei/chronos/admin-tool-test-automation/" INCLUDE_FILE_GLOB='*.yml'  EXCLUDE_REGEX='travis' ./run -a do_cat_files_for_ai

do_cat_files_for_ai() {
  # set -x
  # Check if SRC_DIRS and INCLUDE_FILE_GLOB are set
  if [ -z "${SRC_DIRS}" ] || [ -z "${INCLUDE_FILE_GLOB}" ]; then
    echo "Error: SRC_DIRS and INCLUDE_FILE_GLOB must be set."
    return 1
  fi

  # Use default empty EXCLUDE_REGEX if not set
  EXCLUDE_REGEX="${EXCLUDE_REGEX:-}"

  # Define the output log file path
  local OUTPUT_FILE=/home/ysg/Desktop/log.log
  # Remove existing log file if it exists
  [ -f "${OUTPUT_FILE}" ] && rm -f "${OUTPUT_FILE}"

  # Split SRC_DIRS into an array of directories
  IFS=' ' read -r -a dirs_array <<<"${SRC_DIRS}"

  # Process each directory
  for dir in "${dirs_array[@]}"; do
    echo "Processing directory: ${dir}"
    echo find "${dir}" -type f -name "${INCLUDE_FILE_GLOB}"
    while IFS= read -r file_path; do

      echo "working on file: ${file_path}"
      # Log START marker and file path
      echo "# START ::: file : ${file_path}" >>"${OUTPUT_FILE}"

      # Append file content to log
      cat "${file_path}" >>"${OUTPUT_FILE}"

      # Log STOP marker and file path
      echo "# STOP   ::: file : ${file_path}" >>"${OUTPUT_FILE}"
    done < <(find "${dir}" -type f -name "${INCLUDE_FILE_GLOB}")
    # | grep -vE "${EXCLUDE_REGEX}"
  done

  do_log "INFO generated log file: ${OUTPUT_FILE}"
  do_log "INFO Paste that to the AI prompt and enjoy the magic!"

  export EXIT_CODE="0"
}
