#!r6rs

(import (rnrs (6))
        (http transfer-coding)
        (http assertion)
        (xunit))

(assert-parsing-successfully transfer-coding "chunked")
(assert-parsing-successfully transfer-coding "identity" `(,(string->list "identity") ()))
(assert-parsing-successfully transfer-coding "gzip" `(,(string->list "gzip") ()))
(assert-parsing-successfully transfer-coding "compress" `(,(string->list "compress") ()))
(assert-parsing-successfully transfer-coding "deflate" `(,(string->list "deflate") ()))

(assert-parsing-successfully Chunked-Body
                             (string-append "10\r\n" ; chunk
                                            "0123456789\r\n"
                                            "13\r\n" ; chunk
                                            "Hello, World.\r\n"
                                            "0000\r\n" ; last-chunk
                                            ;; empty trailer
                                            "\r\n"
                                            )
                             '((((#\1 #\0) (()) (#\return #\linefeed)
                                 (#\0 #\1 #\2 #\3 #\4 #\5 #\6 #\7 #\8 #\9) (#\return #\linefeed))
                                ((#\1 #\3) (()) (#\return #\linefeed)
                                 (#\H #\e #\l #\l #\o #\, #\space #\W #\o #\r #\l #\d #\.) (#\return #\linefeed)))
                               ((#\0 #\0 #\0 #\0) (()) (#\return #\linefeed))
                               ()
                               (#\return #\linefeed)))

(report)
