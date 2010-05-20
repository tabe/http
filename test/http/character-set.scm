#!r6rs

(import (rnrs (6))
        (http character-set)
        (http assertion)
        (xunit))

(assert-parsing-successfully charset "US-ASCII")

(report)
