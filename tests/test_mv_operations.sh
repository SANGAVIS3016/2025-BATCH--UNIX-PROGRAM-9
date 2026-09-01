#!/bin/bash

# ============================================================
# Linux mv Command Automated Tests
# ============================================================

SCRIPT="./mv_operations.sh"

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

PASS=0
FAIL=0

# ------------------------------------------------------------
# Check student script
# ------------------------------------------------------------

if [ ! -f "$SCRIPT" ]; then
    echo "ERROR: mv_operations.sh not found."
    exit 1
fi

chmod +x "$SCRIPT"

# ============================================================
# TEST 1 - Move a File
# ============================================================

test_move() {

    echo "----------------------------------------"
    echo "Test 1: Move a File"
    echo "----------------------------------------"

    rm -rf test_env
    mkdir -p test_env/documents

    echo "Test File" > test_env/file1.txt

    (
        cd test_env || exit 1
        ../mv_operations.sh move
    )

    if [ -f "test_env/documents/file1.txt" ] &&
       [ ! -f "test_env/file1.txt" ]; then

        echo -e "${GREEN}PASS${NC}: File moved successfully."
        PASS=$((PASS + 1))
        rm -rf test_env
        return 0

    else

        echo -e "${RED}FAIL${NC}: File was not moved correctly."
        FAIL=$((FAIL + 1))
        rm -rf test_env
        return 1

    fi
}

# ============================================================
# TEST 2 - Rename a File
# ============================================================

test_rename() {

    echo "----------------------------------------"
    echo "Test 2: Rename a File"
    echo "----------------------------------------"

    rm -rf test_env
    mkdir -p test_env

    echo "Test File" > test_env/file1.txt

    (
        cd test_env || exit 1
        ../mv_operations.sh rename
    )

    if [ -f "test_env/file2.txt" ] &&
       [ ! -f "test_env/file1.txt" ]; then

        echo -e "${GREEN}PASS${NC}: File renamed successfully."
        PASS=$((PASS + 1))
        rm -rf test_env
        return 0

    else

        echo -e "${RED}FAIL${NC}: File was not renamed correctly."
        FAIL=$((FAIL + 1))
        rm -rf test_env
        return 1

    fi
}

# ============================================================
# TEST 3 - Move Multiple Files
# ============================================================

test_multiple() {

    echo "----------------------------------------"
    echo "Test 3: Move Multiple Files"
    echo "----------------------------------------"

    rm -rf test_env
    mkdir -p test_env/documents

    echo "File One" > test_env/file1.txt
    echo "File Two" > test_env/file2.txt

    (
        cd test_env || exit 1
        ../mv_operations.sh multiple
    )

    if [ -f "test_env/documents/file1.txt" ] &&
       [ -f "test_env/documents/file2.txt" ] &&
       [ ! -f "test_env/file1.txt" ] &&
       [ ! -f "test_env/file2.txt" ]; then

        echo -e "${GREEN}PASS${NC}: Multiple files moved successfully."
        PASS=$((PASS + 1))
        rm -rf test_env
        return 0

    else

        echo -e "${RED}FAIL${NC}: Multiple files were not moved correctly."
        FAIL=$((FAIL + 1))
        rm -rf test_env
        return 1

    fi
}

# ============================================================
# TEST 4 - Move a Directory
# ============================================================

test_directory() {

    echo "----------------------------------------"
    echo "Test 4: Move a Directory"
    echo "----------------------------------------"

    rm -rf test_env
    mkdir -p test_env/documents
    mkdir -p test_env/source_dir

    echo "Directory Test" > test_env/source_dir/test.txt

    (
        cd test_env || exit 1
        ../mv_operations.sh directory
    )

    if [ -d "test_env/documents/source_dir" ] &&
       [ -f "test_env/documents/source_dir/test.txt" ] &&
       [ ! -d "test_env/source_dir" ]; then

        echo -e "${GREEN}PASS${NC}: Directory moved successfully."
        PASS=$((PASS + 1))
        rm -rf test_env
        return 0

    else

        echo -e "${RED}FAIL${NC}: Directory was not moved correctly."
        FAIL=$((FAIL + 1))
        rm -rf test_env
        return 1

    fi
}

# ============================================================
# Run Individual Test
# ============================================================

case "$1" in

    move)
        test_move
        exit $?
        ;;

    rename)
        test_rename
        exit $?
        ;;

    multiple)
        test_multiple
        exit $?
        ;;

    directory)
        test_directory
        exit $?
        ;;

    "")
        echo
        echo "========================================"
        echo " Linux mv Command Automated Test"
        echo "========================================"
        echo

        test_move
        test_rename
        test_multiple
        test_directory

        echo
        echo "========================================"
        echo " Test Summary"
        echo "========================================"

        echo "Passed: $PASS"
        echo "Failed: $FAIL"
        echo

        if [ "$FAIL" -eq 0 ]; then
            echo -e "${GREEN}All tests passed!${NC}"
            exit 0
        else
            echo -e "${RED}Some tests failed.${NC}"
            exit 1
        fi
        ;;

    *)
        echo "Usage:"
        echo "  bash tests/test_mv_operations.sh"
        echo "  bash tests/test_mv_operations.sh move"
        echo "  bash tests/test_mv_operations.sh rename"
        echo "  bash tests/test_mv_operations.sh multiple"
        echo "  bash tests/test_mv_operations.sh directory"
        exit 1
        ;;

esac
