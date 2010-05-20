#!r6rs

(import (rnrs (6))
        (http parameter)
        (http assertion)
        (xunit))

(assert-parsing-successfully parameter "charset=UTF-8" `(,(string->list "charset") #\= ,(string->list "UTF-8")))

(report)
