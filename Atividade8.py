# 1. Usando  os  conceitos  de  programação  funcional  e  considerando  o  universo  dos  números inteiros,  implemente a  função  foldr  em  Python,  C  ou  C++  20  tomando  como  base  o funcionamento  desta  função  em  Haskell.  Sem,  é  claro,  usar  qualquer  função,  objeto,  ou biblioteca disponíveis na linguagem que você escolher. 

itens = [1, 2, 3, 4, 5]
f = lambda acum, x: acum * x
acumulador = 1

#É possível obter um foldr dessa função aplicando a seguinte ideia

[acumulador := f(acumulador, x) for x in itens]

#De uma forma mais condensada, teremos:

acum = 1; [acum := acum * x for x in [1, 2, 3, 4, 5]]
#print(acum)

acum = 1
resultado= [acum := acum * x for x in [1, 2, 3, 4, 5]]
#print(resultado)

#============================================================
# 2. Usando  os  conceitos  de  programação  funcional  e  considerando  o  universo  dos  números inteiros, implemente a função abs em Python, C ou C++ 20 que devolva o valor absoluto de um número dado. Sem, é claro, usar qualquer função, objeto, ou biblioteca disponíveis na linguagem que você escolher.

abs = lambda x: x if x >= 0 else abs(-x)
#print("modulo de -3 será: " + str(abs(-3)))
#=============================================================
# 3. Usando  os  conceitos  de  programação  funcional  e  considerando  o  universo  dos  números reais, implemente a função media em Python, C ou C++ 20 que devolva a média aritmética entre  dois  números  dados.  Sem,  é  claro,  usar  qualquer  função,  objeto,  ou  biblioteca disponíveis na linguagem que você escolher.

from functools import reduce
 
lista = [3, 2, 1, 5, 7, 8]
 
media = (reduce(lambda x, y: x + y, lista)) / len(lista)
 
#print("Media da sequencia será:", media)


#=============================================================
# 4. Usando os conceitos de programação funcional e a linguagem Python, C ou C++ 20 escreva uma  função  que devolva  a  lista  de  todos  os  números  de  Fibonacci  até um  valor  dado considerando que a  sequência de Fibonacci começa em zero. Sem, é  claro, usar qualquer função, objeto, ou biblioteca disponíveis na linguagem que você escolher.

fib = lambda x: [] if x == 0 else [0] if x == 1 else [0, 1] if x == 2 else fib(x - 1) + [fib(x - 1)[len(fib(x - 1)) - 1] + fib(x - 1)[len(fib(x - 1)) - 2]]

#print("tomar sequencia a partir de 2: " + str(fib(2)))

#==============================================================
# 5. Você tem uma lista de tuplas onde o primeiro campo é o nome de um aluno e o segundo sua nota. Crie uma função, usando o Python, C ou C++ 20 e os conceitos de programação funcional para  criar uma  função que  ordene  listas  de  tuplas,  como  a  tupla  descrita neste enunciado.  Sem,  é  claro,  usar  qualquer  função,  objeto,  ou  biblioteca  disponíveis  na linguagem que você escolher.

tuplas_ordenacao = lambda x: [] if len(x) == 0 else tuplas_ordenacao([y for y in x[1:] if y[1] > x[0][1]]) + [x[0]] + tuplas_ordenacao([y for y in x[1:] if y[1] <= x[0][1]])

#lista_chamada = [('Johny Bravo', 10), ('Tom', 7), ('Joseph', 8), ('Charles', 9), ('Paul', 6), ('Pierre', 8), ('Lynda', 9), ('Marie Curie', 10), ('Albert Einstein', 7), ('De Broglie', 8)]
#print("tuplas_ordenacao: devemos ordenar " + str(lista_chamada) + " ; \nresultado: "+ str(tuplas_ordenacao(lista_chamada)))