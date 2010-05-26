#!r6rs

(import (rnrs (6))
        (http header-field etag)
        (http assertion)
        (xunit))

(assert-parsing-successfully ETag
                             "ETag: \"xyzzy\""
                             `(,(string->list "ETag")
                               #\:
                               (#\space)
                               (() (#\" ((ctext #\x) (ctext #\y) (ctext #\z) (ctext #\z) (ctext #\y)) #\"))
                               ))
(assert-parsing-successfully ETag
                             "ETag: W/\"xyzzy\""
                             `(,(string->list "ETag")
                               #\:
                               (#\space)
                               (((#\W #\/)) (#\" ((ctext #\x) (ctext #\y) (ctext #\z) (ctext #\z) (ctext #\y)) #\"))
                               ))
(assert-parsing-successfully ETag
                             "ETag: \"\""
                             `(,(string->list "ETag")
                               #\:
                               (#\space)
                               (() (#\" () #\"))
                               ))

(report)
