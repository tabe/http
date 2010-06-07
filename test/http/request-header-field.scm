#!r6rs

(import (rnrs (6))
        (http request-header-field)
        (http assertion)
        (xunit))

(assert-parsing-successfully request-header
                             "User-Agent: abc"
                             `(,(string->list "User-Agent") #\: (((#\space) ((#\a #\b #\c) ())))))

(report)
