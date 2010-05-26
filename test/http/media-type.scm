#!r6rs

(import (rnrs (6))
        (http media-type)
        (http assertion)
        (xunit))

(assert-parsing-successfully media-type
                             "text/plain"
                             `(,(string->list "text") #\/ ,(string->list "plain") ()))
(assert-parsing-successfully media-type
                             "text/html;charset=UTF-8"
                             `(,(string->list "text") #\/ ,(string->list "html")
                               ((#\; () (,(string->list "charset") #\= ,(string->list "UTF-8"))))))

(report)
