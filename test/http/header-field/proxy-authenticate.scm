#!r6rs

(import (rnrs (6))
        (http header-field proxy-authenticate)
        (http assertion)
        (xunit))

(assert-parsing-successfully Proxy-Authenticate
                             "Proxy-Authenticate: Foo bar=baz"
                             `(,(string->list "Proxy-Authenticate")
                               #\:
                               (((#\F #\o #\o) (#\space) (((#\b #\a #\r) #\= (#\b #\a #\z)))))
                               ))

(report)
