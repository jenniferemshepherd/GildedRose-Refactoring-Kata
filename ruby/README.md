Tech test: GildedRose in Ruby
_________________________________

My approach:
1. remove obvious code that is not DRY
2. extract as much 'obvious action' into individual methods, so that the update_quality method is shorter and more readable
3. refactoring methods to ensure they are readable and avoid 'if false' methods
4. start to apply Single Responsibility Principle with AgedBrie
5. Extract Sulfuras
6. Reintroduce code in GildedRose that will update the quality of Sulfuras and AgedBrie
7. Extract all other objects
8. Ensure all objects are feature tested as required in GildedRose

Still to do:
9.  Deal with magic numbers
10. Inherit from BasicItem class
