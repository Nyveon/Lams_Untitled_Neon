# Program to turn all non-transparent pixels into an array of points for gamemaker

from PIL import Image

im = Image.open(r".\t3.png") # replace this with the image to turn into an array
px = im.load()

l = 0
out = '['

for y in range(im.size[1]):
    for x in range(im.size[0]):
        if len(px[x, y]) < 4: # no alpha channel
            if px[x, y] != (255, 255, 255):
                out += '[' + str(x) + ',' + str(y) + '],'
                l += 1
        elif (px[x, y][3] == 255):
            out += '[' + str(x) + ',' + str(y) + '],'
            l += 1


out = out[:-1]
out += '];'

print(l)
print(out) # it literally print outs the results hahah