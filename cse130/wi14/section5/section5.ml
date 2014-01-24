
let foo x = 3 + x
let foo y = let x = foo y in
                print_string ("got "^string_of_int x)

(* Association Lists *)
                  
(* List of (key,value) pairs*)
                 
(* (key, something) list *)
let alist0 = [(1, "cat");(2, "dog")]
 
(* returns true iff there is a pair, (k,v), in alist
   such that k = key *)
let rec contains key alst =
  match alst with
    | []       -> false
    | (k,v)::t ->
      if key = k then
        true
      else
        contains key t

let insert1 key value alst =
  (key, value)::alst


(* replace: int -> 'a -> (int * 'a) list -> (int * 'a) list *)

(* takes a key, value, and alist, returns a new
   alist with (k,v') entries replaced with (k,v) *)
let rec replace k v alst =
  match alst with
    | []          -> []
    | (k',v')::tl ->
      if k = k'
      then (k,v)::tl
      else (k',v')::replace k v tl

let rec insert3 k v alst =
  match alst with
    | []          -> [(k,v)]
    | (k',v')::tl ->
      if k = k'
      then (k',v)::tl
      else (k',v')::insert3 k v tl

(*
   insert (key,value) into alst. if alst
   already has a (key, value'), then replace
   value' with value
*)
let insert2 key value alst =
  if contains key alst then
    replace key value alst
  else
    (key, value)::alst

type 'a maybe = Nothing 
              | Just of 'a
  
(* lookup 1 [(2, "foo"), (1, "bar")] == "bar" *)
(* lookup k [] ? *)
(* lookup k [(k, v)] ? *)
(* lookup k [(j, v);(m, v)] ? *)
let rec lookup (key:int) (alst : (int * 'a) list) =
  match alst with
    | []       -> Nothing
    | (x,y)::t -> if x = key then Just y else lookup key t
      
(*
  safeHead : 'a list -> Something else
  where "something else " signifies that either Nothing or
  Some list may be returned (and thus safeHead doesn't crash)
*)

let safeHead lst =
  match lst with
    | []     -> Nothing
    | h :: t -> Just h

(**
 maybeOp : 'a maybe -> 'b maybe -> ('a -> 'b -> 'c) -> 'c maybe
*)
let maybeOp x y f = 
  match (x,y) with
    | Just x', Just y' -> Just (f x' y')
    | _                -> Nothing
      
let const x y = y

let maybePlus (a:int maybe) (b:int maybe) =
  maybeOp a b (+)
  (* match (a,b) with *)
    (* | Nothing, Nothing -> Nothing *)
    (* | Nothing, Just y  -> Nothing *)
    (* | Just x , Nothing -> Nothing *)
    (* | Just x , Just y  -> Just (x + y) *)
      
let maybeCarat a b =
  maybeOp a b (^)
  (* match (a,b) with *)
  (*   | Nothing, Nothing -> Nothing *)
  (*   | Nothing, Just y  -> Nothing *)
  (*   | Just x , Nothing -> Nothing *)
  (*   | Just x, Just y   -> Just (x ^ y) *)



let rec sumList1 lst =
  match lst with
    | []     -> 0
    | h :: t -> h + sumList1 t

let sumList2 lst =
  let rec sumList lst acc =
    match lst with
      | []     -> acc
      | h :: t -> sumList t (h + acc)
  in sumList lst 0

let length2 lst =
  let rec helper lst' acc =
    match lst' with
      | []     -> acc
      | h :: t -> helper t (1 + acc) 
  in helper lst 0
  
let rec sumList lst =
  match lst with
    | [] -> 0
    | h::t -> h + sumList t
      (* recursively builds up h1 + h2 + h3 .. *)
      
let sumList2 lst =
  let helper lst acc =
    match lst with
      | []     -> acc
      | h :: t -> helper t (h + acc)
  in helper lst 0
(* acc stores value "so far" *)
