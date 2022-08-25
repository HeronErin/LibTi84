from PIL import Image

import struct, os, sys
# open method used to open different extension image file




pwd = os.getcwdb().decode("utf-8")
decls = os.path.join(pwd, sys.argv[1])
outdir = os.path.join(pwd, sys.argv[2])


import hashlib, struct, math, gzip
def hexify(x):
	f = str(hex(x))
	if len(f) == 4:
		return f
	else:
		return f.replace('0x', "0x0")
class BitArr:
    def __init__(self):
        self.arr=""

    @classmethod
    def fromBytes(cls, bys):

        b = cls()
        off = bys[0]
        
        b.addBytes(bys[1:])
        # print(off)
        if off != 0:
            b.arr = b.arr[8-off:]
        return b


    def addBit(self, boo):
        self.arr+=str(1 if boo else 0)
    def addBytes(self, by):
        self.arr+=''.join(f'{b:08b}' for b in by)
    def toBytes(self, prep=True):

        v = int(self.arr, 2)
        b = bytearray()
        
        while v:
            b.append(v & 0xff)
            v >>= 8
        return (struct.pack("B", (len(self.arr)%8)) if prep else b"")+bytes(b[::-1])
    def popBit(self):
        b = self.arr[0]
        self.arr = self.arr[1:]
        return b=='1'
    def popByte(self):
        by = self.arr[:8]
        extra = self.arr[8:]
        self.arr = by
        try:
            nby = self.toBytes(False)
            self.arr = extra
            return nby
        except ValueError as e:
            # print(e,"aaaa")
            return 0x00
    def toHex(self):
    	b = self.toBytes()
    	return ", ".join([hexify(bb) for bb in b])

data = BitArr()




dfile = open(decls, "w")

imgdata = BitArr()
for inur in os.listdir(os.path.join(pwd, "imgs")):
	im = Image.open(os.path.join(pwd, "imgs", inur)) 
	
	
	imgdata2 = BitArr()
	rl=0
	full = []
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
		imgdata2.addBytes(bytes(row))
	olen = len(imgdata.arr)
	imgdata.addBytes(struct.pack(">iii", rl,im.height,len(imgdata2.arr)//8))
	print()
	dfile.write(f"#define {inur.split('.')[0]}_WIDTH_OFF {olen//8}\n")
	dfile.write(f"#define {inur.split('.')[0]}_HEIGHT_OFF {olen//8+4}\n")
	dfile.write(f"#define {inur.split('.')[0]}_LENGTH_OFF {olen//8+8}\n\n")

	imgdata.addBytes(imgdata2.toBytes(False))

dfile.close()
f = open("/tmp/datatopack.dat.tmp", "wb")
f.write(imgdata.toBytes(False))
f.close()
os.system(f"{os.path.join(os.path.dirname((os.path.abspath(__file__))), 'binary_to_appvar')} /tmp/datatopack.dat.tmp \"{outdir}\" {sys.argv[3]}" )
# 			rl = len(row)
# 			full.append(", ".join([hexify(p) for p in row]))
# 	print(f"const char {inur.split('.')[0]}_{iV}[] = "+"{"+",\n".join(full)+"};"+f" // HEIGHT:{im.height} // WIDTH:{(rl)} \n\n")

