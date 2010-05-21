#!r6rs

(import (rnrs (6))
        (http header-field accept)
        (http assertion)
        (xunit))

(assert-parsing-successfully Accept
                             "Accept: audio/*; q=0.2, audio/basic"
                             `(,(string->list "Accept")
                               #\:
                               ((((,(string->list "audio") #\/ #\*) ()) ((#\; (#\space) #\q #\= (#\0 ((#\. (#\2)))) ())))
                                (((,(string->list "audio") #\/ ,(string->list "basic")) ()) ())))
                             )
(assert-parsing-successfully Accept
                             (string-append "Accept: text/plain; q=0.5, text/html,\r\n"
                                            "    text/x-dvi; q=0.8, text/x-c\t\t")
                             `(,(string->list "Accept")
                               #\:
                               (((((#\t #\e #\x #\t) #\/ (#\p #\l #\a #\i #\n)) ()) ((#\; (#\space) #\q #\= (#\0 ((#\. (#\5)))) ())))
                                ((((#\t #\e #\x #\t) #\/ (#\h #\t #\m #\l)) ()) ())
                                ((((#\t #\e #\x #\t) #\/ (#\x #\- #\d #\v #\i)) ()) ((#\; (#\space) #\q #\= (#\0 ((#\. (#\8)))) ())))
                                ((((#\t #\e #\x #\t) #\/ (#\x #\- #\c)) ()) ())))
                             )
(assert-parsing-successfully Accept
                             "Accept: text/*, text/html, text/html;level=1, */*"
                             `(,(string->list "Accept")
                               #\:
                               ((((,(string->list "text") #\/ #\*) ()) ())
                                (((,(string->list "text") #\/ ,(string->list "html")) ()) ())
                                (((,(string->list "text") #\/ ,(string->list "html")) ((#\; (,(string->list "level") #\= ,(string->list "1"))))) ())
                                (((#\* #\/ #\*) ()) ())))
                             )
(assert-parsing-successfully Accept
                             (string-append "Accept: text/*;q=0.3, text/html;q=0.7, text/html;level=1,\r\n"
                                            "        text/html;level=2;q=0.4, */*;q=0.5")
                             '((#\A #\c #\c #\e #\p #\t)
                               #\:
                               (((((#\t #\e #\x #\t) #\/ #\*) ((#\; ((#\q) #\= (#\0 #\. #\3))))) ())
                                ((((#\t #\e #\x #\t) #\/ (#\h #\t #\m #\l)) ((#\; ((#\q) #\= (#\0 #\. #\7))))) ())
                                ((((#\t #\e #\x #\t) #\/ (#\h #\t #\m #\l)) ((#\; ((#\l #\e #\v #\e #\l) #\= (#\1))))) ())
                                ((((#\t #\e #\x #\t) #\/ (#\h #\t #\m #\l)) ((#\; ((#\l #\e #\v #\e #\l) #\= (#\2))) (#\; ((#\q) #\= (#\0 #\. #\4))))) ())
                                (((#\* #\/ #\*) ((#\; ((#\q) #\= (#\0 #\. #\5))))) ())))

                             )

(report)
