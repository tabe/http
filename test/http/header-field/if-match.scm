#!r6rs

(import (rnrs (6))
        (http header-field if-match)
        (http assertion)
        (xunit))

(assert-parsing-successfully If-Match
                             "If-Match: \"xyzzy\""
                             `(,(string->list "If-Match")
                               #\:
                               (#\space)
                               ((() (#\" ((ctext #\x) (ctext #\y) (ctext #\z) (ctext #\z) (ctext #\y)) #\")))
                               ))
(assert-parsing-successfully If-Match
                             "If-Match: \"xyzzy\", \"r2d2xxxx\", \"c3piozzzz\""
                             `(,(string->list "If-Match")
                               #\:
                               (#\space)
                               ((() (#\" ((ctext #\x) (ctext #\y) (ctext #\z) (ctext #\z) (ctext #\y)) #\"))
                                (() (#\" ((ctext #\r) (ctext #\2) (ctext #\d) (ctext #\2) (ctext #\x) (ctext #\x) (ctext #\x) (ctext #\x)) #\"))
                                (() (#\" ((ctext #\c) (ctext #\3) (ctext #\p) (ctext #\i) (ctext #\o) (ctext #\z) (ctext #\z) (ctext #\z) (ctext #\z)) #\")))
                               ))
(assert-parsing-successfully If-Match
                             "If-Match: *"
                             `(,(string->list "If-Match")
                               #\:
                               (#\space)
                               #\*
                               ))

(report)
