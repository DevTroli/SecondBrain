# Atividade de Lógica de Programação -- Lista 1 -- 10 pontos  

# data de entrega até 26/10/2025 as 23:59

Curso: Análise e Desenvolvimento de Sistemas

Nível: Fácil

Tema: Uso das estruturas if...else, do...while, while, for e
switch\...case

## 1. Par ou Ímpar (if...else)

Peça ao usuário que digite um número inteiro e positive, depois exiba se
ele é par ou ímpar.  
Dica: use o operador % (módulo) e a estrutura if\...else.

Espaço para resposta:
***Escrita Algorítmica***
1. Inicio
2. Definir Var num como inteiro
3. Se num % 2 == 0
	3-1. Mostre Esse número é par
4. Senão Mostre que o número é Impar
5. Fim


***Código***
``` cpp
int num;

if (num % 2 == 0)
	Console.WriteLine("Esse número é Par");
else
	Console.WriteLine("Esse número é Impar");
```

## 2. Maior de Três Números (if...else aninhado)

Solicite três números inteiros para o usuário e depois informe qual é o
maior deles.  
Desafio extra: mostrar também se há números iguais.

Espaço para resposta:
***Escrita Algorítmica***
1. Inicio
2. Definir Vars n1, n2, n3
3. Ler n1
4. Ler n2
5. ler n3
6. Se (n1 > n2)
	 6-1. Verifique Se (n1 > n3)
		 6-2. Mostre que o n1 é o maior número
	 6-3. Se não verifique Se n1 = n3
		 6-4. Mostre que o n1 e n3 são iguais
	 6-5. Senão que o n3 é o maior
    Fim-se
7. Se não Se (n1 == n2)
	 7-1. Verifique Se (n1 > n3)
		 7-2. Mostre que o n1 e n2 são os maiores
	 7-3. Se não verifique Se n1 = n3
		 7-4. Mostre que todos o números são iguais
	 7-5. Senão que o n3 é o maior
    Fim-se
8. 8. Se (n2 > n3)
	 8-1. Verifique Se (n1 > n3)
		 8-2. Mostre que o n2 é o maior número
	 8-3. Se não verifique Se n2 = n3
		 8-4. Mostre que o n2 e n3 são iguais
	 8-5. Senão que o n3 é o maior
    Fim-se 
9. Fim


***Código***
``` cpp
int n1, n2, n3;
Console.WriteLine("Qual o maior número?");
Console.WriteLine("====================");
Console.Write("\nInsira o primeiro número: ");
n1 = Convert.ToInt32(Console.ReadLine());
Console.Write("\nInsira o segundo número: ");
n2 = Convert.ToInt32(Console.ReadLine());
Console.Write("\nInsira o terceiro número: ");
n3 = Convert.ToInt32(Console.ReadLine());
            
if (n1 > n2){
   if (n1 > n3){
      Console.WriteLine($"\n{n1} é o maior número!");
   else if (n1 == n3)
      Console.WriteLine($"\n{n1} e {n3} são os maiores números!");
   else
      Console.WriteLine($"\n{n3} é o maior número!");
}
else if (n1 == n2){
	if (n1 > n3)
      Console.WriteLine($"\n{n1} e {n2} são os maiores números!");
	else if (n1 == n3)
      Console.WriteLine($"\nTodos os números são iguais: {n1}");
   else
      Console.WriteLine($"\n{n3} é o maior número!");
}
else {
   if (n2 > n3)
      Console.WriteLine($"\n{n2} é o maior número!");
   else if (n2 == n3)
      Console.WriteLine($"\n{n2} e {n3} são os maiores números!");
   else
      Console.WriteLine($"\n{n3} é o maior número!");
      }
}
```

## 3. Contagem de 1 a 100 (for)

Faça um programa que conte de 1 até 100 e mostre os números na tela
usando a estrutura for.  
Desafio extra: exibir apenas os números múltiplos de 3 e 5.

Espaço para resposta:
***Escrita Algorítmica***
1. Inicio
2. Definição var c (inteiro)
3. Para 1 até 100
	3-1. Se c % 3 = 0 && c % 5 == 0
			3-2. Mostre c
	Fim-se
4. Fim 


***Código***
``` cpp
class Contador
{
    public static void Main(String[] args)
    {
        for (int c = 1; c <= 100; c++)
            if (c % 3 == 0 || c % 5 == 0)
                Console.WriteLine(c);
    }
}
```

## 4. Soma de Números Positivos (while)

Peça números ao usuário até que ele digite um número negativo.  
Quando isso ocorrer, exiba a soma total dos números positivos
digitados.  
Estrutura sugerida: while.

Espaço para resposta:
***Escrita Algorítmica***
1. Inicio
2. Definição var num = 0, soma = 0 (inteiro)
3. Enquanto num >= 0
	3-1. Leia num
	3-2. Se num < 0
	3-3. soma = soma + num 
		    Fim-se 
    Fim-Enquanto
4. Mostre soma
5. FIM


***Código***
```cpp
class SomaPositivos
{
    public static void Main(String[] args)
    {
        int num = 0,
            soma = 0;

        while (num >= 0)
        {
            Console.Write("Digite um número (negativo para parar): ");
            num = Convert.ToInt32(Console.ReadLine());

            if (num >= 0)
                soma += num;
        }

        Console.WriteLine("Soma total: " + soma);
    }
}
```

## 5. Menu de Opções (switch...case)

Crie um menu simples com as opções:

--- Menu --
1. Mostrar uma saudação (Olá, bem-vindo!)
2. Mostrar a data atual
3. Mostrar a hora atual  
4. Executar o fatorial de um número menor que 16

Opção:

Use switch case para tratar as escolhas do usuário.

Espaço para resposta:
***Escrita Algorítmica***
1. Inicio
2. Definir var opcao (string), num, fatorial, i (inteiros), data, hora (DateTime)
3. Mostre um Menu com Saudações, Data atual, Hora Atual e conta fatorial
4. Leia opcao
5. Escolha opcao
6. Caso 1: 
	 6-1. Mostre "Olá, bem-vindo!"
7. Caso 2:
	 7-1. Mostre a Data
8. Caso 3:
	8-1. Mostre a hora
9. Caso 4:
	9-1. Mostre "Digite um número menor que 16:"
	9-2. Leia num
	9-3. Se num < 16 e num >= 0
		9-4. Para  1 até num
			9-5. fatorial = fatorial * i
		Fim-para
	9-6. Mostre num "=" fatorial
	  9-7. Senão mostre "Número inválido!" 
	  Fim-se
10. Caso Padrão:
	 10-1. Mostre "Opção Inválida" 
	Fim-escolha
11. Fim


***Código***
```cpp
class Menu
{
    static void Main(String[] args)
    {
		  int opcao = Convert.ToInt32(Console.ReadLine()!);
        Console.WriteLine("--- Menu ---");
        Console.WriteLine("1. Mostrar uma saudação");
        Console.WriteLine("2. Mostrar a data atual");
        Console.WriteLine("3. Mostrar a hora atual");
        Console.WriteLine("4. Executar o fatorial de um número menor que 16");
        Console.Write("\nOpção: ");

        switch (opcao)
        {
            case 1:
                Console.WriteLine("Olá, bem-vindo!");
                break;

            case 2:
                DateTime data = DateTime.Now;
                Console.WriteLine("Data atual: " + data.ToString("dd/MM/yyyy"));
                break;

            case 3:
                DateTime hora = DateTime.Now;
                Console.WriteLine("Hora atual: " + hora.ToString("HH:mm:ss"));
                break;

            case 4:
                Console.Write("Digite um número menor que 16: ");
                int num = Convert.ToInt32(Console.ReadLine());

                if (num < 16 && num >= 0)
                {
                    int fatorial = 1;
                    for (int i = 1; i <= num; i++)
                    {
                        fatorial *= i;
                    }
                    Console.WriteLine("Fatorial de " + num + " = " + fatorial);
                }
                else
                {
                    Console.WriteLine("Número inválido!");
                }
                break;

            default:
                Console.WriteLine("Opção Inválida");
                break;
        }
    }
}
```

## 6. Tabuada de um Número (for)

Solicite um número inteiro, positivo, depois exiba sua tabuada de 1 a 10
usando for.  
Exemplo:  
Digite um número: 7  
7 x 1 = 7  
7 x 2 = 14  
\...  
7 x 10 = 70

Espaço para resposta:
***Escrita Algorítmica***
1. Inicio
2. Definição num, c (Inteiro)
3. Ler num
4. Para 1 até 10
	4-1.Mostre num x c = num * c
5. Fim


***Código***
```cpp
class Tabuada
{
    public static void Main(String[] args)
    {
      int num;

      Console.WriteLine("TABUADA\n=======");
      Console.Write("\nQual a tabuada que você quer calcluar? ");
      num = Convert.ToInt32(Console.ReadLine());

      for (int c = 1; c <= 10; c++)
        Console.WriteLine($"{num} X {c} = {num * c}");
    }
}
```

## 7. Contagem Regressiva (do...while)

Faça um programa que inicie em 60 e conte regressivamente até 0 usando
do\...while.  
Ao final: exiba a mensagem "Lançar foguete!".

Espaço para resposta:
***Escrita Algorítmica***
1. Inicio
2. Definição var contadora (inteiro)
3. Fazer
	3-1. Mostre c
	3-2. Espere 1 segundo para mostrar o c
	3-3. Decremente o número 1 por vez
4. Enquanto c >=0
5. Mostre Que o foguete vai lançar
6. FIM

***Fluxograma***


***Código***
```cpp
class Contagem
{
    public static void Main(String[] args)
    {
        int c = 60;

        do
        {
            Console.WriteLine(c);
            Thread.Sleep(1000);

            c--;
        } while (c >= 0);
        Console.WriteLine("LANÇAR! 🚀");
    }
}
```

## 8. Média de Notas (while + if...else)

Peça as notas dos alunos (uma por vez).  
Quando o usuário digitar uma nota negativa, encerre e calcule a média
geral.  
Depois, informe se o aluno está Aprovado (\>=6) ou Reprovado.

Espaço para resposta:
***Escrita Algorítmica***
1. Inicio
2. Definir Vars nota, m, soma (decimal), c (inteiro)
3. Fazer
	3-1. Ler nota
	3-2. Se a nota >=0
		3-3. Calcule soma += nota
		3-4. Incremente mais um na var contadora
4. Enquanto nota >= 0
5. Se c >= 0
	5-1. Processe m = soma / c
	5-2. Mostre M
	5-3. Se m >= 6 mostre que foi Aprovado se não Reprovado
6. Se não mostre que não foi digitado nenhuma nota válida
    Fim-Se
7. FIM


***Código***
```cpp
class Program
{
    static void Main(string[] args)
    {
        int c = 0;
        double nota, m, soma = 0;
        
        Console.WriteLine("Cálculo de Média dos Alunos");
        Console.WriteLine("============================");
        
        do
        {
            Console.Write($"Digite a nota {c + 1}: ");
            nota = Convert.ToDouble(Console.ReadLine());
            
            if (nota >= 0)
            {
                soma += nota;
                c++;
            }
            
        } while (nota >= 0);
        
        if (c > 0)
        {
            m = soma / c;
            Console.WriteLine($"\nMédia geral: {m:0.00}");
            Console.WriteLine(m >= 6 ? "Aprovado" : "Reprovado");
        }
        else
         Console.WriteLine("\nNenhuma nota válida foi digitada.");
    }
}
```

## 9. Verificação de Login (if...else + do...while)

Simule um pequeno sistema de login:  
- O usuário deve digitar usuário e senha.  
- Só encerra quando os dados corretos forem informados.  
- Use do\...while para repetir a tentativa.

Espaço para resposta:
***Escrita Algorítmica***
1. Inicio
2. Definição vars user = "", passwd = ""
3. Faça 
	3-1. Ler user
	3-2. Ler passwd
	3-3. Se user == "Troli" && passwd "184122"
		3-4. Mostre ✓ Acesso Liberado!
	3-5. Senão Mostre ✗ Usuário ou senha incorretos. Tente novamente
	Fim-Se
4. Enquanto user != "Troli" ou passwd != "184122"
5. FIM

***Código***
```cpp
namespace VerificacaoLogin;

class Program
{
    static void Main(string[] args)
    {
        String user = "", passwd = "";

        Console.WriteLine("LOGIN\n=====");
       
        do
        {
            Console.Write("Qual seu usuário? \n");
            user = Console.ReadLine()!;

            Console.Write("Qual sua senha secreta? \n");
            passwd = Console.ReadLine()!;

            if (user == "Troli" && passwd == "184122")
              Console.WriteLine("\n✓ Acesso Liberado!");
            else
              Console.WriteLine("\n✗ Usuário ou senha incorretos. Tente novamente.\n");

        } while (user != "Troli" || passwd != "184122");

    }
}
```
## 10. Cálculo com Escolha de Operação (switch...case + if) 

Peça dois números e um símbolo de operação (+, -, \*, /).  
Use switch\...case para executar a operação escolhida e mostrar o
resultado.  
Dica: trate a divisão por zero com if.

Espaço para resposta:
***Escrita Algorítmica***
1. Inicio
2. Definição Variáveis n1, n2 (Inteiro) opcao (String)
3. Ler opcao
4. Escolha opcao
5. Caso *
	5-1. Ler n1
	5-2. Ler n2
	5-3. Mostre o resultado do calculo
6. Caso /
	6-1. Ler n1
	6-2. Ler n2
		6-3. Se n2 = 0
				6-4. Mostre que não existe divisão por 0
		6-5.Se não mostre o resultado do calculo
		Fim-Se
7. Caso -
	7-1. Ler n1
	7-2. Ler n2
	7-3. Mostre o resultado do calculo
8. Caso +
	8-1. Ler n1
	8-2. Ler n2
	8-3. Mostre o resultado do calculo
9. Caso Contrário
	9-1. Mostre que essa é uma opção inválida
10. FIM


***Código***
```cpp
namespace Calculadora
{
    internal class Program
    {
        static void Main(String[] args)
        {
            int n1,
                n2;
            Console.WriteLine("===CALCULADORA===");
            Console.WriteLine("* : Multiplicação");
            Console.WriteLine("/ : Divisão");
            Console.WriteLine("- : Subtração");
            Console.WriteLine("+ : Adição");
            Console.Write("Qual calculo você quer fazer? ");
            String opcao = Console.ReadLine()!;

            switch (opcao)
            {
                case "*":
                    Console.Write("\nDigite o primeiro número: ");
                    n1 = Convert.ToInt32(Console.ReadLine());
                    Console.Write("Digite o segundo número: ");
                    n2 = Convert.ToInt32(Console.ReadLine());

                    Console.WriteLine($"\n{n1} * {n2} = {n1 * n2}");
                    break;
                case "/":
                    Console.Write("\nDigite o primeiro número: ");
                    n1 = Convert.ToInt32(Console.ReadLine());
                    Console.Write("Digite o segundo número: ");
                    n2 = Convert.ToInt32(Console.ReadLine());
                    if (n2 == 0)
                        Console.WriteLine("ERROR! Não existe divisão por zero");
                    else
                        Console.WriteLine($"\n{n1} / {n2} = {n1 / n2}");
                    break;

                case "-":
                    Console.Write("\nDigite o primeiro número: ");
                    n1 = Convert.ToInt32(Console.ReadLine());
                    Console.Write("Digite o segundo lugar: ");
                    n2 = Convert.ToInt32(Console.ReadLine());

                    Console.WriteLine($"\n{n1} - {n2} = {n1 - n2}");
                    break;

                case "+":
                    Console.Write("\nDigite o primeiro número: ");
                    n1 = Convert.ToInt32(Console.ReadLine());
                    Console.Write("Digite o segundo lugar: ");
                    n2 = Convert.ToInt32(Console.ReadLine());

                    Console.WriteLine($"\n{n1} + {n2} = {n1 + n2}");
                    break;

                default:
                    Console.WriteLine("Opção Inválida");
                    break;
            }
        }
    }
}
```