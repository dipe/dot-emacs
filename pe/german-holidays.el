;; deutsche Feiertage
(setq calendar-day-name-array
      ["Sonntag" "Montag" "Dienstag" "Mittwoch"
       "Donnerstag" "Freitag" "Samstag"])
(setq calendar-month-name-array
      ["Januar" "Februar" "März" "April" "Mai" "Juni"
       "Juli" "August" "September" "Oktober" "November" "Dezember"])
(setq solar-n-hemi-seasons
      '("Frühlingsanfang" "Sommeranfang" "Herbstanfang" "Winteranfang"))

(setq general-holidays
      '((holiday-fixed 1 1 "Neujahr")
	(holiday-fixed 5 1 "1. Mai")
	(holiday-fixed 10 3 "Tag der Deutschen Einheit")))

(setq christian-holidays
      '((holiday-float 12 0 -4 "1. Advent")
	(holiday-float 12 0 -3 "2. Advent")
	(holiday-float 12 0 -2 "3. Advent")
	(holiday-float 12 0 -1 "4. Advent")
	(holiday-fixed 12 25 "1. Weihnachtstag")
	(holiday-fixed 12 26 "2. Weihnachtstag")
	(holiday-fixed 1 6 "Heilige Drei Könige")
	;; Date of Easter calculation taken from holidays.el.
	(let* ((century (1+ (/ displayed-year 100)))
	       (shifted-epact (% (+ 14 (* 11 (% displayed-year 19))
				    (- (/ (* 3 century) 4))
				    (/ (+ 5 (* 8 century)) 25)
				    (* 30 century))
				 30))
	       (adjusted-epact (if (or (= shifted-epact 0)
				       (and (= shifted-epact 1)
					    (< 10 (% displayed-year 19))))
				   (1+ shifted-epact)
				 shifted-epact))
	       (paschal-moon (- (calendar-absolute-from-gregorian
				 (list 4 19 displayed-year))
				adjusted-epact))
	       (easter (calendar-dayname-on-or-before 0 (+ paschal-moon 7))))
	  (filter-visible-calendar-holidays
	   (mapcar
	    (lambda (l)
	      (list (calendar-gregorian-from-absolute (+ easter (car l)))
		    (nth 1 l)))
	    '(
	      ;;(-48 "Rosenmontag")
	      ( -2 "Karfreitag")
	      (  0 "Ostersonntag")
	      ( +1 "Ostermontag")
	      (+39 "Christi Himmelfahrt")
	      (+49 "Pfingstsonntag")
	      (+50 "Pfingstmontag")
	      (+60 "Fronleichnam")))))
	;;(holiday-fixed 8 15 "Mariä Himmelfahrt")
	(holiday-fixed 11 1 "Allerheiligen")
	;;(holiday-float 11 3 1 "Buß- und Bettag" 16)
	(holiday-float 11 0 1 "Totensonntag" 20)))

(setq calendar-holidays
      (append general-holidays local-holidays other-holidays
	      christian-holidays solar-holidays))
(provide 'german-holidays)
