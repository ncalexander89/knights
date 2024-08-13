**Knight Trevails**

BFS

- Starts with queue stack (starting pos, path)
- Exits when queue is empty
- Empties queue into current pos, path
- Inserts new pos, path if avail
- Keeps iterating until return clause is met new_pos == end_pos

Use instance variables for properties of the object that need to be shared across methods or represent the object's state.
Use local variables for temporary calculations or data specific to a method's scope.
Consider using attr_reader for instance variables you want to expose without allowing external modification, keeping your class encapsulated.
