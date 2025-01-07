#!/bin/zsh

# Shell script to run Dart build_runner

# Check if Dart SDK is installed
if ! command -v dart &> /dev/null; then
    echo "Error: Dart SDK is not installed. Please install Dart and try again."
    exit 1
fi

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "Error: Flutter is not installed. Please install Flutter and try again."
    exit 1
fi

# Run flutter pub get
if ! flutter pub get; then
    echo "Error: Flutter pub get failed."
    exit 1
fi

# Run build_runner command
if ! dart run build_runner build --delete-conflicting-outputs; then
    echo "Error: Build failed."
    exit 1
fi

echo "Build completed successfully."
