(library (http header-field accept-language)
  (export Accept-Language)
  (import (rnrs (6))
          (http abnf)
          (http quality-value))

  ;;; 14.4 Accept-Language

  (define language-range
    (bar
     (seq
      (rep 1 8 ALPHA)
      (opt
       (seq
        (char->rule #\-)
        (rep 1 8 ALPHA))))
     (char->rule #\*)))

  (define Accept-Language
    (seq (string->rule "Accept-Language")
         (char->rule #\:)
         (num+
          (seq
           language-range
           (opt
            (seq (char->rule #\;)
                 (char->rule #\q)
                 (char->rule #\=)
                 qvalue))))))

)
