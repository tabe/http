#!r6rs

(import (rnrs (6))
        (http quality-value)
        (http assertion)
        (xunit))

(assert-parsing-successfully qvalue "0" '(#\0 ()))
(assert-parsing-successfully qvalue "0.0" '(#\0 ((#\. (#\0)))))
(assert-parsing-successfully qvalue "0.00" '(#\0 ((#\. (#\0 #\0)))))
(assert-parsing-successfully qvalue "0.000" '(#\0 ((#\. (#\0 #\0 #\0)))))
(assert-parsing-successfully qvalue "0.1" '(#\0 ((#\. (#\1)))))
(assert-parsing-successfully qvalue "0.25" '(#\0 ((#\. (#\2 #\5)))))
(assert-parsing-successfully qvalue "0.999" '(#\0 ((#\. (#\9 #\9 #\9)))))
(assert-parsing-successfully qvalue "1" '(#\1 ()))
(assert-parsing-successfully qvalue "1.0" '(#\1 ((#\. (#\0)))))
(assert-parsing-successfully qvalue "1.00" '(#\1 ((#\. (#\0 #\0)))))
(assert-parsing-successfully qvalue "1.000" '(#\1 ((#\. (#\0 #\0 #\0)))))

(report)
