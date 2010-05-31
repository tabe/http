#!r6rs

(import (rnrs (6))
        (http header-field referer)
        (http assertion)
        (xunit))

(assert-parsing-successfully Referer
                             "Referer: http://www.w3.org/hypertext/DataSources/Overview.html"
                             `(,(string->list "Referer")
                               #\:
                               (#\space)
                               ((#\h (#\t #\t #\p)) #\: ((#\/ #\/) (() (#\w #\w #\w #\. #\w #\3 #\. #\o #\r #\g) ()) ((#\/ (#\h #\y #\p #\e #\r #\t #\e #\x #\t)) (#\/ (#\D #\a #\t #\a #\S #\o #\u #\r #\c #\e #\s)) (#\/ (#\O #\v #\e #\r #\v #\i #\e #\w #\. #\h #\t #\m #\l)))) ())
                               ))

(report)
