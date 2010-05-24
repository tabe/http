#!r6rs

(import (rnrs (6))
        (http header-field content-language)
        (http assertion)
        (xunit))

(assert-parsing-successfully Content-Language
                             "Content-Language: da"
                             `(,(string->list "Content-Language")
                               #\:
                               ((,(string->list "da") ()))))
(assert-parsing-successfully Content-Language
                             "Content-Language: mi, en"
                             `(,(string->list "Content-Language")
                               #\:
                               ((,(string->list "mi") ())
                                (,(string->list "en") ()))))

(report)
