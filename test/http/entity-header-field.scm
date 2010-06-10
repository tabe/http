#!r6rs

(import (rnrs (6))
        (http entity-header-field)
        (http assertion)
        (xunit))

(assert-parsing-successfully entity-header
                             "foo:bar"
                             `((#\f #\o #\o) #\: (,(map char->integer '(#\b #\a #\r)))))

(report)
