#!r6rs

(import (rnrs (6))
        (http version)
        (http assertion)
        (xunit))

(assert-parsing-successfully HTTP-Version "HTTP/1.0" '((#\H #\T #\T #\P #\/) (#\1) #\. (#\0)))
(assert-parsing-successfully HTTP-Version "HTTP/1.1" '((#\H #\T #\T #\P #\/) (#\1) #\. (#\1)))
(assert-parsing-successfully HTTP-Version "HTTP/12.31" '((#\H #\T #\T #\P #\/) (#\1 #\2) #\. (#\3 #\1)))

(report)
