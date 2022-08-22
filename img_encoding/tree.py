import hashlib, struct, math, gzip

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
def write(IN_NAME, OUT_NAME):
    f = open(IN_NAME, "rb")
    img = f.read()
    f.close()
    # print(hashlib.md5(img).hexdigest(), len(img))
    bton = {}
    class node:
        def __init__(self, num:bool, freq:int,data=None, left=None, right = None, hasParrent=False):
            self.num = num
            self.freq = freq
            self.data = data
            self.right = right
            self.left = left
            self.bit=None
            if self.data is not None:
                bton[str(self.data)] = self
            self.hasParrent=hasParrent
        def __str__(self):
            return self.__dict__.__str__()
        def print(self, lv=0):
            if self.data is None:
                print(f"{' '*lv}├── {self.freq}")
            else:
                print(f"{' '*lv}├── {self.freq}: {self.data}")
            if self.left:
                self.left.print(lv+1)
            if self.right:
                self.right.print(lv+1)


    freqs = {}
    for d in img:
        freqs[str(d)] = freqs.get(str(d), 0)+1
    freqs = list(freqs.items())
    nodes = [node(False, l[-1], l[0]) for l in freqs]
    while True:
        nodes = sorted(nodes, key=lambda x: x.freq)
        p = 0
        n1 = None
        n2 = None
        for n in nodes:
            if not n.hasParrent:
                p+=1
                if n1 is None:
                    n1 = n
                elif n2 is None:
                    n2 = n
        if p == 1:
            break


        n1.hasParrent = True
        n2.hasParrent = True
        n1.bit = 0
        n2.bit = 1
        nn = node(True, n1.freq+n2.freq, left=n1, right=n2)
        n1.parrent = nn
        n2.parrent = nn
        nodes.append(nn)

    nodes = sorted(nodes, key=lambda x: x.freq)



    def bitsFor(by, barr):
        node = bton[str(by)]
        node2 = node
        ret = []
        while node2.hasParrent:
            ret.append(node2.bit)
            node2 = node2.parrent
        ret.reverse()
        for b in ret:
            barr.addBit(b)


    def __dumpNode(barr:BitArr, nd:node):

        
        l = nd.left is not None

        if l:
            barr.addBit(1)
            __dumpNode(barr, nd.left)
            __dumpNode(barr, nd.right)
        else:
            barr.addBit(0)
            # print(nd.data)
            barr.addBytes(struct.pack("B", int(nd.data)))

    def dumpNodes():
        barr = BitArr()
        node = nodes[-1]
        __dumpNode(barr, node)
        
        return barr.toBytes()
    def _loadNode(barr:BitArr):
        bt = barr.popBit()
        # print(bt)

        n = node(bt, -1)
        if bt:
            n.left = _loadNode(barr)
            n.right = _loadNode(barr)
        else:
            pb = barr.popByte()
            try:
                n.data = struct.unpack("B", pb)[0]
            except struct.error:
                n.data = 0x00
            # print(n.data)
        # print(n)
        return n
    def loadNodes(b):
        barr = BitArr.fromBytes(b)
        return _loadNode(barr)
    # nodes[-1].print()
    f = open(OUT_NAME, "wb")
    dn = dumpNodes()
    f.write(dn)
    bts = BitArr()
    for d in img:
        bitsFor(d, bts)
    # print(len(bts.toBytes()))
    f.write(bts.toBytes())
    f.close()
def read():
    f = open("dump.dat", "rb")
    bys = f.read()
    f.close()
    barr = BitArr.fromBytes(bys)


    flen = len(barr.arr)
    nodes = _loadNode(barr)
    barr = BitArr.fromBytes(  (bys[int((flen-len(barr.arr))/8+2):])   )

    out = bytearray()
    cnode = nodes
    for bit in barr.arr:
        
        cnode = cnode.left if bit == '0' else cnode.right

        if cnode.left is None:
            out.append(int(cnode.data))
            cnode = nodes
            # break
        # break

    f = open("decode.dat", "wb")
    f.write(bytes(out))
    f.close()

# print("--------"*12)
# print(loadNodes(dn).print())
# print(ncc)
# for b in img:
#     bits+=bitsFor(b)
# print(len(bits)/8)
# print(nodes[-1].dump())
# print(nodes[-1].freq)






