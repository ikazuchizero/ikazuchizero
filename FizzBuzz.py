def isascnum(s):
  return True if s.isdecimal() and s.isascii() else False

num = input("半角数字を入力>>")

if isascnum(num) == True:
  num = int(num)
  if num > 0:
    text = ""
    if num % 3 == 0:
        text += ("Fizz")
    if num % 5 == 0:
        text += ("Buzz")
    if text == "":
      text = num

    print(text)
  else:
    print("無効な入力です")
else:
  print("半角数字で入力してください")
