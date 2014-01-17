type 'a alist = (int * 'a) list
    
let key (k,v) = k
let valu (k,v) = v
    
let rec insert k v lst = 
  match lst with
    | [] -> [(k, v)]
    | h::t -> 
      if key h = k then
        (k, v)::t
      else
        h :: insert k v t
          
let rec lookup k lst =
  match lst with
    | []   -> failwith ("key (" ^ string_of_int k ^ ") not found!")
    | h::t -> if key h = k then valu h else lookup k t

let l0 = insert 1 "one" []
let l1 = insert 2 "two" l0
let l2 = insert 1 ((lookup 1 l1)^" = yi") l1
  
let v0 = lookup 1 l2
(* let v1 = lookup 3 l2 *)
  
type 'a maybe =  Just of 'a | Nothing

let rec safe_lookup k lst = 
  match lst with
    | []     -> Nothing
    | h :: t -> 
      if key h = k then 
        Just (valu h) 
      else 
        safe_lookup k t
  
let maybe_concat x y = 
  match (x,y) with
    | Nothing, _ | _, Nothing -> Nothing
    | Just x, Just y          -> Just (x^y)

let l0 = insert 1 "one" []
let l1 = insert 2 "two" l0
let v0 = lookup 1 l2
(* let v1 = lookup 3 l2 *)
  
let return x = Just x
 
let bind f x = 
  match x with
    | Nothing -> Nothing
    | Just x' -> Just (f x')


        
