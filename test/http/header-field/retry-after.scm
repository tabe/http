#!r6rs

(import (rnrs (6))
        (http header-field retry-after)
        (http assertion)
        (xunit))

(assert-parsing-successfully Retry-After
                             "Retry-After: Fri, 31 Dec 1999 23:59:59 GMT"
                             `(,(string->list "Retry-After")
                               #\:
                               (#\space)
                               ((#\F #\r #\i) #\, #\space ((#\3 #\1) #\space (#\D #\e #\c) #\space (#\1 #\9 #\9 #\9)) #\space ((#\2 #\3) #\: (#\5 #\9) #\: (#\5 #\9)) #\space (#\G #\M #\T))
                               ))
(assert-parsing-successfully Retry-After
                             "Retry-After: 120"
                             `(,(string->list "Retry-After")
                               #\:
                               (#\space)
                               ,(string->list "120")
                               ))

(report)
