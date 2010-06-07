#!r6rs

(import (rnrs (6))
        (http entity-header-field)
        (http assertion)
        (xunit))

(assert-parsing-successfully entity-header "foo:bar" '((#\f #\o #\o) #\: ((#\b #\a #\r))))

(report)
