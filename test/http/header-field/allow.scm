#!r6rs

(import (rnrs (6))
        (http header-field allow)
        (http assertion)
        (xunit))

(assert-parsing-successfully Allow
                             "Allow: GET, HEAD, PUT"
                             `((#\A #\l #\l #\o #\w)
                               #\:
                               ((#\G #\E #\T) (#\H #\E #\A #\D) (#\P #\U #\T))))

(report)
