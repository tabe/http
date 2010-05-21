(library (http header-field accept-encoding)
  (export Accept-Encoding)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule)
          (http content-coding)
          (http quality-value))

  ;;; 14.2 Accept-Encoding

  (define configs (bar content-coding (char->rule #\*)))

  (define Accept-Encoding
    (seq (string->rule "Accept-Encoding")
         (char->rule #\:)
         (num+
          (seq configs
               (opt
                (seq
                 (char->rule #\;)
                 *LWS ; implied *LWS
                 (char->rule #\q)
                 (char->rule #\=)
                 qvalue))))))

)
