#!r6rs

(import (rnrs (6))
        (http message-body)
        (http assertion)
        (xunit))

(assert-parsing-successfully message-body
                             "This is a message body."
                             (map char->integer (string->list "This is a message body.")))

(report)
