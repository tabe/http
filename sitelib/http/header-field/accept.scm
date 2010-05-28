(library (http header-field accept)
  (export Accept)
  (import (rnrs (6))
          (http abnf)
          (only (http basic-rule) quoted-string token)
          (http media-type)
          (http parameter)
          (http quality-value))

  ;;; 14.1 Accept

  (define accept-extension
    (seq (char->rule #\;)
         token
         (opt
          (seq (char->rule #\=)
               (bar token quoted-string)))))

  (define accept-params
    (seq (char->rule #\;)
         *LWS ; implied *LWS
         (char->rule #\q)
         (char->rule #\=)
         qvalue
         (rep* accept-extension)))

  (define media-range
    (let ((/ (char->rule #\/))
          (* (char->rule #\*)))
      (seq
       (bar
        (string->rule "*/*") 
        (seq type / *)
        (seq type / subtype))
       (rep*
        (seq (char->rule #\;) parameter)))))

  (define Accept
    (seq (string->rule "Accept")
         (char->rule #\:)
         (num*
          (seq media-range (opt accept-params)))))

)
