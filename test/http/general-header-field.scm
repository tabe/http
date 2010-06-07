#!r6rs

(import (rnrs (6))
        (http general-header-field)
        (http assertion)
        (xunit))

(assert-parsing-successfully general-header
                             "Via: abc"
                             '((#\V #\i #\a) #\: (((() (#\a #\b #\c)) () (() ()) ()))))

(report)
