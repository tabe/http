(library (http header-field pragma)
  (export Pragma)
  (import (rnrs (6))
          (http abnf)
          (only (http basic-rule) quoted-string token))

  ;;; 14.32 Pragma

  ;; extension-pragma  = token [ "=" ( token | quoted-string ) ]
  (define extension-pragma
    (seq token (opt (seq (char->rule #\=) (bar token quoted-string)))))

  ;; pragma-directive  = "no-cache" | extension-pragma
  (define pragma-directive (bar (string->rule "no-cache") extension-pragma))

  ;; Pragma            = "Pragma" ":" 1#pragma-directive
  (define Pragma (seq (string->rule "Pragma") (char->rule #\:) (num+ pragma-directive)))

)
