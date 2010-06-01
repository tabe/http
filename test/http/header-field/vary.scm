#!r6rs

(import (rnrs (6))
        (http header-field vary)
        (http assertion)
        (xunit))

(assert-parsing-successfully Vary
                             "Vary: *"
                             `(,(string->list "Vary")
                               #\:
                               (#\space)
                               #\*
                               ))
(assert-parsing-successfully Vary
                             "Vary: foo, bar"
                             `(,(string->list "Vary")
                               #\:
                               (#\space)
                               (,(string->list "foo")
                                ,(string->list "bar"))
                               ))

(report)
