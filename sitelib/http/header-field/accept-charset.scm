(library (http header-field accept-charset)
  (export Accept-Charset)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule)
          (http character-set)
          (http quality-value))

  ;;; 14.2 Accept-Charset

  (define Accept-Charset
    (seq (string->rule "Accept-Charset")
         (char->rule #\:)
         (num+
          (seq
           (bar charset (char->rule #\*))
           (opt
            (seq
             (char->rule #\;)
             *LWS ; implied *LWS
             (char->rule #\q)
             (char->rule #\=)
             qvalue))))))

)
