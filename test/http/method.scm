#!r6rs

(import (rnrs (6))
        (http method)
        (http assertion)
        (xunit))

(assert-parsing-successfully Method "OPTIONS")
(assert-parsing-successfully Method "GET")
(assert-parsing-successfully Method "HEAD")
(assert-parsing-successfully Method "POST")
(assert-parsing-successfully Method "PUT")
(assert-parsing-successfully Method "DELETE")
(assert-parsing-successfully Method "TRACE")
(assert-parsing-successfully Method "CONNECT")

(report)
