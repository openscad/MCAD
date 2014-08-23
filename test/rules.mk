
# Push the current directory onto the directory stack.
sp             := $(sp).x
dirstack_$(sp) := $(d)
d              := $(dir)

# Subdirectories, in no particular order.
dir := $(d)/units.scad
include $(dir)/rules.mk

# Pop the directory stack.
d  := $(dirstack_$(sp))
sp := $(basename $(sp))

