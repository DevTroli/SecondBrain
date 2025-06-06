## Introdução
O Arch Linux oferece várias maneiras de recuperar senhas de redes Wi-Fi salvas através de comandos bash, tornando simples o processo de redescobrir credenciais de conexões já estabelecidas.

## Métodos de Recuperação

### 1. Comando NetworkManager
```bash
nmcli device wifi show-password
```
- Exibe a senha da rede Wi-Fi atualmente conectada
- Método mais direto e simples
- Requer que você esteja conectado à rede

### 2. Busca em Arquivos de Configuração
```bash
sudo grep -r "psk=" /etc/NetworkManager/system-connections/
```
- Lista senhas de todas as redes salvas
- Requer privilégios de administrador
- Mais abrangente que o método anterior

### 3. Listagem Detalhada de Conexões
```bash
nmcli connection show
```
- Mostra todas as conexões de rede salvas
- Útil para identificar o nome exato da conexão

### 4. Exportação Detalhada
```bash
nmcli -g 802-11-wireless,802-11-wireless-security connection show "Nome_da_Rede"
```
- Fornece informações específicas sobre uma conexão
- Substitua "Nome_da_Rede" pelo nome da rede desejada

## Considerações de Segurança
- Utilize esses comandos apenas em redes que você possui autorização
- Mantenha o sistema atualizado
- Proteja o acesso de administrador

## Dica Extra
Recomenda-se usar o `sudo` ou estar no grupo `wheel` para executar comandos que acessam informações sensíveis de rede.