#!r6rs

(import (rnrs (6))
        (http header-field www-authenticate)
        (http assertion)
        (xunit))

(assert-parsing-successfully WWW-Authenticate
                             "WWW-Authenticate: Basic realm=\"WallyWorld\""
                             `(,(string->list "WWW-Authenticate")
                               #\:
                               (((#\B #\a #\s #\i #\c) (#\space) (((#\r #\e #\a #\l #\m) #\= (#\" ((ctext #\W) (ctext #\a) (ctext #\l) (ctext #\l) (ctext #\y) (ctext #\W) (ctext #\o) (ctext #\r) (ctext #\l) (ctext #\d)) #\")))))
                               ))

(report)
