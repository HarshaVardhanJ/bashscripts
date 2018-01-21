#! /bin/bash
# Simple filemanager application from terminal
# licensed under CC
# Author: Henri Cattoire

# Variables
VERSION="1.0"
# Intro
echo "Welcome to fileManager for macOS v"$VERSION""
# Main
echo "What do you want to do?"
echo " a: Find path to file"
echo " b: Show the content of a file"
echo " c: Make a file (within terminal)"
echo " d: Manipulate a file (chmod)"
echo " e: Copy a file"
echo " f: Move a file"
echo " g: Change the ownership of a file"
echo " h: Remove a file"
echo "Please enter the letter corresponding with your choice (a, b, c, d, e, f, g or h):"
read userOption

echo
if [ "$userOption" == "a" ]; then
     echo "What is the name of your file?"
     read fileName
     echo
     mdfind "$fileName"
    
elif [ "$userOption" == "b" ]; then
     echo "What is the path to the file you want to see (hit Q to quit)?"
     read pathToFile
     less "$pathToFile"
     echo "Content of file successfully shown!"
     
elif [ "$userOption" == "c" ]; then
     echo "What name should your new file have?"
     read fileName
     echo "Which extension (.txt [default], .sh, ...) should it use?"
     read fileExtension
     nano "$fileName""$fileExtension"
     
elif [ "$userOption" == "d" ]; then
     echo "What is the path to the file you want to manipulate?"
     read pathToFile
     echo "Do you want to make the file executable (x), readable (r) or writeable (w)?"
     read manipulateFile
     chmod +"$manipulateFile" "$pathToFile"
     echo "File successfully manipulated!"
     
elif [ "$userOption" == "e" ]; then
     echo "What is the path to the file you want to copy?"
     read cpFile1
     echo "To where do you want to copy the file (path)?"
     read cpFile2
     cp "$cpFile1" "$cpFile2"
     echo "File successfully copied!"
     
elif [ "$userOption" == "f" ]; then
     echo "What is the path to the file you want to move?"
     read mvFile1
     echo "To where do you want to move the file (path)?"
     read mvFile2
     cp "$mvFile1" "$mvFile2"
     echo "File successfully moved!"
     
elif [ "$userOption" == "g" ]; then
     echo "Who currently owns the file (username)?"
     read username1
     echo "Who should own the file according to you (username)?"
     read username2
     echo "What is the path to the file that needs a new owner?"
     read ownerFile
     chown "$username1":"$username2" "$ownerFile"
     echo "File is now owned by "$username2""
     
elif [ "$userOption" == "h" ]; then
      echo "What is the path to the file you want to remove (irreversible)?"
      read rmFile
      echo "File will be removed in 3 seconds, hit control C to abort"
      sleep 3
      rm "$rmFile"
      echo "File successfully removed"
fi    