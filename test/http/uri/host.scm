#!r6rs

(import (rnrs (6))
        (http uri host)
        (http assertion)
        (xunit))

(assert-parsing-successfully host
                             "fixedpoint.jp"
                             )
(assert-parsing-successfully host
                             "192.168.0.1"
                             '((#\1 (#\9 #\2)) #\. (#\1 (#\6 #\8)) #\. #\0 #\. #\1)
                             )
(assert-parsing-successfully host
                             "192.168.0.255"
                             '((#\1 (#\9 #\2)) #\. (#\1 (#\6 #\8)) #\. #\0 #\. ((#\2 #\5) #\5))
                             )

(report)
