(* append lst1 to lst2, should behave like @ *)

(* function : argument type -> return type *)

(* append [1;2;3] [4;5;6] = [1;2;3;4;5;6] *)
(* append []      [4;5;6] = [4;5;6]       *)
(* append [1;2;3] []      = [1;2;3]       *)
(* append []      []      = []            *)

(* append : 'a list -> 'a list -> 'a list *)
let rec append lst1 lst2 =
  match lst1 with
    | []      -> lst2
    | h1::tl1 -> h1 :: append tl1 lst2
    
(* (lst1, lst2) : ('a list) * ('a list) *)
let rec append2 lst1 lst2 =
  match (lst1, lst2) with
    | ([]    , [])     -> ...
    | (h::t  , [])     ->
    | ([]    , h::t)   ->
    | (h1::t1, h2::t2) ->

let rec buggyappend lst1 lst2 =
  match lst1 with
    | []      -> let _ = print_string "first case\n" in lst2
    | h1::tl1 -> let _ = print_string ((string_of_int h1)^"\n") in
                 let _ = print_string "second case\n" in
                 buggyappend tl1 lst2

