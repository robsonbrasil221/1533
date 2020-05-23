import random
v = 1
resposta = -1
arquivo = open("/var/www/html/cpf.txt","w")
print >> arquivo,"--> By: @robsonbrasil221"
while resposta < 1:
    resposta = int(raw_input('Quantos CPFs deseja gerar?'))

while v <= resposta:

    a = random.randint(0,0)
    b = random.randint(1,9)
    c = random.randint(1,9)
    d = random.randint(0,9)
    e = random.randint(1,9)
    f = random.randint(0,8)
    g = random.randint(1,7)
    h = random.randint(1,6)
    i = random.randint(1,5)


    j = (a*10+b*9+c*8+d*7+e*6+f*5+g*4+h*3+i*2)
    j = j%11

    if j <= 1 :
        j = 0
    else :
        j = 11 - j

    m = (a*11+b*10+c*9+d*8+e*7+f*6+g*5+h*4+i*3+j*2)
    m = m % 11

    if m <= 1 :
        m = 0
    else :
        m = 11 - m

    print >> arquivo,"/cpf %d%d%d%d%d%d%d%d%d%d%d" %(a,b,c,d,e,f,g,h,i,j,m)	
    v=v+1
	
print "Gerador de CPF's By: @robsonbrasil221" 
print "Obrigado por usar este gerador de CPF."
print >> arquivo,"--> Gerador de CPF's By: @robsonbrasil221"