# Sections

- [Sections](#sections)
- [Introduction](#introduction)
- [Usage](#usage)
- [Examples](#examples)

# Introduction
This bash script is used to count the total number of files with some extension in any given directory and their total size.

Before you can use it, make sure you gave excute permission to the script file.

For example if the file is at the directory where the terminal is opened, you can use the following command:

```shell
chmod a+x countext.sh
```

# Usage
This script accepts the following options:

- **-h/--help**: Displays details about the possible options for the script.
- **-e/--extension**: The extension of the files that are to be searched and counted.
- **-p/--path**: The path from which the search begins. Defaults to root directory if not set.
- **-s/--total-size**: Displays the total size of the found files if any were found.
  
# Examples
The following are some expamles of calling the script:
- To count the number of files in the whole file system (Leaving path option undefined to default to root directory.)
```shell 
./countext.sh -e "*"
```
- To count the number of pdf files found in Downloads directory and their total size
```shell
./countext.sh -e "pdf" -p "~/Downloads" -s
```