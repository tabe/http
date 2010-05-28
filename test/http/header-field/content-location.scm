#!r6rs

(import (rnrs (6))
        (http header-field content-location)
        (http assertion)
        (xunit))

(assert-parsing-successfully Content-Location
                             "Content-Location: http://example.com/"
                             `(,(string->list "Content-Location")
                               #\:
                               (#\space)
                               ((#\h (#\t #\t #\p)) #\: ((#\/ #\/) (() ,(string->list "example.com") ()) ((#\/ ()))) ())
                               ))
(assert-parsing-successfully Content-Location
                             "Content-Location: /foo/bar.html"
                             `(,(string->list "Content-Location")
                               #\:
                               (#\space)
                               ((#\/ ((,(string->list "foo") ((#\/ ,(string->list "bar.html")))))) ())
                               ))

(report)
