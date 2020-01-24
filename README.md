# Solutions to Ruby problems on [exercism.io](https://exercism.io/)

## hamming

- `Enumerable#zip` combines corresponding elements into arrays
- `Enumerable#count` with block counts the elements, for which the given block returns
   true

## accumulate

- `Object#to_enum` - Creates a new Enumerator which will enumerate by calling method on obj, passing args    if any. What was yielded by method becomes values of enumerator.
- `Kernel#__method__` - Returns the name at the definition of the current method as a Symbol. If called      outside of a method, it returns nil.
