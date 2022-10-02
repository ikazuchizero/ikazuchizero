class FizzBuzz{
  public static void main(String[] args){
  
    int num =  15;
    
    if(num > 0){
      String text = "" ;
      text = "" ;
      
      if(num % 3 == 0){
        text += "Fizz";
      }
      if(num % 5 == 0){
        text +="Buzz";
      }
      if(text == ""){
        text = String.valueOf(num);
      }
      
    System.out.println(text);
    }
    
  }
}
