#!r6rs

(import (rnrs (6))
        (http message-header)
        (http assertion)
        (xunit))

(assert-parsing-successfully message-header
                             "Content-Length: 777"
                             `(,(string->list "Content-Length")
                               #\:
                               (((() (#\space))
                                 ,@(string->list "777")))))
(assert-parsing-successfully message-header
                             (string-append "Accept: text/plain; q=0.5, text/html,\r\n"
                                            "    text/x-dvi; q=0.8, text/x-c\t\t")
                             `(,(string->list "Accept")
                               #\:
                               (((() (#\space))
                                 ,@(string->list "text/plain;")
                                 (() (#\space))
                                 ,@(string->list "q=0.5,")
                                 (() (#\space))
                                 ,@(string->list "text/html,")
                                 (((#\return #\linefeed)) (#\space #\space #\space #\space))
                                 ,@(string->list "text/x-dvi;")
                                 (() (#\space))
                                 ,@(string->list "q=0.8,")
                                 (() (#\space))
                                 ,@(string->list "text/x-c")
                                 (() (#\tab #\tab))))))

(report)
