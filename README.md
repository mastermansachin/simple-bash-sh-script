
# Directory Tree Generator

This bash script generates a tree-like structure of a directory, displaying its files and subdirectories. It can be used to visualize the structure of any directory on your filesystem.

## Features

- Displays a tree structure of files and directories.

- Skips hidden files except for `.env`.

- Recursively lists directories.

- Supports specifying a directory path to display its structure.


### Make the script executable:

```bash

chmod  +x  directoryTree.sh

./directoryTree.sh  /path/to/your/directory
```
### example output

```
my_directory/
├── subdir1/
│   ├── file1.txt
│   └── file2.txt
├── subdir2/
│   └── file3.txt
└── .env

