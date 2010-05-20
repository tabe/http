(library (http range-unit)
  (export range-unit)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule))

  ;;; 3.12 Range Units
  (define bytes-unit (string->rule "bytes"))

  (define other-range-unit token)

  (define range-unit (bar bytes-unit other-range-unit))

)

