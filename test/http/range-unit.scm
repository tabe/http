#!r6rs

(import (rnrs (6))
        (http range-unit)
        (http assertion)
        (xunit))

(assert-parsing-successfully range-unit "bytes")

(report)
