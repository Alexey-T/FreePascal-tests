
with open('/home/user/ascii.txt', 'wb') as f: 
    for i in range(128, 256):
        f.write(i.to_bytes(1, 'little'))

    