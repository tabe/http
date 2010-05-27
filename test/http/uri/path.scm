#!r6rs

(import (rnrs (6))
        (http uri path)
        (http assertion)
        (xunit))

(assert-parsing-successfully path "")

(assert-parsing-successfully path
                             "/"
                             '((#\/ ()))
                             )
(assert-parsing-successfully path
                             "/foo/bar.html"
                             '((#\/ (#\f #\o #\o)) (#\/ (#\b #\a #\r #\. #\h #\t #\m #\l)))
                             )

(report)
