#! /bin/bash
# Simple calculator application from terminal
# licensed under CC
# Author: Henri Cattoire

# Variables
VERSION="1.0"
# Intro
echo "Welcome to simpleCalculator for macOS v"$VERSION""
# Main
echo "Please give us an operation that we can calculate (ex. 3.4+7/9-3):"
read userOperation
# Make the calculating
ANSWER="$(echo "$userOperation" | bc)"
echo "Answer: "$ANSWER"