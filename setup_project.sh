#!/bin/bash

# Ask for project name
read -p "Enter project name: " project_name
parent_dir="attendance_tracker_$project_name"

# Create directories
mkdir -p "$parent_dir/Helpers"
mkdir -p "$parent_dir/reports"

# Create files
touch "$parent_dir/attendance_checker.py"
touch "$parent_dir/Helpers/assets.csv"
touch "$parent_dir/Helpers/config.json"
touch "$parent_dir/reports/reports.log"

# Confirm creation
echo "Folders and files created successfully"

# Config file path
config_file="$parent_dir/Helpers/config.json"

trap "
echo 'Script interrupted! Archiving project...'
tar -czf \"${parent_dir}_archive.tar.gz\" \"$parent_dir\"
rm -rf \"$parent_dir\"
echo 'Project archived as ${parent_dir}_archive.tar.gz'
exit
" SIGINT

# Ask for thresholds
read -p "warning level set [default=75]: " warning
warning=${warning:-75}

read -p "failure level set [default=50]: " failure
failure=${failure:-50}

# Update config.json using sed
echo "{ \"warning\": $warning, \"failure\": $failure }" > "$config_file"
sed -i "s/\"warning\": [0-9]*/\"warning\": $warning/" "$config_file"
sed -i "s/\"failure\": [0-9]*/\"failure\": $failure/" "$config_file"

if python3 --version > /dev/null 2>&1
then
 echo "Health Check just Passed: Python3 is installed."
else
 echo "Health Check Warning: Python3 is not installed."
fi

