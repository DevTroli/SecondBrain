## Entendendo sobre estrutura de repetição
#### **Objetivo:**
Aprender a usar as estruturas de repetição e decisão como por exemplo: ***for, while, do while, switch case***

### Por que usar estruturas de repetição?
- [ ] Automatizar tarefas repetitivas
- [ ] Reduzem redundância no código
- [ ] Tornam o programa mais eficiente

## Estrutura FOR
### Quando usar?
Quando o número de repetições é conhecido

### Sintaxe
```cpp title:codigo_FOR
for (variavel -> inicialização; condição; incremento)
{
\\ bloco de código, se tiver apenas uma linha não precisa dos '{}'
}
```
 
#### Exemplo de uso - FOR
``` cpp title:"Contagem do 1 ao 10"
for (int i = 1; i == 10; i++)
	Console.WriteLine("Número: " + i);
```

***Resultado esperado:*** Número 1, Número 2, Número 3, ... , Número 10

#### FOR com Vetores(Array)
``` cpp title:"Nome de distro linuxs"
string[] nomes = {"Arch", "Ubuntu", "Slackware", "CentOS", "Gentoo"};

for (int i = 0; i < nomes.Length; i++)
	Console.WriteLine(nomes[i]);
```

***Resultado esperado:*** Arch, Ubuntu, Slackware, CentOS, Gentoo

## Estrutura WHILE
### Quando usar?
Quando a condição é ***avaliada antes*** da execução e pode ***nem entrar*** no loop

### Sintaxe
``` cpp title:"código_while"
while (condição)
{
\\ bloco de código, se tiver apenas uma linha não precisa dos '{}'
}
```

### Exemplo de uso - WHILE
``` cpp title:"Validação de Entrada (senha)"
string senha = "";

while (senha != "1234")
{
  Console.Write("Digite sua senha: ");
  senha = Console.ReadLine();
}

Console.WriteLine("Acesso liberado");
```

## Estrutura DO WHILE
## Quando usar?
Quando o bloco deve ser executado ***pelo menos uma vez***

### Sintaxe
```cpp title:"código_DoWhile"
do
{
\\ bloco de código, se tiver apenas uma linha não precisa dos '{}'
}
while ();
```

## Exemplo de uso - DO WHILE
``` cpp title:"Número Positivo"
int num;

do {
  COnsole.WriteLine("Digite um número positivo");
  num = Convert.ToInt64(Console.ReadLine());
} while (num <= 0);
```

## WHILE vs DO WHILE

***WHILE***
- Verifica a condição ***antes*** de executar
- Pensar em mais coisas...

***DO WHILE***
- Executa ***pelo menos uma vez***, mesmo que a condição seja falsa de início
- Pensar em mais coisas


## Estrutura SWITCH CASE
### Quando usar?
Substitui múltiplos ***if-else*** baseados em uma única variável ou expressão

### Sintaxe
``` cpp title:"Código_switchCase"
switch (variavel)
{
	case valor1:
		// código
		break
	case valor2:
		// código
		break
	case valor3:
		// código
		break
	default:
		// código
		break 
}
```

### Exemplo de uso - SWITCH CASE
``` cpp title:"Escolhas"
Cnsole.Write("Digite um número de 1 a 3: ");
int opcao = Convert.ToInt64(Console.ReadLine());

switch (opcao)
{
	case 1:
		Console.WriteLine("Você escolheu 1");
		break
	case 2:
		Console.WriteLine("Você escoleu 2");
		break
	case 3
		Console.WriteLine("Você escolheu 3");
		break
	default:
		Console.WriteLine("Opção Inválida")
		break
}
```

### SWITCH com strings
```cpp title:"Cores"
String cores;
Console.Write("Tente adivinhar a cor que estou pensando: ");
cores = Console.ReadLine()!;
switch (cores.ToLower()){
	case "vermelho":
   Console.WriteLine("Parabéns você acertou, estava pensando em Vermelho");
   break;
   case "roxo":
   Console.WriteLine("Parabéns você acertou, estava pensando em Roxo");
   break;
   case "azul":
   Console.WriteLine("Parabéns você acertou, estava pensando em Azul");
   break;
   default:
   Console.WriteLine("Você errou, tente denovo outra cor!");
   break;
}
```

## CONCLUSÃO

- [ ] ***FOR*** = Ideal para contagens controladas
- [ ] ***WHILE*** = Executa se a condição for verdadeira
- [ ] ***DO WHILE*** = Executa ao menos uma vez
- [ ] ***SWITCH CASE*** = Útil para múltiplas condições baseadas em uma variável