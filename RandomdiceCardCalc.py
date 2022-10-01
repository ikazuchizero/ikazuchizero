def isascnum(s):
  return True if s.isdecimal() and s.isascii() else False

def lowWave(wave):
  list = [1,1,2,1,3] # 変更の可能性
  card = 0
  j = 0
  for i in range(wave):
    card += list[j]
    j += 1
    if j == 5:
      j = 0
  return card

def highWave(wave,border):
  list = [2,6] # 変更の可能性
  card = 0
  card = lowWave(border)
  j = 0
  for i in range(wave - border):
    card += list[j]
    j += 1
    if j == 2:
      j = 0
  return card

wave = input("waveを入力>>")

TF = isascnum(wave)
border = 45 #変更の可能性

if TF == True:
  wave = int(wave)
  if wave > 0:
    if wave <= border:
        card = lowWave(wave)
    if wave > border:
      card = highWave(wave,border)

    print(card)
  else:
    print("無効な入力です")
else:
  print("半角数字で入力してください")
