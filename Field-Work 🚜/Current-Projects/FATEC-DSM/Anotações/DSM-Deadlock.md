#### O que é Deadlock?

Deadlock é uma situação em sistemas operacionais onde dois ou mais processos ficam presos esperando recursos que estão ocupados por outros processos, formando um impasse. Nenhum pode continuar até que o outro libere o recurso, o que nunca acontece, causando um bloqueio permanente do sistema.

Imagine duas pessoas em uma escada estreita: cada uma quer passar pela mesma parte, mas nenhuma quer recuar para deixar a outra passar. Isso é um deadlock — um impasse onde todos ficam bloqueados esperando.

#### As Quatro Condições para Deadlock

Para que um deadlock aconteça, quatro condições devem ocorrer ao mesmo tempo:

1. **Exclusão Mútua:** Cada recurso só pode ser usado por um processo de cada vez.  
2. **Posse e Espera:** Um processo segura um recurso e espera por outro.  
3. **Não Preempção:** Recursos não podem ser retirados à força, só liberados voluntariamente.  
4. **Espera Circular:** Existe uma cadeia circular de processos, onde cada um espera por um recurso que outro está segurando (formando um ciclo).

Se qualquer uma dessas condições for quebrada, o deadlock não ocorre.

#### Exemplos de Deadlock

- Processo A segura recurso X e espera recurso Y.  
- Processo B segura recurso Y e espera recurso X.  
Nenhum dos dois pode continuar, gerando impasse.

#### Como Lidar com Deadlock?

Existem quatro estratégias principais:

1. **Ignorar (Algoritmo da Avestruz):** Fingir que não existe, usado quando deadlocks são raros e o custo para lidar com eles é maior que o benefício (ex.: UNIX).  
2. **Prevenção:** Evitar a ocorrência de uma das quatro condições, como não permitir posse e espera.  
3. **Detecção e Recuperação:** Monitorar o sistema para detectar deadlock e então tomar ações, como abortar processos ou retirar recursos.  
4. **Evitação:** Analisar pedidos de recursos para evitar estados que poderiam levar a deadlocks (ex.: Algoritmo do Banqueiro).

#### Por que Deadlock é Importante?

Deadlocks paralisam sistemas, causando quedas de desempenho, falhas em aplicações e até paradas totais. Entender e gerenciar deadlocks é crucial para manter sistemas funcionando de forma confiável e eficiente.