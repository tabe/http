#!r6rs

(import (rnrs (6))
        (http header-field if-none-match)
        (http assertion)
        (xunit))

(assert-parsing-successfully If-None-Match
                             "If-None-Match: \"xyzzy\""
                             `(,(string->list "If-None-Match")
                               #\:
                               (#\space)
                               ((() (#\" ((ctext #\x) (ctext #\y) (ctext #\z) (ctext #\z) (ctext #\y)) #\")))
                               ))
(assert-parsing-successfully If-None-Match
                             "If-None-Match: W/\"xyzzy\""
                             `(,(string->list "If-None-Match")
                               #\:
                               (#\space)
                               ((((#\W #\/)) (#\" ((ctext #\x) (ctext #\y) (ctext #\z) (ctext #\z) (ctext #\y)) #\")))
                               ))
(assert-parsing-successfully If-None-Match
                             "If-None-Match: \"xyzzy\", \"r2d2xxxx\", \"c3piozzzz\""
                             `(,(string->list "If-None-Match")
                               #\:
                               (#\space)
                               ((() (#\" ((ctext #\x) (ctext #\y) (ctext #\z) (ctext #\z) (ctext #\y)) #\"))
                                (() (#\" ((ctext #\r) (ctext #\2) (ctext #\d) (ctext #\2) (ctext #\x) (ctext #\x) (ctext #\x) (ctext #\x)) #\"))
                                (() (#\" ((ctext #\c) (ctext #\3) (ctext #\p) (ctext #\i) (ctext #\o) (ctext #\z) (ctext #\z) (ctext #\z) (ctext #\z)) #\")))
                               ))
(assert-parsing-successfully If-None-Match
                             "If-None-Match: W/\"xyzzy\", W/\"r2d2xxxx\", W/\"c3piozzzz\""
                             `(,(string->list "If-None-Match")
                               #\:
                               (#\space)
                               ((((#\W #\/)) (#\" ((ctext #\x) (ctext #\y) (ctext #\z) (ctext #\z) (ctext #\y)) #\"))
                                (((#\W #\/)) (#\" ((ctext #\r) (ctext #\2) (ctext #\d) (ctext #\2) (ctext #\x) (ctext #\x) (ctext #\x) (ctext #\x)) #\"))
                                (((#\W #\/)) (#\" ((ctext #\c) (ctext #\3) (ctext #\p) (ctext #\i) (ctext #\o) (ctext #\z) (ctext #\z) (ctext #\z) (ctext #\z)) #\")))
                               ))
(assert-parsing-successfully If-None-Match
                             "If-None-Match: *"
                             `(,(string->list "If-None-Match")
                               #\:
                               (#\space)
                               #\*
                               ))

(report)
