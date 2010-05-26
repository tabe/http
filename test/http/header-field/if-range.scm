#!r6rs

(import (rnrs (6))
        (http header-field if-range)
        (http assertion)
        (xunit))

(assert-parsing-successfully If-Range
                             "If-Range: \"xyzzy\""
                             `(,(string->list "If-Range")
                               #\:
                               (#\space)
                               (() (#\" ((ctext #\x) (ctext #\y) (ctext #\z) (ctext #\z) (ctext #\y)) #\"))
                               ))
(assert-parsing-successfully If-Range
                             "If-Range: Wed, 26 May 2010 16:53:20 GMT"
                             `(,(string->list "If-Range")
                               #\:
                               (#\space)
                               ((#\W #\e #\d) #\, #\space ((#\2 #\6) #\space (#\M #\a #\y) #\space (#\2 #\0 #\1 #\0)) #\space ((#\1 #\6) #\: (#\5 #\3) #\: (#\2 #\0)) #\space (#\G #\M #\T))
                               ))

(report)
