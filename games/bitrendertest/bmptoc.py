from PIL import Image
import struct
# open method used to open different extension image file
im = Image.open("eye.bmp") 
full = []
def hexify(x):
	f = str(hex(x))
	if len(f) == 4:
		return f
	else:
		return f.replace('0x', "0x0")
for y in range(im.height):
	i = 0
	row = []
	for x in range(im.width):
		pixel = im.getpixel((x, y))
		px = pixel != (255, 255,255)
		byt = i//8
		if len(row)-1!=byt:
			row.append(0)
		if px:
			row[byt] |= 1<<(7-(i%8))
		i+=1
	full.append(", ".join([hexify(0xFF) for p in row]))
print(",\n".join(full))

