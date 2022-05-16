import emoji
while True:
    answ = int(input('''
How are you feeling?
Please, choose one and type a number:
1. I'm happy
2. I'm in love
3. I'm angry
4. I'm seek
5. I'm laughing 
    '''))
    
    if answ == 1:
        print (emoji.emojize(':squinting_face_with_tongue:'))
    elif answ == 2:
        print (emoji.emojize(':smiling_cat_with_heart-eyes:'))
    elif answ == 3:
        print (emoji.emojize(':pouting_face:'))
    elif answ == 4:
        print (emoji.emojize(':face_with_medical_mask:'))
    elif answ == 5:
        print (emoji.emojize(':face_with_tears_of_joy:'))
    else:
        print (emoji.emojize(':face_screaming_in_fear:'))

# emolist=['😀', '😁', '😂', '😃', '😄', '😅', '😆', '😇', '😈', '😉', '😊', '😋', '😌', '😍', '😎', '😏', '😐', '😑', '😒', '😓', '😔', '😕', '😖', '😗', '😘', '😙', '😚', '😛', '😜', '😝', '😞', '😟', '😠', '😡', '😢', '😣', '😤', '😥', '😦', '😧', '😨', '😩', '😪', '😫', '😬', '😭', '😮', '😯', '😰', '😱', '😲', '😳', '😴', '😵', '😶', '😷', '😸', '😹', '😺', '😻', '😼', '😽', '😾', '😿']
# for i in emolist:
#     print(f"Emo - {i}, name - {emoji.demojize(i)}")