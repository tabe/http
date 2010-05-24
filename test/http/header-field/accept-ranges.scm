#!r6rs

(import (rnrs (6))
        (http header-field accept-ranges)
        (http assertion)
        (xunit))

(assert-parsing-successfully Accept-Ranges
                             "Accept-Ranges: bytes"
                             '((#\A #\c #\c #\e #\p #\t #\- #\R #\a #\n #\g #\e #\s)
                               #\:
                               ((#\b #\y #\t #\e #\s))))
(assert-parsing-successfully Accept-Ranges
                             "Accept-Ranges: none"
                             '((#\A #\c #\c #\e #\p #\t #\- #\R #\a #\n #\g #\e #\s)
                               #\:
                               ((#\n #\o #\n #\e))))

(report)
