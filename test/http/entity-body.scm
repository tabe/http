#!r6rs

(import (rnrs (6))
        (http entity-body)
        (http assertion)
        (xunit))

(assert-parsing-successfully entity-body "")
(assert-parsing-successfully entity-body "this is a body.")

(report)
