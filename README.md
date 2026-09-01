Linux mv Command – Move or Rename Files and Directories
Aim

To move or rename files and directories using the Linux mv command.

Objective

In this assignment, you will learn how to use the mv command to:

Move a file from one directory to another.
Rename a file.
Move and rename a file.
Move multiple files into a directory.
Move a directory to another location.
Prerequisites
Basic Linux terminal knowledge
Basic Bash scripting
Understanding of files and directories
Familiarity with the mv command
Assignment

Complete the mv_operations.sh Bash script provided in this repository.

Your script must demonstrate the following operations.

1. Move a file

Move file1.txt from the current directory into the documents directory.

Expected operation:

mv file1.txt documents/


After the operation:

file1.txt should exist inside documents/
file1.txt should no longer exist in the original directory
2. Rename a file

Rename file1.txt to file2.txt.

Expected operation:

mv file1.txt file2.txt


After the operation:

file2.txt should exist
file1.txt should not exist
3. Move multiple files

Move file1.txt and file2.txt into the documents directory.

Expected operation:

mv file1.txt file2.txt documents/


After the operation:

Both files should exist inside documents/
The original copies should no longer exist in the current directory
4. Move a directory

Move the directory source_dir into the documents directory.

Expected operation:

mv source_dir documents/


After the operation:

documents/source_dir should exist
source_dir should no longer exist in the original location
Your Task

Edit:

mv_operations.sh


Do not modify the test files or GitHub Actions workflow.

Your script should use the Linux mv command to perform the required operations.

Important Requirements
Use Bash.
Use the mv command.
Do not use cp as a replacement for mv.
Do not use rm to simulate moving files.
Do not hard-code absolute paths such as /home/username/....
Use relative paths so that the script works in GitHub Actions.
The script must run successfully from the repository root.
Running Your Script Locally

Give execute permission:

chmod +x mv_operations.sh


Run:

./mv_operations.sh

Running the Tests Locally

Run:

bash tests/test_mv_operations.sh


You should see a result similar to:

================================
Linux mv Command Test
================================

Test 1: Move a file          PASS
Test 2: Rename a file        PASS
Test 3: Move multiple files  PASS
Test 4: Move a directory     PASS

All tests passed!

Submission

Commit and push your changes:

git add mv_operations.sh
git commit -m "Complete mv command assignment"
git push


GitHub Actions will automatically run the tests after you push your changes.

Grading
Test	Marks
Move a file	25
Rename a file	25
Move multiple files	25
Move a directory	25
Total	100

Your GitHub Actions result will indicate whether your solution passes the automated tests.

Academic Integrity

Write your own Bash script. You may refer to Linux documentation and course materials to understand the mv command, but do not copy another student's solution.
