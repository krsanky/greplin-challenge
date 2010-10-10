(ns greplin-challenge.level1)

;; Level 1
;;
;; ----------------------------------------
;;
;; Embedded in this block of text is the password for level 2.
;; The password is the longest substring that is the same in reverse.
;;
;; As an example, if the input was "I like racecars that go fast"
;; the password would be "racecar".
;;
;; ---- notes:
;;  try leavinge the strings as seqs, to see if it's faster.

(def getty-txt (.toLowerCase (slurp "gettysburg.txt")))

(defn substrs-of-len [txt len]
  "get all consecutive strings of length 'len' in 'txt'
   returns a list of strings"
  (map (fn [s] (apply str s)) (partition len 1 txt))) ;;change this to clojure's lambda shorthand ...

(defn str-is-rev? [s] ;; what if s is nil ?
  "tests if the string equals the reverse string, (and returns it if true)"
  (let [rev-str (apply str (reverse s))]
    (if (= s rev-str)
      true
      false)))

(defn find-rev-str [txt len]
  "find a reversible string of length 'len' in 'txt'"
  (let [strs (substrs-of-len txt len)]
    (let [ret (first (filter str-is-rev? strs))]
      (println (str ret ":" len))
      ret)))

(defn longest-rev-str [txt]
  "find the longest reversible substring"
  (loop [len (count txt)]
    (let [str (find-rev-str txt len)]
      (if str
        str
        (recur (dec len))))))
(println (longest-rev-str getty-txt))
;;(println (longest-rev-str "abba123"))

;; (print (str getty-text "\n"))
;; (substrs-of-len "asdasdasdABBAasdasdasd" 4)
;; (print (str "count:" (count getty-text)))


