#!/bin/bash

# ============================================================
# Linux mv Command Assignment
# ============================================================
#
# Student Name:
# Register Number:
#
# Complete the TODO sections.
# Use the mv command for all operations.
# ============================================================

case "$1" in

    move)
        # Task 1: Move file1.txt into documents/
        # TODO: Write your mv command here
        ;;

    rename)
        # Task 2: Rename file1.txt to file2.txt
        # TODO: Write your mv command here
        ;;

    multiple)
        # Task 3: Move file1.txt and file2.txt into documents/
        # TODO: Write your mv command here
        ;;

    directory)
        # Task 4: Move source_dir into documents/
        # TODO: Write your mv command here
        ;;

    *)
        echo "Usage: $0 {move|rename|multiple|directory}"
        exit 1
        ;;

esac
