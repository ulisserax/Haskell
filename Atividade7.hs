{--
PUCPR - PONTIFICIA UNIVERSIDADE CATOLICA DO PARANA
ALUNO: ULISSES PAULO COSTA FILHO
CURSO: CIENCIAS DA COMPUTAÇÃO
DISCIPLINA: PROGRAMAÇÃO FUNCIONAL
--}
-- =========================================================================================
--Exercicio 1
-- Utilizando a linguagem Haskell e o seu próprio tipo de dados, crie um programa capaz de 
-- classificar triângulos a partir do comprimento dos seus lados sabendo que o comprimento 
-- de cada um dos lados deve ser maior que zero e que:  
-- a. triângulos equiláteros têm todos os lados do mesmo tamanho; 
-- b. triangulos esosceles têm, no mínimo, dois lados do mesmo tamanho;  
-- c. triangulos escalenos têm tem todos os lados de tamanho diferentes; 
-- d. triangulos degenerados têm um lado igual a soma dos outros dois e área zero. 

-- Saber se os números formam um triangulo:
eh_triangulo a b c = 
  abs (b - c) < a && a < b + c && abs (a - c) < b && b < a + c && abs (a - b) < c && c < a + b

-- Classificar o tipo do triangulo
classificar_triangulo a b c
  | not (eh_triangulo a b c)   = "nao eh triangulo" 
  | a == b && a == c           = "equilatero"
  | a == b || a == c || b == c = "isosceles"
  | a /= b && a /= c && b /= c = "escaleno"
  | (a == b + c || b == a + c || c == a + b) = "triangulo degenerado"

--main = do
  --print(classificar_triangulo 2 2 5)

-- =========================================================================================
-- Exercicio 2
-- Usando Haskell, crie uma função chamada fatias, com a assinatura dada por fatias:: :: Int -> String -> [[Int]] que receba um string e um inteiro e devolva uma lista de listas contendo em cada  item  uma  lista  de  inteiros.  Esta  função  receberá  strings  contendo  digitos  como,  porexemplo:  "345234678"  e  devolverá  listas  parecidas  com [[3,4,5],[4,5,2],[5,2,3],[2,3,4],[3,4,6],[4,6,7],[6,7,8]] No caso do exemplo, o inteiro que fatias recebeu foi 3. Observe que você poderá criar, quantas funções de apoio acredite que sejam necessárias  para  criar  as  funcionalidades  de  fatias  inclusive,  se  achar  interessante,  pode usar as funções mapMaybe e digitToInt. 
fatias :: Int -> String -> [[Int]]
fatias numeroFatias lista = map (map digitToInt) (criaListaString numeroFatias lista)

criaListaString :: Int -> String -> [String]
criaListaString numeroFatias lista
    | length lista < numeroFatias = []
    | otherwise = take numeroFatias lista : criaListaString numeroFatias (tail lista)

-- main = do
  -- print(fatias 3 "345234678")

-- =========================================================================================
-- Exercicio 3
-- Usando  Haskell  escreva  uma  função  chamada  romanos  que  receba  um  inteiro  menor  ou igual a 3000 e devolva um string deste inteiro representado com algarismos romanos.

romanos :: Int -> String
romanos numeroTransformar
    | numeroTransformar < 1 || numeroTransformar > 3000 = "Impossivel formar numero"
    | numeroTransformar >= 1 = "I" ++ romanos (numeroTransformar - 1)
    | numeroTransformar >= 4 = "IV" ++ romanos (numeroTransformar - 4)
    | numeroTransformar >= 5 = "V" ++ romanos (numeroTransformar - 5)
    | numeroTransformar >= 9 = "IX" ++ romanos (numeroTransformar - 9)
    | numeroTransformar >= 10 = "X" ++ romanos (numeroTransformar - 10)
    | numeroTransformar >= 40 = "XL" ++ romanos (numeroTransformar - 40)
    | numeroTransformar >= 50 = "L" ++ romanos (numeroTransformar - 50)
    | numeroTransformar >= 90 = "XC" ++ romanos (numeroTransformar - 90)
    | numeroTransformar >= 100 = "C" ++ romanos (numeroTransformar - 100)
    | numeroTransformar >= 400 = "CD" ++ romanos (numeroTransformar - 400)
    | numeroTransformar >= 500 = "D" ++ romanos (numeroTransformar - 500)
    | numeroTransformar >= 900 = "CM" ++ romanos (numeroTransformar - 900)
    | numeroTransformar >= 1000 = "M" ++ romanos (numeroTransformar - 1000)
    | otherwise = ""

-- main = do
  -- print(romanos 2022)
-- =========================================================================================
-- Exercicio 4
-- Usando linguagem  Haskell, escreva uma função que recebe uma lista de listas de inteiros com  até  5  digitos  em  cada  lista  e  devolva  apenas  as  listas  que  contenham  palíndromes primos.  Por  exemplo  na lista  de  listas  [[1,1,1],  [1,2,2],  [3,1,3],  [3,1,5]]  apenas  o  elemento [3,1,3] é um palíndrome  primo. Uma ferramenta importante para criar suas listas de teste pode ser encontrada em: Prime Number Calculator (calculatorsoup.com).

numeroPrimo :: Int -> Bool
numeroPrimo numero
    | numero <= 1 = False
    | numero == 2 = True
    | numero `mod` 2 == 0 = False
    | otherwise = numeroPrimoSegundo numero 3

numeroPrimoSegundo :: Int -> Int -> Bool
numeroPrimoSegundo numero indice
    | indice * indice > numero = True
    | numero `mod` indice == 0 = False
    | otherwise = numeroPrimoSegundo numero (indice + 2)

palindromo :: Int -> Bool
palindromo n = show n == reverse (show n)

palindromo_primo :: [[Int]] -> [[Int]]
palindromo_primo xs = filter (palindromo . read . concatMap show) (filter (all numeroPrimo) xs)

--main = do
  --print(palindromo_primo [[1,2,2], [2,2,2], [3,1,3]])
-- =========================================================================================
-- Exercicio 5
-- Usando a linguagem Haskell escreva uma função, chamada ultimoNome que receba o nome completo de uma pessoa e devolva apenas o último sobrenome sem qualquer vogal. Caso o  ultimo  sobrenome  não  contenhuma  nenhuma  vogal  devolva  o  ultimo  sobrenome  que ainda contenha vogal. Por exemplo se o nome for Ana Maria stzrx, a função deve devolver Maria, se o nome for Silvia Silva a função deve devolver Slv.

ultimoNome :: String -> String
ultimoNome lastName = last (filter (not . null) (map (filter (not . (`elem` "aeiouAEIOU"))) (words lastName)))

--main = do
  --print(Ulisses Costa)

-- =========================================================================================







