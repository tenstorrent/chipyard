#!/bin/bash

if conda env list | grep -q "^firesim"; then
    conda activate firesim
else
    conda activate chipyard
fi
