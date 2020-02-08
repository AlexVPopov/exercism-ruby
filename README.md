# Solutions to Ruby problems on [exercism.io](https://exercism.io/)

## hamming

- `Enumerable#zip` combines corresponding elements into arrays
- `Enumerable#count` with block counts the elements, for which the given block returns
   true

## accumulate

- `Object#to_enum` - Creates a new Enumerator which will enumerate by calling method on obj, passing args    if any. What was yielded by method becomes values of enumerator.
- `Kernel#__method__` - Returns the name at the definition of the current method as a Symbol. If called      outside of a method, it returns nil.

## acronym

- `String#scan` may be used as a way to split a string according to a particular pattern.

## isogram

- `Object#!~` - Returns true if two objects do not match (using the =~ method), otherwise
  false.
- Use capture groups on a given regex inside the regex, e.g.:
  ```ruby
  "foo foo bar bar".scan(/(\w+) \1/) #=> [["foo"], ["bar"]]
  ```

## meetup

- Given year and month, to get the date of the last date of the month, use `-1`, e.g.
  `Date.new(2016, 2, -1).day`

## sum-of-multiples

- `Enumerable#flat_map` Returns a new array with the concatenated results of running block once for every element in enum.

## grade-school

- `Array#bsearch` and `Array#bsearch_index`
