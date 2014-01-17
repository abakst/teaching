type 'a node = Nil | Combine of ('a * 'a node)
    
let duplicate_and_insert k n =
  Combine (k, Combine (k, n))

(* type 'a list = [] | (::) of ('a * 'a list)
   [1;2;3;4] 
*)
    
(* type attrib = Name of string | Age of int ... *)

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
  

(* let rec lookup key alst        =  *)
      
(* 
  safeHead : 'a list -> Something else 
  where "something else " signifies that either Nothing or 
  Some list may be returned (and thus safeHead doesn't crash)
*)

  
