#!r6rs

(import (rnrs (6))
        (http entity-tag)
        (http assertion)
        (xunit))

(assert-parsing-successfully entity-tag
                             "\"quoted\""
                             `(() (#\" ,(map (lambda (c) `(ctext ,c)) (string->list "quoted")) #\")))
(assert-parsing-successfully entity-tag
                             "W/\"weak\""
                             `((,(string->list "W/")) (#\" ,(map (lambda (c) `(ctext ,c)) (string->list "weak")) #\")))

(report)
