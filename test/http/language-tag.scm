#!r6rs

(import (rnrs (6))
        (http language-tag)
        (http assertion)
        (xunit))

(assert-parsing-successfully language-tag "en" `(,(string->list "en") ()))
(assert-parsing-successfully language-tag "en-US" `(,(string->list "en") ((#\- ,(string->list "US")))))
(assert-parsing-successfully language-tag "en-cockney" `(,(string->list "en") ((#\- ,(string->list "cockney")))))
(assert-parsing-successfully language-tag "i-cherokee" `((#\i) ((#\- ,(string->list "cherokee")))))
(assert-parsing-successfully language-tag "x-pig-latin" `((#\x) ((#\- ,(string->list "pig")) (#\- ,(string->list "latin")))))

(report)
