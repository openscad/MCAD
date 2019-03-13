
include<MCAD / text / string.scad>;

// Uncomment this bloc to see how to use this library.

// strToInt(string [,base])

// Resume : Converts a number in string.
// string : The string you wants to converts.
// base (optional) : The base conversion of the number : 2 for binay, 10 for
// decimal (default), 16 for hexadecimal.
echo("*** strToInt() ***");
echo(strToInt("491585"));
echo(strToInt("01110", 2));
echo(strToInt("D5A4", 16));
echo(strToInt("-15"));
echo(strToInt("-5") + strToInt("10") + 5);

// strcat(vector [,insert])

// Resume : Concatenates a vector of words into a string.
// vector : A vector of string.
// insert (optional) : A string which will added between each words.
echo("*** strcat() ***");
v_data = [ "OpenScad", "is", "a", "free", "CAD", "software." ];
echo(strcat(v_data));      // ECHO: "OpenScadisafreeCADsoftware."
echo(strcat(v_data, " ")); // ECHO: "OpenScad is a free CAD software."

// substr(str, pos [,length])

// Resume : Substract a substring from a bigger string.
// str : The original string
// pos : The index of the position where the substring will begin.
// length (optional) : The length of the substring. If not specified, the
// substring will continue until the end of the string.
echo("*** substr() ***");
str = "OpenScad is a free CAD software.";
echo(str);                 // ECHO: "OpenScad is a free CAD software."
echo(substr(str, 0, 11));  // ECHO: "OpenScad is"
echo(substr(str, 12));     // ECHO: "a free CAD software."
echo(substr(str, 12, 10)); // ECHO: "a free CAD"

// fill(string, occurrences)

// Resume : Fill a string with several characters (or strings).
// string : the character or string which will be copied.
// occurrences : The number of occurences of the string.
echo("*** Fill() ***");
echo(fill("0", 4));   // ECHO: "0000"
echo(fill("hey", 3)); // ECHO: "heyheyhey"

// getsplit(string, index [,separator])

// Resume : Split a string in several words.
// string : The original string.
// index : The index of the word to get.
// separator : The separator which cut the string (default is " ").
// Note : Nowadays it's impossible to get a vector of words because we can't
// append data in a vector.
echo("*** getsplit() ***");
echo(getsplit(str));
echo(getsplit(str, 3));
echo(getsplit("123, 456, 789", 1, ", "));