#!r6rs

(import (rnrs (6))
        (http uri query)
        (http assertion)
        (xunit))

(assert-parsing-successfully query "")
(assert-parsing-successfully query "foobar")
(assert-parsing-successfully query "/?")

(report)
