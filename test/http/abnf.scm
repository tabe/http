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
(assert-parsing-successfully HEX "A" #\A)
(assert-parsing-successfully HEX "B" #\B)
(assert-parsing-successfully HEX "C" #\C)
(assert-parsing-successfully HEX "D" #\D)
(assert-parsing-successfully HEX "E" #\E)
(assert-parsing-successfully HEX "F" #\F)
(assert-parsing-successfully HEX "a" #\a)
(assert-parsing-successfully HEX "b" #\b)
(assert-parsing-successfully HEX "c" #\c)
(assert-parsing-successfully HEX "d" #\d)
(assert-parsing-successfully HEX "e" #\e)
(assert-parsing-successfully HEX "f" #\f)
(assert-parsing-successfully HEX "0" #\0)
(assert-parsing-successfully HEX "1" #\1)
(assert-parsing-successfully HEX "2" #\2)
(assert-parsing-successfully HEX "3" #\3)
(assert-parsing-successfully HEX "4" #\4)
(assert-parsing-successfully HEX "5" #\5)
(assert-parsing-successfully HEX "6" #\6)
(assert-parsing-successfully HEX "7" #\7)
(assert-parsing-successfully HEX "8" #\8)
(assert-parsing-successfully HEX "9" #\9)

(report)
