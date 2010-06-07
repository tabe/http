#!r6rs

(import (rnrs (6))
        (http header-field authorization)
        (http assertion)
        (xunit))

(assert-parsing-successfully Authorization
                             "Authorization: Foo bar"
                             `(,(string->list "Authorization")
                               #\:
                               (#\space)
                               (,(string->list "Foo")
                                (#\space)
                                ,(string->list "bar"))
                               ))

(report)
