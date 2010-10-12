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

(def *numbers* (sort (for [n (.split (slurp "numbers.csv") ",")]
                       (Integer/parseInt (.trim n)))))

(defn sum-in-seq [seq-sum match-seq]
  "this sums the seq-sum items, and checks if the value is in match-seq"
  (let [sum (reduce #(+ %1 %2) seq-sum)]
    (some #(= sum %) match-seq)))

(defn find-subsets [s len]
  "find subsets of lst of count(len) that summ up to
   to equal an elem. of 's'"
  (let [results (ref [])]
    (doseq [comb (combinations s len)]
      (if (sum-in-seq comb s)
        (dosync (alter results #(conj % comb)))))
    @results))

(defn find-all-subsets [s]
  "go thru 's' finding all combinations of numbers
   that added up equal another number in s"
  (let [results (ref [])]
    (loop [len (count s)]
      (if (<= len 1)
        nil
        (let [subs (find-subsets s len)]
          (println (str len ": " subs))
          (dosync (alter results #(concat % subs)))
          (recur (dec len)))))
    @results))


(defn run []
  (println "level 3")
  ;;(def my-subs (find-all-subsets (range 10)))
  (def my-subs (find-all-subsets *numbers*))
  (println (str "answer: " (count my-subs))))



