def functionDecrypted(encrypted, k):
    decrypted = ''
    # ABCDEFGHIJKLMNOPQRSTUVWXYZ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    character = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

    for char in encrypted:
        if char in character:
            index = character.index(char)
            # print("index is ",index)
            new_index = (index - k) % 26 #หาร 26 เพื่อไม่ให้ติดลบ
            # print("index a ",new_index)
            decrypted += character[new_index]
        else:
            decrypted += char

    return decrypted


# encrypted = 'BBBBB'
encrypted = 'VTAOG'
k = 2
print(functionDecrypted(encrypted, k))