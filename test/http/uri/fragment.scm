#!r6rs

(import (rnrs (6))
        (http uri fragment)
        (http assertion)
        (xunit))

(assert-parsing-successfully fragment "")
(assert-parsing-successfully fragment "foobar")
(assert-parsing-successfully fragment "/?")

(report)
