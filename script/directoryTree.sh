#!/bin/bash

# Function to generate tree structure
print_tree() {
    local dir="$1"
    local prefix="$2"
    local first_entry=true

    # Get all items in directory, sorted alphabetically
    local items=($(ls -A "$dir"))
    local total=${#items[@]}
    local count=0

    for item in "${items[@]}"; do
        # Skip hidden files if not the .env file
        if [[ "$item" =~ ^\. && "$item" != ".env" ]]; then
            continue
        fi  # Fixed the syntax error here (changed '}' to 'fi')

        ((count++))
        local new_prefix="$prefix"
        local is_last=$([[ $count -eq $total ]] && echo true || echo false)
        
        if $first_entry; then
            first_entry=false
        fi

        # Determine the connector symbol
        if $is_last; then
            echo "${prefix}└── $item"
            new_prefix="${prefix}    "
        else
            echo "${prefix}├── $item"
            new_prefix="${prefix}│   "
        fi

        # Recursively process directories
        if [ -d "$dir/$item" ]; then
            print_tree "$dir/$item" "$new_prefix"
        fi
    done
}

# Main script
folder_path="$1"

# Check if folder path is provided
if [ -z "$folder_path" ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

# Check if the folder exists
if [ ! -d "$folder_path" ]; then
    echo "Error: Directory '$folder_path' does not exist."
    exit 1
fi

# Get the base directory name and print it
base_dir=$(basename "$folder_path")
echo "$base_dir/"
print_tree "$folder_path" ""


# run this chmod +x directoryTree.sh
# ./directoryTree.sh /path/to/your/directory
