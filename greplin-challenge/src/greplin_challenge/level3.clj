(ns greplin-challenge.level3
  (:use clojure.contrib.combinatorics))

;; Level 3
;;
;; ----------------------------------------
;;
;; Congratulations.  You have reached the final level.
;;
;; For the final task, you must find all subsets of an array
;; where the largest number is the sum of the remaining numbers.
;; For example, for an input of:
;;
;; (1, 2, 3, 4, 6)
;;
;; the subsets would be
;;
;; 1 + 2 = 3
;; 1 + 3 = 4
;; 2 + 4 = 6
;; 1 + 2 + 3 = 6
;;
;; Here is the list of numbers you should run your code on.
;; The password is the number of subsets.  In the above case the
;; answer would be 4.

(def numbers (.toLowerCase (slurp "numbers.csv")))

(println "level 3")
