# CSE 130 Section Notes 1/24/2014
# Alexander Bakst

# Higher Order Functions

Common pattern in (functional) programming: 

"Don't repeat yourself!"

- `evens: int list -> int list` 
   take a list as input and return the same list without any odd elements

- `to_odds: int list -> int list`
   take a list as input and return a list of the same length but with only odd
   elements (in other words, add 1 to each even element)

- `uppercase: char list -> char list` 
   given a list of characters, return the same list with each character replaced
   with its uppercase version (Char.uppercase)

  

- map, filter, fold
  
# What about other types?

- We already saw `'a maybe` and wrote a function to "lift" ordinary
  functions like `(+)` _into_ `int maybe`:
  
    let maybeOp x y f = match (x, y) with
                        | (Just x', Just y') -> Just (f x' y')
                        | _                  -> Nothing

- If we look at `'a maybe` as a container (like lists), we can write `map`:

# Trees

- More general than just lists, let's look at binary trees:

    type 'a tree = Leaf | Node of ('a tree * 'a * 'a tree)
  
- Can we define `tree_map`? `tree_filter`? `tree_fold`? What
  should these functions do?
   
    
