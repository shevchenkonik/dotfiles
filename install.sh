#!/bin/bash

printBottomBorder() {
    echo "---------------------------------------------------------------------------"
}

printTopBorder() {
    printf "\n---------------------------------------------------------------------------\n"
}

setupDirectories() {
  printTopBorder
  echo "Setting up directories:"

  mkdir -p "$HOME/dev"

  if [ -d "$HOME/dev" ]; then
    echo "dev directory successfully created"
  fi

  mkdir -p "$HOME/projects"

  if [ -d "$HOME/projects" ]; then
      echo "projects directory successfully created"
  fi

  mkdir -p "$HOME/docs"

  if [ -d "$HOME/docs" ]; then
      echo "docs directory successfully created"
  fi

  printBottomBorder
}

setup() {
  setupDirectories
}

setup
