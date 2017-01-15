// Uncomment this bloc to see how to use this library.
/*
	// strToInt(string [,base])

	// Resume : Converts a number in string.
	// string : The string you wants to converts.
	// base (optional) : The base conversion of the number : 2 for binay, 10 for decimal (default), 16 for hexadecimal.
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
	v_data = ["OpenScad", "is", "a", "free", "CAD", "software."];
	echo(strcat(v_data)); // ECHO: "OpenScadisafreeCADsoftware."
	echo(strcat(v_data, " ")); // ECHO: "OpenScad is a free CAD software."
	
	// substr(str, pos [,length])

	// Resume : Substract a substring from a bigger string.
	// str : The original string
	// pos : The index of the position where the substring will begin.
	// length (optional) : The length of the substring. If not specified, the substring will continue until the end of the string.
	echo("*** substr() ***");
	str = "OpenScad is a free CAD software.";
	echo(str); // ECHO: "OpenScad is a free CAD software."
	echo(substr(str, 0, 11)); // ECHO: "OpenScad is"
	echo(substr(str, 12)); // ECHO: "a free CAD software."
	echo(substr(str, 12, 10)); // ECHO: "a free CAD"
	
	// fill(string, occurrences)

	// Resume : Fill a string with several characters (or strings).
	// string : the character or string which will be copied.
	// occurrences : The number of occurences of the string.
	echo("*** Fill() ***");
	echo(fill("0", 4)); // ECHO: "0000"
	echo(fill("hey", 3)); // ECHO: "heyheyhey"
	
	// getsplit(string, index [,separator])

	// Resume : Split a string in several words.
	// string : The original string.
	// index : The index of the word to get.
	// separator : The separator which cut the string (default is " ").
	// Note : Nowadays it's impossible to get a vector of words because we can't append data in a vector.
	echo("*** getsplit() ***");
	echo(getsplit(str));
	echo(getsplit(str, 3));
	echo(getsplit("123, 456, 789", 1, ", "));
*/

function strToInt(str, base=10, i=0, nb=0) = (str[0] == "-") ? -1*_strToInt(str, base, 1) : _strToInt(str, base);
function _strToInt(str, base, i=0, nb=0) = (i == len(str)) ? nb : nb+_strToInt(str, base, i+1, search(str[i],"0123456789ABCDEF")[0]*pow(base,len(str)-i-1));

function strcat(v, car="") = _strcat(v, len(v)-1, car, 0);
function _strcat(v, i, car, s) = (i==s ? v[i] : str(_strcat(v, i-1, car, s), str(car,v[i]) ));

function substr(data, i, length=0) = (length == 0) ? _substr(data, i, len(data)) : _substr(data, i, length+i);
function _substr(str, i, j, out="") = (i==j) ? out : str(str[i], _substr(str, i+1, j, out));

function fill(car, nb_occ, out="") = (nb_occ == 0) ? out : str(fill(car, nb_occ-1, out), car);

function getsplit(str, index=0, char=" ") = (index==0) ? substr(str, 0, search(char, str)[0]) : getsplit(   substr(str, search(" ", str)[0]+1)   , index-1, char);