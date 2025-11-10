## Pontos-Chaves de Redes

### Modem Internet
- O nome modem vem de = (MO)ulação + (DEM)odulação
- A finalidade motriz de um modem é modular e demodular sinal digital em sinal elétrico, além de trafegar em canais de frequência por cabos de cobre ou fibra ótica até chegar ao "switch" central, no caso o provedor e em seguida ir direto ao provedor da internet
- Modem != Roteador (Porém a maioria dos modem tem essa função junto)
- Dentro de 20 vinte anos fomos de 1mb de internet pra 600mb onde é acessível a todos pagar por ela (isso pelo menos no brasil) 
- O processo de encaminhar dados entre dispositivos é oque chamamos de ***comutação***
- Transformar bits digitais em ondas elétricas é também conhecido como ***modulação***
- O ato inverso da modulação de recuperar bits é a ***demodulação***

###### Fluxo de dados de um modem
1. Seu computador gera dados digitais
2. O modem **modula** esses dados em sinais elétricos/ópticos
3. Os sinais trafegam por canais de frequência específicos via cabos até o **switch central** (provedor)
4. Do provedor, os dados seguem para os servidores da internet
5. No caminho inverso, o modem **demodula** os sinais recebidos de volta para dados digitais

###### Provedores de internet trabalham com bits não bytes

***Motivos de marketing e propaganda***: números maiores parecem mais impressionantes, pois provedores de internet trabalham com **bits por segundo (bps)**, não bytes
    
***Fórmula de conversão real da sua internet:***
- Velocidade anunciada (em megabits) ÷ 8 = Velocidade real (em megabytes)
- Exemplo: Internet de 300 Mbps ÷ 8 = **37,5 MB/s de velocidade real de download**
        
###### Exercício Prático: Calculando Tempo de Download

Um arquivo de música pesa em média 10 MB. Quanto tempo demoraria para baixá-la em um modem dos anos 90 com capacidade máxima de 56 kbps?

**Resolução:**
1. Converter 10 MB para bits: 10 × 8 = 80 megabits
2. Converter 56 kbps para Mbps: 56 ÷ 1.000 = 0,056 Mbps
3. Tempo = 80 Mbps ÷ 0,056 Mbps = **aproximadamente 1.428 segundos (≈ 24 minutos)**

**Reflexão:** Por que serviços de streaming de vídeo/música eram impossíveis nos anos 90 e 2000?

- As conexões eram extremamente lentas (56 kbps a 1 Mbps no máximo)
- Um vídeo em qualidade média (5 MB/min) demoraria horas para carregar
- Streaming requer transmissão contínua em tempo real, o que era tecnicamente inviável
- Hoje, com internet de 100-600 Mbps acessível, Streaming é comum
    

---

### Bit Vs Byte
- 1 byte == 8 bits
- VelocidadeReal/8
- O bit é a unidade de informação básica na computação, representa o binário 0 ou 1
- Um arquivo de música pesa em média 10mb, quanto iria demorar para em um modem dos anos 90 com capacidade máxima de 56kb?
- Entender melhor a logica algorítmica dos Streaming de vídeo/música e porque eles nunca poderiam existir nos anos 90 ou anos 2000?
##### Unidades de medida para dados de armazenamento (menor -> maior)
1. ***Bit*** (b) = Unidade mais básica composta de 0 e 1 
2. ***Byte*** (B) = Corresponde à 8 bits (ex: carácter texto) 
3. ***Kilobyte*** (KB) = Aproximadamente 1024 bytes ou 10³(ex: texto simples)
4. ***Megabytes*** (MB) = Aproximadamente 1024 kilobytes (Foto, Vídeo, MP3)
5. ***Gigabyte*** (GB) = Aproximadamente 1024 Megabytes (Filmes, Jogos, S.O)
6. ***Terabyte*** (TB) = Aproximadamente 1024 Gigabytes (Grandes BD & clouds)
7. ***Petabyte*** (PB) = Aproximadamente 1024 Terabytes 
8. ***Exabyte*** (EB) = Aproximadamente 1024 Terabytes 

### Transmissão de dados
##### Comutação (Switching)
**Comutação** é o processo de encaminhar dados entre dispositivos em uma rede

##### Circuit Switching (Comutação por Circuito) - Tecnologia Antiga
- Estabelece um **caminho dedicado e fixo** entre origem e destino antes de transmitir dados
- O caminho fica reservado durante toda a comunicação
- **Exemplo clássico:** ligações telefônicas tradicionais
    
***Vantagens:***
- Latência baixa e previsível
- Qualidade constante de conexão
        
***Desvantagens:***    
- Desperdício de recursos (o caminho fica ocupado mesmo sem dados sendo enviados)
- Difícil escalabilidade
- Tempo de configuração da conexão
        

##### Packet Switching (Comutação por Pacotes) - Tecnologia Moderna

Packet Switching é a evolução do Circuit Switching, ele divide os dados em pequenos **pacotes** que viajam independentemente pela rede. Cada pacote pode seguir rotas diferentes até o destino
***Exemplo:*** toda a internet moderna funciona com packet switching
    
***Vantagens:***
- Uso eficiente da largura de banda (recursos compartilhados)
- Escalabilidade: suporta milhões de usuários simultâneos
- Maior resistência a falhas (se uma rota falha, os pacotes encontram outra)
        
***Desvantagens:***
- Latência variável (pacotes podem chegar em momentos diferentes)      
- Necessita de protocolos mais complexos
        

##### Stateless vs Stateful - Gerenciamento de Estado em Redes

###### Stateless (Sem Estado) - Tecnologia Antiga
Cada requisição é tratada de forma **independente e isolada**, o sistema **não armazena** informações sobre interações anteriores. Cada pacote/requisição deve conter **todas as informações necessárias** para ser processado por ***Exemplo:*** protocolo HTTP básico, UDP
    
***Vantagens:***
- Simples de implementar        
- Fácil de escalar horizontalmente        
- Menor uso de memória no servidor
        
***Desvantagens:***
- Necessita reenviar informações repetidamente
- Dificulta sessões de usuário complexas

###### Stateful (Com Estado) - Tecnologia Moderna Popular
O sistema **lembra** de interações anteriores e mantém contexto entre requisições, armazena informações de sessão (estado) do cliente.
***Exemplo:*** conexões TCP, sessões de login em websites

***Vantagens:***
- Experiência de usuário mais fluida
- Permite workflows complexos (carrinho de compras, chat, etc.)
        
***Desvantagens:***
- Mais difícil de escalar        
- Maior uso de memória        
- Requer sincronização de estado em sistemas distribuídos
        

##### Datagramas - A Unidade Básica de Transmissão

***Datagrama*** é um pacote de dados enviado em uma rede **sem garantia de entrega, pontualidade nem ordem**. É como um "telegrama digital"
    
Contém informações suficientes para ser roteado do emissor ao receptor Não requer conexão pré-estabelecida entre os pontos
    
Usado principalmente pelo protocolo **IP (Internet Protocol)**
    
***Estrutura de um datagrama:***
- **Cabeçalho:** endereços IP de origem e destino, número de sequência, informações de roteamento        
- **Carga útil (payload):** os dados reais sendo transmitidos

### Meios de Transmissão Física

##### O que é um Cabo de Rede?
***Cabo de rede*** é o hardware físico que conecta dispositivos eletrônicos para permitir a **troca de dados e comunicação** em uma rede.

##### Categorias de Cabos (CAT)
- **CAT 5 e anteriores:** em desuso atualmente
- **CAT 5e e CAT 6:** padrão mais usado para uso regular/residencial (velocidades até 10 Gbps em CAT 6)
- **CAT 7 e CAT 8:** existem, mas são usados apenas em aplicações especiais/corporativas de alta performance

##### Tipos de Cabos e Fios

###### Par Trançado (Tipo de cabo de rede mais usado atualmente)
***Por que "trançado"?***
- Os fios são entrelaçados em pares para ***reduzir interferência eletromagnética***
- Alternativa mais acessível aos cabos coaxiais
    
***Tipos de Par Trançado:***
1. ***UTP (Unshielded Twisted Pair) - Sem Blindagem***
    - Não possui malha de proteção externa
    - Mais barato
    - Usado em ambientes residenciais e pequenos escritórios
        
2. ***STP (Shielded Twisted Pair) - Com Blindagem***    
    - Possui uma malha metálica em volta do cabo
    - Protege contra interferências eletromagnéticas externas
    - Mais caro, usado em ambientes industriais ou com muita interferência

**Material:** Cabo de cobre - melhor condutor de eletricidade, muito eficiente na transmissão de dados por meio de sinais elétricos.

##### Cabo Coaxial
Estrutura concêntrica com **quatro camadas:**    
1. Condutor central de cobre        
2. Camada isolante        
3. Blindagem metálica        
4. Capa protetora externa
        
Usado antigamente para TV a cabo e redes antigas entretanto mais resistente a interferências que o par trançado simples. Hoje, usado principalmente em conexões de antena e alguns sistemas específicos

##### Fibra Óptica
***Fibra óptica*** é um pequeno tubo de vidro ultrapuro onde **a luz trafega** transportando dados.

***Como funciona:***
- Os dados são convertidos em pulsos de luz
- A luz viaja pelo interior do tubo de vidro através de reflexões internas
- Se você acender uma ponta do fio, o outro lado também acenderá simultaneamente (demonstração do princípio de reflexão total interna)

***Vantagens:***
- Velocidades altíssimas (até terabits por segundo)
- Imune a interferências eletromagnéticas
- Distâncias muito longas sem degradação de sinal
- Maior segurança (difícil de interceptar)
    
**Desvantagens:**
- Mais caro que cabos de cobre
- Instalação mais delicada
- Equipamentos especializados necessários

##### Largura de Banda (Bandwidth)

***Bandwidth (banda larga ou largura de banda):***
- É o **máximo teórico de faixas de frequências** que o meio físico permite passar
- Medido em Hertz (Hz) ou bits por segundo (bps)
- Maior largura de banda = mais dados podem ser transmitidos simultaneamente
- ***Analogia:*** imagine a largura de banda como a largura de uma rodovia - quanto mais larga, mais carros (dados) podem trafegar ao mesmo tempo

##### Multiplexação (Multiplexing - MUX & DMUX)

**Multiplexação** é a técnica de **combinar múltiplos sinais/dados em um único canal de transmissão** para otimizar o uso da largura de banda.

###### MUX (Multiplexer - Multiplexador)
- Dispositivo que **combina vários sinais de entrada em uma única saída**
- Atribui uma frequência ou slot de tempo para cada sinal
- ***Exemplo:*** várias ligações telefônicas sendo transmitidas no mesmo cabo

###### DMUX (Demultiplexer - Demultiplexador)
- Dispositivo que **separa um sinal combinado de volta em seus componentes originais**
- Instalado na outra ponta da transmissão
- Decodifica cada sinal pela sua frequência/slot e envia para o destino correto
###### Tipos de Multiplexação
- **TDM (Time Division Multiplexing):** divide o tempo em slots, cada sinal transmite em um momento específico
- **FDM (Frequency Division Multiplexing):** divide o espectro de frequência, cada sinal usa uma faixa diferente
- **WDM (Wavelength Division Multiplexing):** usado em fibra óptica, divide os sinais por comprimento de onda (cor) da luz

##### Rede sem fio & Wi-Fi

***Como dados viram ondas?***
Transformamos dados em ondas usando o ar como nosso meio de transmissão em redes, como fazemos com nossas vozes propagando ondas sonoras no ar.
***Por exemplo*** se você gritar do seu gritar e alguém escutar da sala as ondas sonoras foram transmitidas da sua boca até a orelha da outra pessoa por meio do ar.

***Convenções definidas por politicas (Tipos de rede sem fio)***

***2.4 GHz***
- **Velocidade:** mediana 
- **Alcance:** entre 100 metros de distância (em ambientes abertos)
- Está na faixa **ISM (Industrial, Scientific, Medical)** junto com 900 MHz

*Vantagens:*
- Maior alcance
- Melhor alcance em paredes e obstáculos        
- Compatível com praticamente todos os dispositivos
        
*Desvantagens:*
- Mais congestionada (muitos dispositivos usam)        
- Velocidades menores        
- Mais interferência (microondas, Bluetooth, etc.)       

***5 GHz***
- **Velocidade:** alta
- **Alcance:** curto (menor alcance em obstáculos)
- Em 2001, a **FCC (Federal Communications Commission)** dos EUA - equivalente à Anatel no Brasil - abriu o uso comercial de frequências de **5 GHz até 64 GHz** para comunicação sem fio

*Vantagens:*
- Velocidades muito maiores  
- Menos congestionamento     
- Mais canais disponíveis
        
*Desvantagens:*
- Menor alcance
- Pior penetração em paredes
- Nem todos os dispositivos antigos suportam

### Protocolos e Controle de dados
##### PPP (Point-to-Point Protocol)
**PPP** é um protocolo da **camada de enlace (Layer 2)** usado para estabelecer uma **conexão direta entre dois nós de rede**.

***Características:***
- Encapsula datagramas para transmissão por vários tipos de links físicos (serial, modem, DSL)
- Suporta autenticação (PAP, CHAP)
- Suporta múltiplos protocolos de camada de rede (IP, IPX, etc.)
- **Full-duplex:** dados podem trafegar nas duas direções simultaneamente

##### ACK & NACK - Controle de Confirmação de Dados
Mecanismos fundamentais para garantir **transmissão confiável de dados**.

###### ACK (Acknowledgement - Confirmação)

- Sinal de **confirmação positiva** enviado pelo receptor ao emissor
- Indica que um pacote de dados foi **recebido com sucesso**
- Permite que o emissor saiba que pode enviar o próximo pacote    

***Exemplo:***
- → Cliente envia pacote #1
- → Servidor recebe
- → Servidor envia ACK #1
- → Cliente envia pacote #2
    

###### NACK (Negative Acknowledgement - Confirmação Negativa)
O Sinal indicando que houve **problema com o dado recebido**
  
***Pode significar:***
- Pacote perdido
- Pacote corrompido
- Erro na transmissão
- Solicita ao emissor que **retransmita** o pacote problemático

***Protocolos que usam ACK/NACK:***
- ***TCP:*** usa ACK extensivamente para garantir entrega confiável
- ***HDLC:*** usa tanto ACK quanto NACK
- ***Stop-and-Wait ARQ:*** espera ACK antes de enviar próximo pacote
- ***Go-Back-N ARQ:*** ao receber NACK, retransmite o pacote problemático e todos os subsequentes
    

###### Teorema de Shannon-Hartley - Capacidade Máxima de Canal
Desenvolvido pelo matemático **Claude Shannon** (considerado o "Pai da Teoria da Informação") e Ralph Hartley.

***O que é:***
- Fórmula matemática que calcula a **capacidade máxima teórica** de transmissão de dados em um canal de comunicação
- Considera a **largura de banda** e a **relação sinal-ruído (SNR)**
    
***Fórmula:***
[ C = B \time \log_2(1 + \frac{S}{N}) ]

***Onde***:
- **C** = Capacidade do canal (em bits por segundo - bps)
- **B** = Largura de banda do canal (em Hertz - Hz)
- **S** = Potência do sinal útil (em watts ou miliwatts)
- **N** = Potência do ruído presente no canal (em watts ou miliwatts)
- **S/N** = Relação sinal-ruído (Signal-to-Noise Ratio - SNR)
    

***Reflexão:***
- Quanto **maior a largura de banda**, maior a capacidade
- Quanto **melhor a relação sinal-ruído** (menos ruído), maior a capacidade
- Existe um **limite teórico máximo** de dados que pode ser transmitido sem erros em um canal com ruído

***Aplicação prática:***
- Engenheiros usam essa fórmula para **projetar e otimizar redes** (cabos, fibra óptica, Wi-Fi)
- Permite calcular a velocidade máxima teórica de uma conexão
- Fundamental para entender as limitações físicas das redes

### Conclusão e Próximos Passos

###### O que você aprendeu neste guia:
✅ **Fundamentos de medida de dados:** bits, bytes, e como calcular a velocidade real da sua internet
✅ **Modem e transmissão:** modulação/demodulação, evolução das conexões  
✅ **Comutação:** diferença entre circuit switching e packet switching  
✅ **Estado em redes:** stateless vs stateful  
✅ **Datagramas:** pacotes de dados sem garantia de entrega  
✅ **Meios físicos:** cabos (par trançado, coaxial, fibra óptica)  
✅ **Multiplexação:** MUX e DMUX para otimizar uso de canais  
✅ **Redes sem fio:** diferença entre 2.4 GHz e 5 GHz  
✅ **Protocolos:** PPP, ACK/NACK  
✅ **Teorema de Shannon-Hartley:** capacidade máxima de canal  

###### Próximos tópicos a estudar:
- **Protocolos TCP/IP:** funcionamento detalhado da internet
- **Camada de aplicação:** HTTP, HTTPS, FTP, SMTP
- **DNS:** como funciona a resolução de nomes
- **Endereçamento IP:** IPv4 vs IPv6, sub-redes, máscaras
- **Roteamento:** algoritmos e protocolos (RIP, OSPF, BGP)
- **Segurança em redes:** firewalls, VPN, criptografia
- **Switches vs Hubs vs Routers:** diferenças práticas
