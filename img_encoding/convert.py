import os
import cv2, struct, gzip
import tree

# os.system("ffmpeg -i input.mp4 -r 1/1 frames/%03d.bmp") 
def hexify(x):
	f = str(hex(x))
	if len(f) == 4:
		return f
	else:
		return f.replace('0x', "0x0")

def convertFrame(img, outdir="out.dat"):
	by = b""
	i2 = cv2.imread(img, cv2.IMREAD_GRAYSCALE)
	i2 = cv2.resize(i2, (96, 64),interpolation = cv2.INTER_CUBIC)
	for y, row in enumerate(i2):
		ints = []
		rowl=[]
		current = 0
		i=0
		for x, pix in enumerate(row):

			byt = i//8
			if len(rowl)-1!=byt:
				rowl.append(0)
			if pix < 127:
				rowl[byt] |= 1<<(7-(i%8))
			i+=1
				# print(pix, x, x%8)
		for r in rowl:
			by +=struct.pack("B", r)
		# 	by+=", "+hexify(r)

	# by = by[2:]
	# print(by)
	# print(f"const char img[] = "+"{"+by+"};")
	f = open(outdir, "wb")
	f.write(by)
	f.close()
	# cv2.imwrite("out.bmp", i2)



# convertFrame("frames/002.bmp")
# tree.write()
lens = []
def fileToHex(fn, e=""):
	f = open(fn, "rb")
	hexs = []
	while (b:=f.read(1)):
		hexs.append(hexify(b[0]))

	# print(f"char img{e}[] = "+"{"+", ".join(hexs)+"};")
	print(", ".join(hexs)+", ")
	lens.append(str(len(hexs)))
	f.close()
# # fileToHex("dump.dat")
# convertFrame(f"frames/104.bmp")

# tree.write()

# f = open("dump.dat", "rb")
# datf.read()

# f.close()


# print("char img[] = {")
import os
# v2s = []
# for f in os.listdir("frames"):
# 	convertFrame(f"frames/{f}", f"dframes/{f}.dat")
# 	try:
# 		tree.write(f"dframes/{f}.dat", f"dframes/{f}.dat")
# 		v2s.append(os.path.getsize(f"dframes/{f}.dat"))
# 	except ValueError as ve:
# 		print(ve, f)

bc = 0
c = 0
chunck = 0
files = []


fnames = []
for ind, f in enumerate(sorted(os.listdir("dframes"))):
	c+=1
	# print(f)
	bc += os.path.getsize(f"dframes/{f}")
	files.append(f"dframes/{f}")

	if (bc > 10000) or ind == len(os.listdir("dframes"))-1:

		fnames.append('\\x15TCK'+str(chunck).zfill(2)+"\\0")
		f = open(f"vars/{chunck}.dat", "wb")
		f.write(struct.pack(">B", c))
		# print(struct.pack(">B", c)[0])
		for tf in files:
			f.write(struct.pack("<I", os.path.getsize(tf)))
			# print(struct.pack("<I", os.path.getsize(tf)), os.path.getsize(tf))
		for tf in files:
			
			f2 = open(tf, "rb")
			f.write(f2.read())		
			f2.close()

		f.close()
		os.system(f"~/Downloads/tivar/a.out vars/{chunck}.dat vars/{chunck}.8xV {'TCK'+str(chunck).zfill(2)}")
		chunck +=1
		files = []
		bc = 0
		c = 0

print("char *a[] = {\""+"\", \"".join(fnames)+"\"};")




# print(min(v2s), sum(v2s))
# print(max(v2s), sum(v2s)/len(v2s))
# fr = True
# for i in range(50):
# 	# print(f"frames/{str(i*4+4).zfill(3)}.bmp")
# 	dloc =str(i).zfill(3)
# 	convertFrame(f"frames/{dloc}.bmp", f"dframes/{dloc}.dat")

		
# 	# else:
# 	tree.write(f"dframes/{dloc}.dat", f"dframes/{dloc}.dat")	
# 	fr=False

# import os
# v2s = []
# v3s = []
# for i in range(50):
# 	# i+=4
# 	dloc =str(i).zfill(3)
# 	v2s.append(os.path.getsize(f"dframes/{dloc}.dat"))
		

# print(min(v2s), sum(v2s))
# print(max(v2s), sum(v2s)/len(v2s))

# 	# fileToHex("dump.dat", str(i))
# # print("};\nint lens[] = {"+", ".join(lens)+"};")