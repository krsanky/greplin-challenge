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
;; http://challenge.greplin.com/static/gettysburg.txt

(set! *warn-on-reflection* true)

(def *getty-txt* (.toLowerCase (slurp "gettysburg.txt")))

;;i think partition is the slow part...
(defn find-rev-seq [s len]
  "find one reversible seq of length 'len' in 's'"
  (let [sub-seqs (partition len 1 s)] ;;get all consecutive seqs of length 'len' in 's'
    (let [ret (first (filter #(= % (reverse %)) sub-seqs))]
      ;;(println (str ret ":" len))
      ret)))

(defn longest-rev-seq [s]
  "find the longest reversible sub-seq"
  (loop [len (count s)]
    (let [sub-s (find-rev-seq s len)]
      (if sub-s
        sub-s
        (recur (dec len))))))

(defn run1 []
  (println (longest-rev-seq *getty-txt*)))



