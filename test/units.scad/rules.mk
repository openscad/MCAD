
# Push the current directory onto the directory stack.
sp             := $(sp).x
dirstack_$(sp) := $(d)
d              := $(dir)

# Can the user switch the base units to centimeters?
#
# The line "$(d)/test_overrides.test: D := $(d)" is needed because the recipe is
# actually invoked from the top-level MCAD directory, rather than this
# directory.  Thus, using $(d) in the recipe results in an empty string.  The
# target-specific assignment D := $(d) "freezes" the value of $(d) at the time
# of rule definition, when it has the proper value.
#
# $(D) isn't actually used in this recipe, but I left it in because the fact
# that $(d) isn't available is quite surprising at first.
.PHONY: $(d)/override_cm.test
TESTS := $(TESTS) $(d)/override_cm.test
$(d)/override_cm.test: D := $(d)
$(d)/override_cm.test: $(d)/override_cm.scad
	@if ! $(OSCAD_TEST) -o $<.stl $< ; then echo "Test failed: "$< ; fi
	@rm -f $<.stl

.PHONY: $(d)/override_mils.test
TESTS := $(TESTS) $(d)/override_mils.test
$(d)/override_mils.test: $(d)/override_mils.scad
	@if ! $(OSCAD_TEST) -o $<.stl $< ; then echo "Test failed: "$< ; fi
	@rm -f $<.stl

# Pop the directory stack.
d  := $(dirstack_$(sp))
sp := $(basename $(sp))
