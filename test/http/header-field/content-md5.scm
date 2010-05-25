#!r6rs

(import (rnrs (6))
        (http header-field content-md5)
        (http assertion)
        (xunit))

(assert-parsing-successfully Content-MD5
                             "Content-MD5: f00bar"
                             `(,(string->list "Content-MD5")
                               #\:
                               (#\space)
                               ,(string->list "f00bar")))

(report)
