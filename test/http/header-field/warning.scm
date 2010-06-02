#!r6rs

(import (rnrs (6))
        (http header-field warning)
        (http assertion)
        (xunit))

(assert-parsing-successfully Warning
                             "Warning: 110 example.com \"Response is stale\""
                             `(,(string->list "Warning")
                               #\:
                               (((#\1 #\1 #\0) #\space
                                 ((#\e #\x #\a #\m #\p #\l #\e #\. #\c #\o #\m) ()) #\space
                                 (#\" ((ctext #\R) (ctext #\e) (ctext #\s) (ctext #\p) (ctext #\o) (ctext #\n) (ctext #\s) (ctext #\e) (ctext #\space) (ctext #\i) (ctext #\s) (ctext #\space) (ctext #\s) (ctext #\t) (ctext #\a) (ctext #\l) (ctext #\e)) #\")
                                 ()))
                               ))

(report)
