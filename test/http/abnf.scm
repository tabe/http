#!r6rs

(import (rnrs (6))
        (http abnf)
        (http assertion)
        (xunit))

(assert-parsing-successfully DIGIT "0" #\0)
(assert-parsing-successfully DIGIT "1" #\1)
(assert-parsing-successfully DIGIT "2" #\2)
(assert-parsing-successfully DIGIT "3" #\3)
(assert-parsing-successfully DIGIT "4" #\4)
(assert-parsing-successfully DIGIT "5" #\5)
(assert-parsing-successfully DIGIT "6" #\6)
(assert-parsing-successfully DIGIT "7" #\7)
(assert-parsing-successfully DIGIT "8" #\8)
(assert-parsing-successfully DIGIT "9" #\9)

(report)
