#!/usr/bin/env bash

cd $HOME/Downloads

exec env QT_QPA_PLATFORM="wayland;xcb" \
  appimage-run PrismLauncher-Linux-x86_64.AppImage