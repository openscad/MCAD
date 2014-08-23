
# A non-recursive make-file, in the excellent style proposed by Emile van Bergen
# at http://evbergen.home.xs4all.nl/nonrecursive-make.html

# Disable built-in implicit rules.  We don't need them.
.SUFFIXES:

# Each recipe is passed directly to a single shell invocation, rather than one
# invocation per line.
.ONESHELL:

# Push the current directory onto the directory stack.
sp             := $(sp).x
dirstack_$(sp) := $(d)
d              := $(dir)

# Define openscad executable name.
OSCAD := openscad
OSCAD_TEST := $(OSCAD) --render

# Subdirectories, in random order.
dir := test
include $(dir)/rules.mk

# Makefile fragments should append any test targets to TESTS

# The test target runs all tests.
.PHONY: test
test: $(TESTS)

# Pop the directory stack.
d  := $(dirstack_$(sp))
sp := $(basename $(sp))
