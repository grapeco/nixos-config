#!/usr/bin/env bash

read publisher
read extension
read version

exec nix hash to-sri --type sha256 $(nix-prefetch-url https://marketplace.visualstudio.com/_apis/public/gallery/publishers/$publisher/vsextensions/$extension/$version/vspackage)