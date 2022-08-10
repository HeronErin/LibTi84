from PIL import Image
import struct, os
# open method used to open different extension image file
for inur in ['sp1.bmp', 'sp2.bmp']:
	im = Image.open(os.path.join("bmps", inur)) 
	full = []
	def hexify(x):
		f = str(hex(x))
		if len(f) == 4:
			return f
		else:
			return f.replace('0x', "0x0")
	rl = 0
	for y in range(im.height):
		i = 0
		row = []
		for x in range(im.width):
			pixel = im.getpixel((x, y))
			px = pixel != (255, 255,255)
			# print(pix)
			byt = i//8
			if len(row)-1!=byt:
				row.append(0)
			if px:
				row[byt] |= 1<<(7-(i%8))
			i+=1
		rl = len(row)
		full.append(", ".join([hexify(p) for p in row]))
	print(f"const char {inur.split('.')[0]}[] = "+"{"+",\n".join(full)+"};"+f" // HEIGHT:{im.height} // WIDTH:{(rl)} \n\n")

