SIZE = 5
def toLines(fn, pname="points", lname="lines"):
	f = open(fn, "r")
	lns = f.readlines()
	f.close()
	verts = []
	lines = []
	for l in lns:
		l = l.replace("\n", "")
		if l.startswith("v "):
			verts.append([int(float(s)*SIZE)+SIZE for s in l.split(" ")[1:]])
		elif l.startswith("f "):
			for f in l.split(" ")[1:]:
				if (not f in lines) and f.split("//")[0] != f.split("//")[1]:
					lines.append(f)
	print(f"int {pname}[] ="+" {\n\t  "+"\n\t, ".join([", ".join([str(p+1) for p in v]) for v in verts]) + "\n}; // " + f"{len(verts)*3}")

	print(f"int {lname}[] =" +"{\n\t  " + "\n\t, ".join([", ".join(l.split("//")) for l in lines]) + "\n}; // " + f"{len(lines)*2}")

toLines("3test.obj")