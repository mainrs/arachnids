#!/bin/sh
#
# Removes available glue code.
#   @requires: roc

# Remove old glue code.
./scripts/remove-glue-code.sh

# Re-generate glue code.
roc glue ./roc/crates/glue/src/RustGlue.roc platform/glue api/main-glue.roc
# roc glue ./roc/crates/glue/src/RustGlue.roc platform/glue-manual api/main-manual.roc
