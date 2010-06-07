#!r6rs

(import (rnrs (6))
        (http request-uri)
        (http assertion)
        (xunit))

(assert-parsing-successfully Request-URI
                             "/"
                             '(#\/ ())
                             )
(assert-parsing-successfully Request-URI
                             "/foo/bar.html"
                             '(#\/ (((#\f #\o #\o) ((#\/ (#\b #\a #\r #\. #\h #\t #\m #\l))))))
                             )

(report)
