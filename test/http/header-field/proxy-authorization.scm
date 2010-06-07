#!r6rs

(import (rnrs (6))
        (http header-field proxy-authorization)
        (http assertion)
        (xunit))

(assert-parsing-successfully Proxy-Authorization
                             "Proxy-Authorization: Foo bar"
                             `(,(string->list "Proxy-Authorization")
                               #\:
                               (#\space)
                               ((#\F #\o #\o) (#\space) (#\b #\a #\r))
                               ))

(report)
