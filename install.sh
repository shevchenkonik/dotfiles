#!/bin/bash

HOME_CONFIG="$HOME/.config"
HOME_DEV="$HOME/dev"
HOME_PROJECTS="$HOME/projects"
HOME_DOCS="$HOME/docs"

setupDirectories() {
  echo
  echo "● ● Setting up directories"

  mkdir -p "$HOME_DEV"

  if [ -d "$HOME_DEV" ]; then
    echo "● ○ $HOME_DEV directory successfully created"
  fi

  mkdir -p "$HOME_PROJECTS"

  if [ -d "$HOME_PROJECTS" ]; then
      echo "● ○ $HOME_PROJECTS directory successfully created"
  fi

  mkdir -p "$HOME_DOCS"

  if [ -d "$HOME_DOCS" ]; then
      echo "● ○ $HOME_DOCS directory successfully created"
  fi

  mkdir -p "$HOME_CONFIG"

  if [ -d "$HOME_CONFIG" ]; then
      echo "● ○ $HOME_CONFIG directory successfully created"
  fi

  echo "● ● Directories successfully created"
  echo
}

setup() {
  setupDirectories
}

setup
