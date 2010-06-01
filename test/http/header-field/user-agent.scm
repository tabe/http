#!r6rs

(import (rnrs (6))
        (http header-field user-agent)
        (http assertion)
        (xunit))

(assert-parsing-successfully User-Agent
                             "User-Agent: CERN-LineMode/2.15 libwww/2.17b3"
                             `(,(string->list "User-Agent")
                               #\:
                               (((#\space) ((#\C #\E #\R #\N #\- #\L #\i #\n #\e #\M #\o #\d #\e) ((#\/ (#\2 #\. #\1 #\5)))))
                                ((#\space) ((#\l #\i #\b #\w #\w #\w) ((#\/ (#\2 #\. #\1 #\7 #\b #\3))))))
                               ))

(report)
