#!/bin/bash
read -p "Enter project name: " project_name
parent_dir="attendance_tracker_$project_name"
mkdir -p "$parent_dir/Helpers"
mkdir -p "$parent_dir/reports"
touch "$parent_dir/attendance_checker.py"
touch "$parent_dir/Helpers/assets.csv"
touch "$parent_dir/Helpers/config.json"
touch "$parent_dir/reports/reports.log"
echo "Folders and files created sucessfully"

