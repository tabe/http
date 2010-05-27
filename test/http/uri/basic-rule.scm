#!r6rs

(import (rnrs (6))
        (http uri basic-rule)
        (http assertion)
        (xunit))

(assert-parsing-successfully pct-encoded "%00")
(assert-parsing-successfully pct-encoded "%ff")

(report)
