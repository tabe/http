(library (http uri host)
  (export host)
  (import (rnrs (6))
          (http abnf)
          (http uri basic-rule))

  ;; dec-octet     = DIGIT                 ; 0-9
  ;;               / %x31-39 DIGIT         ; 10-99
  ;;               / "1" 2DIGIT            ; 100-199
  ;;               / "2" %x30-34 DIGIT     ; 200-249
  ;;               / "25" %x30-35          ; 250-255
  (define dec-octet
    (bar (seq (string->rule "25") (pair->rule '(#x30 . #x35)))
         (seq (char->rule #\2) (pair->rule '(#x30 . #x34)) DIGIT)
         (seq (char->rule #\1) (rep= 2 DIGIT))
         (seq (pair->rule '(#x31 . #x39)) DIGIT)
         DIGIT
         ))

  ;; IPv4address   = dec-octet "." dec-octet "." dec-octet "." dec-octet
  (define IPv4address
    (let ((DOT (char->rule #\.)))
      (seq dec-octet DOT dec-octet DOT dec-octet DOT dec-octet)))

  ;; IPvFuture     = "v" 1*HEXDIG "." 1*( unreserved / sub-delims / ":" )
  (define IPvFuture
    (seq (char->rule #\v)
         (rep+ HEX)
         (char->rule #\.)
         (rep+ (bar unreserved sub-delims (char->rule #\:)))))

  (define h16 (rep 1 4 HEX))

  (define ls32 (bar (seq h16 (char->rule #\:) h16) IPv4address))

  (define IPv6address
    (let* ((: (char->rule #\:))
           (:: (string->rule "::"))
           (h16-: (seq h16 :)))
      (bar (seq (rep= 6 h16-:) ls32)
           (seq :: (rep= 5 h16-:) ls32)
           (seq (opt h16) :: (rep= 4 h16-:) ls32)
           (seq (opt (seq (rep 1 #t h16-:) h16)) :: (rep= 3 h16-:) ls32)
           (seq (opt (seq (rep 2 #t h16-:) h16)) :: (rep= 2 h16-:) ls32)
           (seq (opt (seq (rep 3 #t h16-:) h16)) :: h16-: ls32)
           (seq (opt (seq (rep 4 #t h16-:) h16)) :: ls32)
           (seq (opt (seq (rep 5 #t h16-:) h16)) :: h16)
           (seq (opt (seq (rep 6 #t h16-:) h16)) ::)
           )))

  ;; IP-literal    = "[" ( IPv6address / IPvFuture  ) "]"
  (define IP-literal
    (seq (char->rule #\[)
         (bar IPv6address IPvFuture)
         (char->rule #\])))

  (define host
    (bar IP-literal IPv4address reg-name))

)
