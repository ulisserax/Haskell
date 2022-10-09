module Main where

{--
PUCPR - PONTIFICIA UNIVERSIDADE CATOLICA DO PARANA
ALUNO: ULISSES PAULO COSTA FILHO
CURSO: CIENCIAS DA COMPUTAÇÃO
DISCIPLINA: PROGRAMAÇÃO FUNCIONAL
--}

--1. Escreva uma função chamada soma1 que recebe um inteiro como argumento e retorna um inteiro uma unidade maior que a entrada.  
soma1 :: Int -> Int
soma1 num = num + 1

--2. Escreva  uma  função  chamada  sempre  que,  não  importando  o  valor  de  entrada,  devolva sempre zero. Observe que neste caso a entrada pode ser de qualquer tipo.
sempre :: x -> Int
sempre x = 0
  
--3. Escreva  uma  função  chamada  treco  que  receba  três  valores  em  ponto  flutuantes  com precisão dupla e retorne o resultado da soma dos dois primeiros multiplicado pelo terceiro. 
treco :: Double -> Double -> Double -> Double
treco a b c = (a+b)*c

--4. Escreva uma função chamada resto que devolva o resto de uma divisão entre dois números inteiros. 
resto :: Int -> Int -> Int
resto a b = a `mod` b

--5. Escreva uma função chamada precoMaior que devolva o maior valor entre quatro valores monetários. 
maiorQue :: Float -> Float -> Float
maiorQue p q
    | p > q = p
    | p < q = q

precoMaior :: Float -> Float -> Float -> Float -> Float
precoMaior a b c d = maiorQue (maiorQue a b) (maiorQue c d)
  
--6. Escreva uma função chamada impar que devolva True, sempre que o resultado do produto de dois números inteiros for ímpar.
multiplica :: Int -> Int -> Int
multiplica a b = a*b

impar :: Int -> Int -> Bool
impar p q = (multiplica p q) `mod` 2 == 1

--7. Em Haskell existe o tipo par cuja assinatura tem a seguinte forma: 𝑝𝑎𝑟∷(𝐼𝑛𝑡,𝐼𝑛𝑡). Escreva uma função em Haskell que devolva a soma dos componentes de um par de inteiros. 
par :: (Int, Int) -> Int
par (a, b) = a+b

--8. Escreva uma função em Haskell que receba números reais (double) e devolva o resultado da equação x^2 + y/2 + z
equacaoHaskell :: Double -> Double -> Double -> Double
equacaoHaskell a b c = (^) a 2 + (/) b 2 + c

--9. Escreva uma função em Haskell chamada diagnostico que receba o peso do aluno e imprima um  diagnóstico  de  obesidade,  segundo  a  tabela  que  pode  ser  encontrada  no  link: Sobrepeso,  obesidade  e  obesidade  mórbida:  entenda  a  diferença  entre  os  três  termos (cuidadospelavida.com.br).  Observe  que  este  diagnóstico  é  meramente  estatístico  e  não tem nenhum valor real, está sendo usado nesta questão apenas para a definição das faixas. Todo e qualquer diagnóstico deve ser feito por um profissional médico.  
diagnostico :: Float -> Float -> String  
diagnostico peso altura  
    | peso / altura ^ 2 <= 17 = "Muito abaixo do peso"  
    | peso / altura ^ 2 > 17 && peso / altura ^ 2 <= 18.49 = "Abaixo do peso"  
    | peso / altura ^ 2 > 18.5 && peso / altura ^ 2 <= 24.99 = "Peso Normal" 
    | peso / altura ^ 2 > 25 && peso / altura ^ 2 <= 29.99 = "Sobrepeso"
    | peso / altura ^ 2 > 30 && peso / altura ^ 2 <= 34.99 = "Obesidade leve"
    | peso / altura ^ 2 > 35 && peso / altura ^ 2 < 39.99 = "Obesidade severa"
    | otherwise = "Obesidade mórbida"


--10. Escreva uma função em Haskell chamada bissexto que receba um ano e devolva True se o ano for bisexto sabendo que anos bissextos obedecem a seguinte regra:  𝑇𝑜𝑑𝑜𝑠 𝑜𝑠 𝑎𝑛𝑜𝑠 𝑞𝑢𝑒 𝑠𝑒𝑗𝑎𝑚 𝑑𝑖𝑣𝑖𝑠í𝑣𝑒𝑖𝑠 𝑝𝑜𝑟 4 𝐸𝑥𝑐𝑒𝑡𝑜 𝑜𝑠 𝑎𝑛𝑜𝑠 𝑞𝑢𝑒 𝑠ã𝑜 𝑚ú𝑙𝑡𝑖𝑝𝑙𝑜𝑠 𝑑𝑒 100 𝐸𝑥𝑐𝑒𝑡𝑜 𝑜𝑠 𝑎𝑛𝑜𝑠 𝑞𝑢𝑒 𝑠ã𝑜 𝑚ú𝑙𝑡𝑖𝑝𝑙𝑜𝑠 𝑑𝑒 400 1997 não é bissexto, 1900 não é bissexto e 2000 é bissexto. 
bissexto :: Int -> Bool
bissexto ano | mod ano 4 == 0 && (mod ano 100 /= 0 || mod ano 400 == 0) = True
             | otherwise = False



--main execução dos programas

main = do
  --Func1
  let nomeFuncao1 = "soma1"
  putStrLn "FUNCAO 1\n"
  putStrLn "Selecione a variavel que deseja calcular"
  var <- getLine
  let varNumerico = (read var :: Int)
  print("Func " ++nomeFuncao1 ++ " entrada " ++ var ++ " saida ", soma1 varNumerico)

  --Func2

  putStrLn "FUNCAO 2\n"
  let nomeFuncao2 = "sempre"
  putStrLn "Selecione qualquer entrada que desejar "
  var2 <- getLine
  print("Func " ++nomeFuncao2 ++ " entrada " ++ var2 ++ " saida ", sempre var2)

  --Func3

  putStrLn "FUNCAO 3\n"
  let nomeFuncao3 = "treco"
  putStrLn "Selecione tres numeros em pontos flutuantes com precisao dupla "
  var3 <- getLine
  let x = (read var3 :: Double)
  var4 <- getLine
  let y = (read var4 :: Double)
  var5 <- getLine
  let z = (read var5 :: Double)
  print("Func " ++nomeFuncao3++ " entrada ", x ," ", y, " ", z, " saida ", treco x y z)

  --Func4

  putStrLn "FUNCAO 4\n"
  let nomeFuncao4 = "resto"
  putStrLn "Digite dois inteiros"
  var6 <- getLine
  let p = (read var6 :: Int)
  var7 <- getLine
  let q = (read var7 :: Int)
  print("Func " ++nomeFuncao4++ " entrada ", p ," ", q," saida ", resto p q)

  --Func5

  putStrLn "FUNCAO 5\n"
  let nomeFuncao5 = "precoMaior"
  putStrLn "Digite quatro valores monetarios"
  var8 <- getLine
  let w = (read var8 :: Float)
  var9 <- getLine
  let t = (read var9 :: Float)
  var10 <- getLine
  let r = (read var10 :: Float)
  var11 <- getLine
  let s = (read var11 :: Float)
  print("Func " ++nomeFuncao5++ " entrada ", w ," ", t, " ", r, " ", s," saida ", precoMaior w t r s)
  
  --Func6

  putStrLn "FUNCAO 6\n"
  let nomeFuncao6 = "impar"
  putStrLn "Digite dois numeros inteiros"
  var12 <- getLine
  let k = (read var12 :: Int)
  var13 <- getLine
  let l = (read var13 :: Int)
  print("Func " ++nomeFuncao6++ " entrada ", k ," ", l," saida ", impar k l)

    --Func7

  putStrLn "FUNCAO 7\n"
  let nomeFuncao7 = "par"
  putStrLn "Digite um par de numeros para serem somados"
  var14 <- getLine
  let f = (read var14 :: Int)
  var15 <- getLine
  let j = (read var15 :: Int)
  print("Func " ++nomeFuncao7++ " entrada ", 3 ," ", 4," saida ", par (f, j))

  --Func8

  putStrLn "FUNCAO 8\n"
  let nomeFuncao8 = "equacaoHaskell"
  putStrLn "Digite os coeficientes da equacao quadratica"
  var16 <- getLine
  let m = (read var16 :: Double)
  var17 <- getLine
  let n = (read var17 :: Double)
  var18 <- getLine
  let o = (read var18 :: Double)
  print("Func " ++nomeFuncao8++ " entrada ", m," ", n, " ", o," saida ", equacaoHaskell m n o)
  
  --Func9

  putStrLn "FUNCAO 9\n"
  let nomeFuncao9 = "diagnostico"
  putStrLn "Digite seu peso e depois sua altura"
  var19 <- getLine
  let u = (read var19 :: Float)
  var20 <- getLine
  let v = (read var20 :: Float)
  print("Func " ++nomeFuncao9++ " entrada ", u ," ", v," saida ", diagnostico u v)

  --Func10

  putStrLn "FUNCAO 10\n"
  let nomeFuncao10 = "bissexo"
  putStrLn "Digite o ano que deseja verificar"
  var21 <- getLine
  let g = (read var21 :: Int)
  print("Func " ++nomeFuncao10++ " entrada ", g ," saida ", bissexto g)
