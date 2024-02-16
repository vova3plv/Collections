# Collections

Application for different operations with collections.

## Stack

 - Swift
 - UIKit
 - Auto Layout
 - GCD
 - XCTest
 - MVC

## Required functionality

Application with different screens for working with different types of collections.

 - First screen: operations with an array.
Generate an array of integers with 10_000_000 elements from 0 to 9_999_999 and display the execution time.

Operations to perform:

insert at the beginning of an array of 1000 elements (from 0 to 999 for example) one by one / at once;
insert in the middle of an array of 1000 elements one-by-one / at once;
append to the end of an array of 1000 elements one-by-one / at once;
remove at the beginning 1000 elements one-by-one / at once;
remove in the middle 1000 elements one-by-one / at once;
remove at the end 1000 elements one-by-one / at once.
	Display the execution time of each operation.

	Add an activity indicator for each long-running operation.

 - Second screen: operations with a set.
Add two text fields for user input and buttons for operations with sets.

Operations to perform:

display all matching characters from text fields.
display all characters that do not match in input fields.
display all unique characters from the first text field that do not match in text fields.

 - Third screen: operations with a dictionary. 
Generate an array with 10_000_000 elements of improvised contact structs. String name and String phone.

Generate a dictionary with 10_000_000 elements of improvised contacts. Name as a key and phone as a value.

Name format example: “Name\(index)”.

Operations on both collections:

Find the first element (“Name0”)
Find the last element (“Name9999999”)
Search for a non-existing element
	Display the execution time of each operation.

	Add an activity indicator for long-running operations.
