#!r6rs

(import (rnrs (6))
        (http content-coding)
        (http assertion)
        (xunit))

(assert-parsing-successfully content-coding "gzip")
(assert-parsing-successfully content-coding "compress")
(assert-parsing-successfully content-coding "x-gzip")
(assert-parsing-successfully content-coding "x-compress")
(assert-parsing-successfully content-coding "deflate")
(assert-parsing-successfully content-coding "identity")

(report)
