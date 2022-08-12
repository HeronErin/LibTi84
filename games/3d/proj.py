import pygame  
from math import sin, cos
player = [0, 0, 0]
lm = False
# def deg(x, z, y):
#     global player
#     x = player[0]-x
#     y = player[1]-y
#     z = player[2]-z
#     deg = -1.308997

#     sx = sin(0)*100000//100
#     sy = sin(deg)*100000//100
#     sz = sin(0)*100000//100


#     cx = cos(0)*100000//100
#     cy = cos(deg)*100000//100
#     cz = cos(0)*100000//100
#     print(sx, cx)
#     # // out->y = (int)cx;

#     temp1 = (cy * z//100 + sy *(sz*y+cz*x)//1000000 );
#     temp2 = (cz * y - sz*x);
#     dx = (cy * (sz * y + cz * x)*100 - sy*z)//1000;
#     dy = (sx * temp1 + cx * temp2/100);
#     dz = (cx * temp1 - sx * temp2//100);
#     return 1*dx//dz, 10*dy//dz
def deg(x, z, y):
    # a = -1.570796
    # x = x*cos(a) - z * sin(a)
    # z = z*cos(a) - x * sin(a)
    x = x-player[0]
    y = y-player[1]
    z = z-player[2]
    return (50*x / z)+300, 50*y / z
m = []
def fr():
    global m
    m = [
    ]
    for i in range(1, 4):
        m.append(deg(-1, 8, i))
        m.append(deg(1, 3, i))
fr()
print(m)


#[(29.467250388600686, 30.52369172533362), (33.09985458112758, 172.12343812673242), (166.55475918705346, 162.9465170157076), (158.11114555647006, 27.125651438345926), (19.297735623642716, 20.700215547151682), (21.419287190569506, 113.60445503106969), (110.74941829321138, 109.04006724339676), (106.44488685943661, 18.660066898434817)]

# exit()
pygame.init()  
scr = pygame.display.set_mode((600,500))  
pygame.display.set_caption('Pygame Window')
done = False  
def main():
    global cx, cy, cz, done
    while True:  
        scr.fill((0,0,0))
        for p in m:
            for i in m:
                if p != i:
                    # print(p, i)
                    pygame.draw.line(scr, (255, 255, 255), p, i, 3)


        re = False
        pygame.display.flip()  
        for event in pygame.event.get():  
            if event.type == pygame.QUIT:  
                return
            if event.type == pygame.KEYDOWN and event.key == pygame.K_KP_8 and not lm:
                player[2] = player[2]+1
                lm = True
                re = True
            elif event.type == pygame.KEYDOWN and event.key == pygame.K_KP_2 and not lm:
                player[2]-=1 
                lm = True
                re = True
            elif event.type == pygame.KEYDOWN and event.key == pygame.K_KP_4 and not lm:
                player[0]-=1 
                lm = True
                re = True

            elif event.type == pygame.KEYDOWN and event.key == pygame.K_KP_6 and not lm:
                player[0]+=1 
                lm = True
                re = True
            elif event.type == pygame.KEYDOWN and event.key == pygame.K_KP_7 and not lm:
                player[1]+=1 
                lm = True
                re = True
            elif event.type == pygame.KEYDOWN and event.key == pygame.K_KP_9 and not lm:
                player[1]-=1 
                lm = True
                re = True
            else:
                lm=False
        if re:
            # print("ree", player)
            fr()

    pygame.display.flip()  



main()