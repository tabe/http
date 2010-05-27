#!r6rs

(import (rnrs (6))
        (http uri authority)
        (http assertion)
        (xunit))

(assert-parsing-successfully authority
                             "www.example.com"
                             `(() ,(string->list "www.example.com") ())
                             )
(assert-parsing-successfully authority
                             "foo@www.example.com:"
                             `(((,(string->list "foo") #\@)) ,(string->list "www.example.com") ((#\: ())))
                             )
(assert-parsing-successfully authority
                             "foo@www.example.com:80"
                             `(((,(string->list "foo") #\@)) ,(string->list "www.example.com") ((#\: ,(string->list "80"))))
                             )

(report)
