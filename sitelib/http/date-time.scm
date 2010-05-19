(library (http date-time)
  (export HTTP-date
          delta-seconds)
  (import (rnrs (6))
          (http abnf))

  (define comma (char->rule #\,))

  (define GMT (string->rule "GMT"))

  (define DIGIT2 (rep 2 2 DIGIT))
  (define DIGIT4 (rep 4 4 DIGIT))

  (define wkday
    (apply bar (map string->rule '("Mon" "Tue" "Wed" "Thu" "Fri" "Sat" "Sun"))))

  (define weekday
    (apply bar (map string->rule '("Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday" "Sunday"))))

  (define month
    (apply bar (map string->rule '("Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec"))))

  (define date1
    (seq DIGIT2 SP month SP DIGIT4))

  (define date2
    (let ((- (char->rule #\-)))
      (seq DIGIT2 - month - DIGIT2)))

  (define date3
    (seq month
         SP
         (bar
          DIGIT2
          (seq SP
               (rep 1 1 DIGIT)))))

  (define time
    (let ((: (char->rule #\:)))
      (seq DIGIT2 : DIGIT2 : DIGIT2)))

  (define rfc1123-date
    (seq wkday comma SP date1 SP time SP GMT))

  (define rfc850-date
    (seq weekday comma SP date2 SP time SP GMT))

  (define asctime-date
    (seq wkday SP date3 SP time SP DIGIT4))

  (define HTTP-date
    (bar rfc1123-date rfc850-date asctime-date))

  (define delta-seconds
    (rep 1 #t DIGIT))

)
