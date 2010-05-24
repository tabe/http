#!r6rs

(import (rnrs (6))
        (http header-field age)
        (http assertion)
        (xunit))

(assert-parsing-successfully Age
                             "Age: 1234"
                             `(,(string->list "Age")
                               #\:
                               (#\space)
                               (#\1 #\2 #\3 #\4)))

(report)
