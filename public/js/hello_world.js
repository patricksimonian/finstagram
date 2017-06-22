// the lovely world of javascript
// the lanuage that web browsers use**

// variables
var firstName = "patrick"; //js
var lastName = 'patrick';
var integer = 393;
var float = 343.343;
var booleanValue = true;
// flow control
//  if float == 343.343 do  # ruby land
//   #do something
//  else
//   #else do something here
//  end
// == comparison with 2 equals performs type coercion
// === is a strict comparison
if(float === 343.343) {
    
}
// looping
// [1, 2, 3, 5].each do ... #ruby land
var numArray = [1, 2, 4, 5, 6];
numArray[1]; // return the value 2
for(var i = 0; i < 3; i++) {
    console.log(numArray[i]);
} 


// print out a tix tac toe grid
var text = "";
for(var i = 0; i < 3; i++) {
    // outer loop would be rows
    text += "|";
    // inner loop columns
    for(var ii = 0; ii < 3; ii++) {
        text += "x|";
    }
    text += "\n";
}
// variable integer === 393
// while(integer === 393) {
//     integer += 1;
//     console.log("current integer", integer);
//     if(integer > 400) {
//         break;
//     }
// }
//integer  === 401
// do {
    
// } while(integer < 400)

console.log(text);
// functions
 // def method_name(argument_1, argument_2) do
 
 //end
 //calling the method by method_name(12, 434)
 
function sumMyNumbers(n1, n2) {
    var sum = null;
    if(parseFloat(n1) && parseFloat(n2)) {
      sum = n1 + n2;
    }
    return sum;
}
// def sum_my_numbers(n1, n2) do
//     if n1 && n2
//       n1 + n2
//     else
//       "no arguments passed through"
//     end
// end
sumMyNumbers(123, 232);
// objects
// in ruby land we declare a related data set a 'hash'
// my_hash = {
//     key_1: true,
//     key_2: "something"
// }
//to grab a value inside a hash...
// my_hash[:key_1]

var jsObject = {
    key_1: true,
    key_2: "something"
}
jsObject.key_1 // return true
jsObject["key_1"] //return true
// arrays
//javascript array is EXACTLY like a ruby array
var testArray = [true, false, 334.33,  "string"];
// console logging
console.log("hellow", integer);
//in ruby land
// puts "hellow world"
// document object
 // this is where i will use the document object to render the image typed into
 // the post img url input **
//  var urlInput = document.getElementById("photo_url");
//  console.log(urlInput);
// event handling

// jquery

// asyncronous server calls (AJAX)



