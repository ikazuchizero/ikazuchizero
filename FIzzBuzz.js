let num = 15; //数値を代入
let text = "";

if(num % 3 == 0){
    text += "Fizz";
}
if(num % 5 == 0){
    text += "Buzz";
}
if(text == ""){
    text = num;
}

console.log(text)
