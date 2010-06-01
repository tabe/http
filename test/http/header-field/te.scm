#!r6rs

(import (rnrs (6))
        (http header-field te)
        (http assertion)
        (xunit))

(assert-parsing-successfully TE
                             "TE: deflate"
                             `(,(string->list "TE")
                               #\:
                               ((((#\d #\e #\f #\l #\a #\t #\e) ()) ()))
                               ))
(assert-parsing-successfully TE
                             "TE:"
                             `(,(string->list "TE")
                               #\:
                               ()
                               ))
(assert-parsing-successfully TE
                             "TE: trailers, deflate;q=0.5"
                             `(,(string->list "TE")
                               #\:
                               (,(string->list "trailers")
                                (((#\d #\e #\f #\l #\a #\t #\e) ((#\; ((#\q) #\= (#\0 #\. #\5))))) ()))
                               ))

(report)
