#!r6rs

(import (rnrs (6))
        (http header-field cache-control)
        (http assertion)
        (xunit))

(assert-parsing-successfully Cache-Control
                             "Cache-Control: private, community=\"UCI\""
                             `(,(string->list "Cache-Control")
                               #\:
                               (((#\p #\r #\i #\v #\a #\t #\e) ())
                                ((#\c #\o #\m #\m #\u #\n #\i #\t #\y) ((#\= (#\" ((ctext #\U) (ctext #\C) (ctext #\I)) #\")))))))

(report)
