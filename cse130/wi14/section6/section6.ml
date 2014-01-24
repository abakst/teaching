let rec evens lst =
  match lst with
    | []   -> []
    | h::t -> 
      if h mod 2 = 0 then
        h :: evens t
      else
        evens t

let evens2 lst = 
  let isEven x = x mod 2 = 0
  in List.filter isEven lst

let rec odds lst =
  match lst with
    | []   -> []
    | h::t -> 
      if (fun h -> h mod 2 <> 0) h then
        h :: odds t
      else
        odds t
  
let odds2 lst =
  let isOdd x = x mod 2 <> 0
  in List.filter isOdd lst

(* List.filter takes as arguments: 
  1) a function that takes an elt and returns a bool,
  2) a list
   and returns:
  3) a list (where all elements match the function supplied in (1)).  
*)

(* List.filter : ('a -> bool) -> 'a list -> 'a list *)

(* List.map *)
let rec map f lst =
  match lst with
    | [] -> []
    | h :: t -> f h :: map f t 
      
let to_odds2 lst =
  let mapFn h = if h mod 2 = 0 then h + 1 else h
  in map mapFn lst

let rec to_odds lst = 
  match lst with
    | []   -> []
    | h::t -> 
      if h mod 2 = 0 then 1 + h :: to_odds t else h :: to_odds t
        
let rec to_evens lst =
  match lst with
    | [] -> []
    | h :: t -> 
      if h mod 2 = 0
      then h :: to_evens t
      else h + 1 :: to_evens t

let uppercase lst = 
  map Char.uppercase lst
    
(* --- Trees --- *)
    
type 'a tree = Empty | Tree of ('a tree * 'a * 'a tree)
      
let rec tree_map f t =
  match t with
    | Empty          -> Empty
    | Tree (l, k, r) -> Tree (tree_map f l, f k, tree_map f r)
    
let rec tree_inc t =
  match t with 
    | Empty          -> Empty
    | Tree (l, k, r) -> Tree (tree_inc l, k+1, tree_inc r)
      
let tree_inc2 = tree_map (fun x -> x + 1)

let tree_inc3 = tree_map (+)

let tree_inc4 = tree_map ((+) 1)

let rec tree_dec t =
  match t with 
    | Empty          -> Empty
    | Tree (l, k, r) -> Tree (tree_dec l, k-1, tree_dec r)

let tree_dec2 = tree_map (fun x -> x - 1)

let rec tree_upper t =
  match t with 
    | Empty          -> Empty
    | Tree (l, k, r) -> Tree (tree_upper l, Char.uppercase k, tree_upper r)

let tree_upper2 = tree_map (Char.uppercase)
      

let foo x = foo (x + 1)
