#!/bin/bash
mkdir -p out/javadoc
javadoc -Xdoclint:none --source-path src -d out/javadoc -subpackages example 
