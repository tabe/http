(library (http header-field warning)
  (export Warning)
  (import (rnrs (6))
          (http abnf)
          (only (http basic-rule) quoted-string)
          (only (http date-time) HTTP-date)
          (only (http header-field basic-rule) pseudonym)
          (only (http uri host) host)
          (only (http uri port) port))

  ;;; 14.46 Warning

  ;; warn-code  = 3DIGIT
  (define warn-code (rep= 3 DIGIT))

  ;; warn-agent = ( host [ ":" port ] ) | pseudonym
  ;;                 ; the name or pseudonym of the server adding
  ;;                 ; the Warning header, for use in debugging
  (define warn-agent
    (bar (seq host (opt (seq (char->rule #\:) port)))
         pseudonym))

  ;; warn-text  = quoted-string
  (define warn-text quoted-string)

  ;; warn-date  = <"> HTTP-date <">
  (define warn-date (seq DQ HTTP-date DQ))

  ;; warning-value = warn-code SP warn-agent SP warn-text
  ;;                                       [SP warn-date]
  (define warning-value
    (seq warn-code SP warn-agent SP warn-text (opt (seq SP warn-date))))

  ;; Warning    = "Warning" ":" 1#warning-value
  (define Warning
    (seq (string->rule "Warning") (char->rule #\:) (num+ warning-value)))

)
