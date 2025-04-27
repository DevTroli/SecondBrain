###### pensamentos soltos
- charset (character set) --> Qual o tipo de carácteres do teclado será configurado, Um padrão global de charset para referencia é o charset UTF-8 (usado em Json)
- 
- Curl (Client Url)-->  é como um client igual um chrome mas sem a parte gráfica dele
- Estrutura básica de uma request, response seria header, cookies, body & status code
 **Como funciona request & response de acessar um URL na web por debaixo dos panos:**
```bash
** Host localhost:3000 was resolved.
** `IPv6: ::1`
** `IPv4: 127.0.0.1`
**   `Trying [::1]:3000...`
** `Connected to localhost (::1) port 3000`
** `using HTTP/1.x`
> `GET /api/status HTTP/1.1`
> `Host: localhost:3000`
> `User-Agent: curl/8.13.0`
> `Accept: */*`
 
** `Request completely sent off`
`< HTTP/1.1 200 OK`
`< ETag: "edkmaff26z17"`
`< Content-Length: 43`
`< Date: Sun, 27 Apr 2025 01:39:52 GMT`
`< Connection: keep-alive`
`< Keep-Alive: timeout=5`
`<` 
** `Connection #0 to host localhost left intact`
`Ficando perigoso como desenvolverdor na web%`                                   ```

Para lidar com HTTP apropriadamente nós precisamos fazer um desvio no caminho e entedner oque são **Endpoints** pois ao usar o protocolo HTTP você querendo ou não vai se deparar com esse tal de Endpoint e entender ele vai te ajudar a entder mais sobre o HTTP.

#### Mas que diachos é um Endpoint ??
Sua terminologia representa literalmente ser um End Point (Um ponto/local final), ou seja, qualquer endereço URL na internet é um endepoint, por exemplo youtube.com/feed/you é um endpoint ou google.com também é um endpoint porque é muito comum entender um endpoint como o endereço forncedio por uma API (???)

#### E agora oque é uma API?
Uma APi (Application Programming Interface), também conhecida como Interface programática da aplicação, mas isso não explica nada oque ela significa e porque elas são tão relevantes na comunidade tech e em toda a internet. Aprenda com esse texto ([[API]]) para ter um entendimento mais embasado das finalidades de uma API.







