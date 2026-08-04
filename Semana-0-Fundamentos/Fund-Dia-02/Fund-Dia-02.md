# Day#F02: O Endereço das Coisas (IP, DNS e Portas)

# O endereço das coisas (IP e portas)

Você já parou pra pensar como um pacote de dados sabe exatamente pra onde ir na internet? A resposta está em três conceitos que, à primeira vista, parecem complicados: o endereço IP, a porta de rede e a notação CIDR. Pra explicar isso de um jeito que realmente gruda, eu gosto de recorrer a uma analogia que aprendi com o professor Yukio, do curso de segurança cibernética do Senac: o prédio Copan.

## Endereçamento IP (IPv4 vs IPv6) e a notação CIDR (como 192.168.1.0/24)

Logo nas primeiras aulas do curso, já tivemos contato com o que é o endereçamento IP, como ele funciona e qual a diferença entre IP público e privado. E é aí que entra a analogia do Copan.

O Copan é um prédio bem conhecido, localizado na cidade de São Paulo. Assim como a internet é ampla e tem suas delimitações, mas não tem um endereço específico, podemos comparar a cidade de São Paulo com a internet, nesta analogia. O Copan é um grande edifício que contém diferentes serviços dentro dele, como o habitacional e as lojas diversas no térreo. Nesse caso, em nossa rede, o Copan é um servidor: ele é o responsável por providenciar os serviços.

Suponhamos que nós moramos no Copan e compramos um notebook pelo Mercado Livre para que seja entregue em nosso apartamento. Nessa analogia, o notebook é o pacote de dados, ele é quem precisa ser entregue. Para que uma encomenda chegue do galpão do Mercado Livre até o Copan, até onde estamos morando, o entregador precisa saber não só o endereço do Copan (isso é muito fácil de descobrir, né?). O difícil é: ao chegar no Copan, como ele vai saber que a encomenda é para o Vinicius Dias, do apartamento 12 do Bloco B?

O Copan, nesse caso, é somente o nosso **endereço público** (Avenida Ipiranga, 200), aquele que fica visível para todos no Google Maps (na internetwork), para que saibam que ele existe. Porém, para que a encomenda seja entregue no Copan, ao chegar no prédio é necessário que o entregador passe pela portaria, né? A portaria, nesse caso, é o **Gateway Padrão**, assim como os roteadores que temos em casa, que são responsáveis por todo pacote de dados que sai e entra na nossa rede.

Mas, quando o entregador chegar na Avenida Ipiranga, 200 (o IP), vai descobrir que o Copan tem mais de mil apartamentos e dezenas de lojas no térreo. Se ele simplesmente deixar a encomenda na portaria, não terá cumprido a entrega. Ainda é necessário identificar quem vai receber, porque, senão, qualquer um pode roubar. Por isso se especifica o número do apartamento. Essa é a **Porta de Rede**.

No mundo dos servidores, assim como no Copan, cada porta oferece um serviço diferente. Por exemplo:

- A **padaria no térreo** pode ser a porta 80 ou 443: ela é aberta ao público, qualquer pessoa pode entrar, olhar a vitrine e comprar um pão. Em redes, isso é um servidor Web (HTTP/HTTPS) recebendo seus visitantes.
- A **sala da administração**, por exemplo, pode ser a porta 22 (SSH): ela fica trancada e restrita, só pessoas com credencial podem entrar e fazer a manutenção do prédio.

Mas, ao chegar no Copan, o entregador que está com meu notebook precisa entregá-lo no apartamento 12 do Bloco B (que, em uma rede de computadores, pode corresponder a uma porta aleatória alta, como 54321). Eu sou um morador (usuário) que fez o pedido no Mercado Livre de um notebook e está esperando a resposta (o notebook) chegar na minha porta. Então basta que ele entregue para mim, na minha porta, no apartamento 12 do Bloco B.

## O que é a notação CIDR (como 192.168.1.0/24)

Ainda utilizando a analogia do Copan, essa é a forma que os "entregadores" da internet usam para saber, com um olhar rápido, qual é o tamanho do bloco de prédios (da rede). CIDR significa Classless Inter-Domain Routing (Roteamento entre Domínios sem Classe). É, basicamente, uma maneira muito mais rápida de escrever a máscara de sub-rede (subnet mask).

Um endereço IPv4 possui 4 partes (octetos). O que o computador enxerga são 32 bits (zeros e uns, nada além disso). A notação CIDR (a barra e o número) diz exatamente quantos desses 32 bits estão travados para identificar a rede (nesse caso, a rua), sobrando o resto para identificar os hosts (os apartamentos).

Se utilizarmos o 192.168.1.0/24, o /24 diz que os primeiros 24 bits, da esquerda para a direita, estão travados. Eles formam a nossa rede.

E o que sobra? Como o IP tem 32 bits no total, sobram 8 bits (32 - 24 = 8 bits) para colocar os dispositivos na rede. Com 8 bits, conseguimos 2^8 = 256 combinações. Na prática, ficam 254 computadores, pois o primeiro endereço é a própria rede, e o último é o broadcast.

Em nossa analogia, a notação CIDR seria basicamente um sistema inteligente de zoneamento, utilizado pelo síndico para agrupar os apartamentos. O número depois da barra (como o /24) define exatamente a fronteira entre onde termina a identificação do bloco (a rede) e onde começam os números das portas (os hosts). Se o endereço IP isolado é só uma localização, o CIDR especifica o tamanho desse agrupamento:

- Um **/32** aponta para um apartamento específico.
- Um **/24** agrupa todas as 256 portas de um andar inteiro.
- Um **/16** representa dezenas de andares de uma vez.

Por exemplo: se a portaria é o nosso roteador, podemos dizer que o porteiro é o nosso firewall, e é ele quem permite entrada e saída no prédio. Para ele, é bem mais fácil e seguro receber uma regra dizendo "bloqueie o acesso de visitantes ao andar /24 inteiro" do que receber uma prancheta com 256 números de apartamentos diferentes para fiscalizar e ir bloqueando um por um.

# O que são endereços públicos e privados (RFC 1918)

Se todo dispositivo conectado à internet precisasse de um endereço IP único e exclusivo, os números do IPv4 já teriam acabado há muito tempo. A solução para isso está na RFC 1918, e dá pra entender ela sem sair da nossa analogia do prédio Copan.

## Por que existe essa divisão

A RFC 1918 é uma solução encontrada quando perceberam que os endereços IPv4 iam acabar muito rápido. Decidiu-se dividir os IPs em duas categorias: os que existem na internet pública e os que são de uso privado.

## IP público vs. IP privado

Seguindo a nossa analogia, o **IP público** é o endereço físico do prédio Copan: Avenida Ipiranga, 200, São Paulo, SP, CEP 01046-925. Esse endereço é único no mundo inteiro. Qualquer entregador (um roteador da internet) sabe exatamente o caminho para chegar até ele.

Já o **IP privado** é como o número do meu apartamento: Apt 12. O problema é que existem milhares de apartamentos 12 espalhados pelo Brasil. Se você fizer um pedido de notebook no Mercado Livre dizendo "entregar no Apt 12", ele será descartado, porque o carteiro não sabe em qual prédio fica esse apartamento 12.

Na internet funciona exatamente assim: roteadores públicos descartam imediatamente qualquer pacote de dados que tenha um endereço IP privado. IPs privados não são roteáveis na internet.

Mas então, como eu, que moro no apartamento 12, vou falar com o resto do mundo? Se o meu computador (Apt 12) tem um IP privado, como ele consegue acessar o Google, que está na internet pública? A resposta é o **NAT** (Network Address Translation), que, na nossa analogia, seria a portaria do Copan.

## A analogia da pizza

Eu (Apt 12, IP privado 192.168.1.10) quero pedir uma pizza portuguesa no restaurante ABC. Entrego meu pedido na portaria (o roteador, ou Gateway Padrão), e o porteiro apaga o remetente "Apt 12" e refaz o pedido com "remetente: Avenida Ipiranga, 200 (IP público do roteador, 203.0.113.1)". Ele anota o pedido em uma prancheta interna: "quando chegar a pizza portuguesa do restaurante ABC, ela é para o morador do apartamento 12".

A pizzaria (a internet) entrega a resposta no prédio (o IP público). O porteiro olha a prancheta e entrega a pizza (o pacote) para o meu apartamento (o IP privado interno).

Com isso, uma empresa privada com 5.000 dispositivos, por exemplo, precisaria comprar somente um único IP público para se conectar à internet.

## Quem organiza os endereços

Para fixarmos essa diferença entre IP público e IP privado, podemos imaginar que a prefeitura de São Paulo (na internet, seria a **IANA**, o órgão responsável por controlar os IPs globais) criou uma regra para a cidade: a prefeitura só mapeia ruas e avenidas. O que acontece dentro de cada terreno particular é problema dos donos.

Os IPs públicos são os endereços oficiais mapeados pelo GPS da cidade. Eles precisam ser únicos, pagos e registrados. É o caso do Copan, que fica na Avenida Ipiranga, 200, ou do MASP, que fica na Avenida Paulista, 1578. Se um carteiro recebe uma carta para um IP público, ele olha o mapa global e sabe exatamente em qual rua, cidade e país aquele endereço fica.

Para explicar os endereços privados, podemos seguir essa mesma analogia da prefeitura. A prefeitura disse: "para não esgotarmos os números de ruas, os síndicos de prédios como o Copan podem usar as numerações internas que quiserem dentro dos seus prédios, desde que escolham um dos padrões fornecidos".

Essas numerações só fazem sentido da porta do prédio pra dentro. Se gritarmos "Apartamento 12!" no meio da rua, ninguém sabe de qual prédio estamos falando. O síndico (que, nesse caso, pode ser o administrador de redes) escolhe o padrão dependendo do tamanho de "rede" que ele precisa montar.

## As faixas de IP privado (Classe A, B e C)

### Classe C (192.168.x.x)

A faixa Classe C é o nosso corredor residencial. Na nossa analogia, é o padrão perfeito para um prédio pequeno, ou apenas para um corredor do Copan. O síndico só precisa numerar alguns apartamentos (por exemplo, Apt 10, Apt 12).

Na vida real, isso representa as redes domésticas: o roteador Wi-Fi de casa sempre dá um endereço IP como 192.168.0.15. Essa faixa suporta até 256 dispositivos (no caso de uma rede /24).

### Classe B (172.16.x.x até 172.31.x.x)

A faixa Classe B é a galeria comercial do Copan, aquela que fica no térreo e contém lojas, cafés e restaurantes. O padrão de enumeração aqui é diferente do corredor de apartamentos: precisa ser bem maior, pra acomodar blocos e subdivisões, como Loja 70A e Loja 70B.

Na vida real, essa faixa é usada por empresas de médio porte, como escolas, ou por sistemas que precisam de redes maiores, suportando até cerca de 65 mil dispositivos.

### Classe A (10.x.x.x)

A faixa Classe A é o projeto completo do Copan: o esquema de numeração que o prédio precisa para organizar os 6 blocos, os 1.160 apartamentos e os mais de 5 mil moradores. O síndico precisa de um sistema gigante de números para que não falte identificação para ninguém.

Na vida real, essa faixa é utilizada por redes gigantescas, como datacenters, serviços de nuvem (AWS, Azure) e grandes empresas, já que essa classe permite milhões de IPs internos diferentes (10.0.0.0/8).

# O funcionamento do DNS: como google.com vira um IP

Depois de entender o endereço IP e as portas, falta uma peça no quebra-cabeça: como a gente digita um nome como "google.com" no navegador e, magicamente, chega no lugar certo? É aí que entra o DNS, e a nossa analogia do Copan ajuda a explicar isso também.

## Como o DNS traduz nomes em IPs (a analogia do táxi)

Para entender o DNS, seguindo a mesma analogia, podemos usar o exemplo de uma viagem de táxi. Se eu, morador do Copan, chamar um táxi, não vou dizer "por favor, me leve até a Avenida Ipiranga, 200, Bloco A, na latitude X, longitude Y". Eu vou dizer "me leve no Copan", porque o prédio é um marco referencial na cidade de São Paulo, e será bem mais fácil para o taxista identificar aonde ele deve ir.

O **DNS** é o taxista experiente, aquele que trabalha na região central de São Paulo há mais de 30 anos. Ele guarda um catálogo mental das ruas do centro de SP e sabe exatamente o endereço e a rota até lá (o IP) quando alguém diz apenas o nome conhecido (o **domínio**), assim como eu fiz quando pedi o táxi e disse somente "me leve no Copan".

Eu digo ao taxista: "estou indo para casa, no prédio Copan" (esse é o nome de domínio, que poderia ser https://www.copan.com).

O taxista (o DNS) consulta o catálogo de dados que tem guardado e diz: "ah, o Copan fica na Avenida Ipiranga, 200".

Ele vai me levar até lá, traduzindo o nome conhecido no endereço exato da rua para onde eu quero ir.

## As portas mais comuns

Como expliquei anteriormente, se o IP é o endereço do nosso prédio, as portas são os locais específicos lá dentro que oferecem serviços. Alguns exemplos: a 80, para HTTP; a 443, para HTTPS; a 53, para DNS; a 22, para SSH; e a 3389, para RDP.

### Portas 80 e 443 (HTTP e HTTPS)

A porta 80 (**HTTP**) e a porta 443 (**HTTPS**) representam o térreo comercial do Copan, cheio de lojas abertas ao público. É aqui que os visitantes da rua entram para consumir os produtos (na internet, os conteúdos como sites, vídeos e blogs).

Podemos imaginar a porta 80 (HTTP) como uma loja de roupas com vitrine de vidro transparente, sem segurança. Qualquer pessoa que passa no corredor consegue ver exatamente o que você está falando com o vendedor lá dentro da loja. Em redes, o tráfego da porta 80 representa um dado em texto claro, sem segurança. Se essa loja tivesse uma fechadura eletrônica com senha e alguém a digitasse ali, um atacante poderia interceptar o tráfego pela rede e ler perfeitamente a senha digitada.

Já a porta 443 (HTTPS) é a agência bancária dentro do Copan. Assim como a loja, ela também é aberta ao público, mas, assim que você entra, a conversa com a gerente acontece dentro de uma sala à prova de som. Ninguém que está lá fora, passando no corredor, consegue ouvir ou entender o que você está conversando com a gerente. O tráfego de dados nessa porta é criptografado (**TLS/SSL**): não é possível entender o conteúdo sem quebrar a criptografia.

### Porta 53 (DNS)

A porta 53 (DNS) é o balcão de informações do Copan, logo na entrada do prédio. O tempo todo chegam visitantes confusos perguntando: "moço, em qual bloco e andar fica a loja de roupas ABC?" (o visitante sabe o nome da loja, mas não sabe onde ela fica). A porta 53 é o recepcionista, que consulta a lista e responde: "fica no IP 142.250.x.x". Essa porta trabalha o dia inteiro, freneticamente, recebendo perguntas curtas e devolvendo respostas rápidas (usando o protocolo **UDP**).

### Porta 22 (SSH)

A porta 22 (**SSH**) é a porta trancada da manutenção. No fundo do Copan, bem longe dos visitantes, existe uma porta pesada de aço, daquelas blindadas, sabe? Só a equipe de engenharia e os administradores de TI do Copan têm a chave (as credenciais ou chaves criptográficas). O SSH (Secure Shell) é o acesso administrativo seguro: se você estiver configurando um servidor Linux via terminal para treinar técnicas de pentest ou rodar scripts em Python para automação, é por essa porta que vai acessar a máquina remotamente, de forma criptografada.

### Porta 3389 (RDP)

Por último, a porta 3389 (**RDP**, Remote Desktop Protocol) é o controle da administração. O síndico do Copan tem um sistema onde ele pode ver a tela do computador que fica na administração e usar o mouse de onde estiver, seja na casa dele, que não é necessariamente no Copan, ou viajando com a família. Diferente do SSH, que geralmente é só uma tela preta de terminal, o RDP transmite a interface gráfica inteira do sistema.
