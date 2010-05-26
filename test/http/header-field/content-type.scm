#!r6rs

(import (rnrs (6))
        (http header-field content-type)
        (http assertion)
        (xunit))

(assert-parsing-successfully Content-Type
                             "Content-Type: text/html; charset=ISO-8859-4"
                             `(,(string->list "Content-Type")
                               #\:
                               (#\space)
                               (,(string->list "text") #\/ ,(string->list "html")
                                ((#\; (#\space)
                                  (,(string->list "charset") #\= ,(string->list "ISO-8859-4")))))
                               ))

(report)
