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

(def *numbers* (sort (for [n (.split (slurp "numbers.csv") ",")] (Integer/parseInt (.trim n)))))

(defn seq-sum-in-numbers [s]
  "this sums the seq items, and checks if the value is in *numbers*"
  (let [sum (reduce #(+ %1 %2) s)]
    (some #(= sum %) *numbers*)))


(defn find-subsets [len]
  "find subsets of lst of count(len) that summ up to
   to equal an elem. of *numbers*"
  (let [combs (combinations *numbers* len)]
    ;;filter the combs. to ones that add up to a number in *numbers*
    (filter seq-sum-in-numbers combs)))


(defn find-all-subsets []
  "go thru *numbers* finding all combinations of numbers of
   length (count *numbers*)-1 to 2"
  (let [results (ref [])]
    (loop [len (count *numbers*)]
      (if (<= len 2)
        nil
        (let [subs (find-subsets len)]
          (println (str len ": " subs))
          (dosync (alter results #(concat % subs)))
          (recur (dec len)))))
    @results))



(println "level 3")

(def my-subs (find-all-subsets))

(println "my answer is off by one .... must be some obvious mistake ...")
(println (str "answer: " (count my-subs)))


