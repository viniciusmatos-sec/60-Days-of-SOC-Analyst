# Day#F01: Como os Dados Navegam (Redes e Protocolos)

# Padrões de Rede: Modelos OSI e TCP/IP

O modelo OSI e o TCP/IP representam uma forma de padronizar a rede de computadores através de protocolos.

---

## Por que a padronização é necessária?

No início da concepção das redes de computadores, na década de 1970 e 1980, diversas empresas em diferentes regiões fabricavam seus próprios dispositivos com padrões proprietários. Esta fragmentação impossibilitava a comunicação entre a rede de uma determinada universidade ou empresa e outras redes distintas.

Para resolver este problema, foram concebidos modelos padrão em camadas que permitem essa comunicação entre dispositivos heterogêneos. Assim, apesar do fabricante diferente, eles possuem os mesmos padrões e podem se comunicar entre si, mesmo que não estejam na mesma LAN (*Local Area Network*). As redes locais, seja na sua rede em casa ou na rede da empresa onde você trabalha, são interconectadas globalmente. A internet só existe por conta disto; foram os modelos OSI e TCP/IP que possibilitaram uma **internetwork** (rede de redes).

Mas como eles funcionam? Eles trabalham em camadas, onde cada camada engloba diversos protocolos. Um protocolo é basicamente a linguagem que os computadores usam para se comunicarem, assim como nós nos comunicamos em Português, Inglês ou qualquer outro idioma.

---

## O Modelo TCP/IP

Assim como no curso do Jeremy's IT Lab na aula sobre os modelos TCP/IP e OSI, vou começar explicando como o modelo TCP/IP funciona. Ele é dividido em cinco camadas (ou quatro, dependendo da referência, mas a visão de cinco camadas alinha-se melhor com o modelo híbrido educativo), sendo elas, na sequência:

### 1. Camada Física (*Physical Layer*)

Transmite bits fisicamente utilizando meios de comunicação como o cabo UTP que você tem em casa e conecta ao roteador, ou a fibra óptica (FTTH - *Fiber-to-the-Home*) que sai da operadora até o seu roteador via um dispositivo chamado ONU ou ONT (*Optical Network Terminal*). Nesta camada também está o Wi-Fi e a NIC (*Network Interface Card*), que é a placa de rede responsável por converter os dados lógicos do computador em sinais elétricos, luminosos ou de rádio para trafegar pelo meio físico, além de gerenciar o acesso direto ao hardware da rede.

### 2. Camada de Rede Local (*Data Link Layer*)

É basicamente a camada que faz a comunicação *hop-to-hop* (salto a salto) dentro da sua rede local através dos endereços MAC (*Media Access Control*). O switch utiliza esta camada; ele faz a leitura dos quadros (*frames*) da rede e identifica o endereço MAC de cada dispositivo para encaminhar os dados para o destino correto dentro da mesma rede física.

### 3. Camada de Internet (*Network Layer*)

É a responsável por fazer a comunicação entre uma rede e outra rede através do endereço IP, utilizando a comunicação *end-to-end* (ponta a ponta). A *internetwork*, que é basicamente a interconexão entre redes permitindo hoje o acesso a diversos serviços, só é possível por conta desta camada. Os roteadores utilizam esta camada; são eles que fazem a comunicação e o roteamento entre as diferentes redes.

### 4. Camada de Transporte (*Transport Layer*)

É responsável pelo fornecimento do serviço correto através das portas. Vamos pegar o exemplo do Google: é uma empresa que providencia diferentes serviços. Ao enviar uma requisição para o Google, como eu vou saber se quero acessar o Google Notícias ou o Google Imagens? Isto é feito através das portas, que estão acopladas ao endereço IP e permitem que acessemos corretamente cada serviço específico.

### 5. Camada de Aplicação (*Application Layer*)

Define como a aplicação vai criar, enviar e interpretar um determinado dado. Por exemplo, se quero enviar um determinado e-mail para alguém, qual será o protocolo utilizado? Quem vai decidir é a camada de aplicação.

---

## O Desafio de Aprender Protocolos

Ao aprender sobre cada protocolo disponível, o processo é bastante complicado, pois são diversos protocolos. Normalmente, ao aprendê-los todos de uma vez, nós os vemos agrupados em uma "caixinha" (camada) e não entendemos qual é realmente o seu objetivo individual. Por isso, é bom estar ciente de que existem diversos protocolos que podem se encaixar em uma ou mais camadas.

---

## OSI vs. TCP/IP: Por que o TCP/IP venceu?

Outra grande dúvida que acontece no processo de estudo dos modelos é como eles se diferenciam e para que cada um serve. O modelo OSI e o TCP/IP são modelos bem semelhantes, e o objetivo é o mesmo: padronizar a comunicação entre redes.

Porém, o mais utilizado atualmente é o TCP/IP, e isto tem um motivo histórico. O modelo OSI foi criado pela ISO (*International Organization for Standardization*) em 1984. É um modelo excelente e teoricamente muito robusto, porém ele não é versátil. As organizações por trás dele impuseram regras extremamente rígidas, tornando-o complexo demais para a rápida implementação. Um exemplo prático dessa rigidez é que o modelo OSI exigia implementações complexas de autenticação e controle de fluxo em cada camada, o que o tornava lento e burocrático para os engenheiros da época.

Por outro lado, o TCP/IP nasceu da ARPANET (a precursora da internet) e era focado em simplicidade e eficiência ("o simples funciona"), permitindo que as redes crescessem de forma descentralizada e rápida, o que acabou consolidando-o como o padrão da internet.

---

## Transporte de Dados: TCP vs. UDP

Na camada de Transporte, temos dois protocolos muito importantes: o TCP (*Transmission Control Protocol*) e o UDP (*User Datagram Protocol*). Qual a diferença entre os dois?

Eu descobri de uma maneira muito fácil em uma das aulas da primeira UC do curso técnico de Segurança Cibernética do SENAC, no qual eu havia entrado e acabei não conseguindo dar continuidade. O professor Ganda explicou em uma aula que o protocolo TCP funciona com um processo chamado *Three-Way Handshake* (aperto de mão de três vias). Antes de enviar a mensagem, ele estabelece uma conexão, verifica se todos os dados chegaram corretamente e, se um pedaço do dado não chegar, ele solicita e envia novamente. É muito utilizado ao abrir sites, onde a integridade do dado (como uma página HTML ou um arquivo) é crucial.

Por outro lado, o UDP só envia o dado ao destino, sem esperar que seja verificado se ele chegou. Se algum dado ficar perdido neste transporte, ele não se importa e continua transmitindo. Ele é bem rápido por conta disso, e as transmissões ao vivo (como *streaming*) que assistimos no YouTube, Twitch, etc., são permitidas por conta dele. Em uma live, é melhor pular um quadradinho na imagem (perder um pacote) do que travar o vídeo todo para esperar o pacote chegar (o que o TCP faria).

---

## Encapsulamento de Dados

Como um pacote de dados é encapsulado e enviado através da rede?

Para entender como o processo de encapsulamento de um dado é enviado através de uma rede, eu fiz uma pergunta à inteligência artificial (Manus) e ela me retornou um site muito interessante, que mostra visualmente o processo. O site é o [OSI Model Web](https://osi-model-web.vercel.app/). Ao entrar, você procura pela parte de animação de mensagem interativa e escreve uma determinada mensagem que simulará o envio de um celular a outro. Eu escrevi `"Hello, World"`, e automaticamente o site começa a mostrar animações demonstrando por qual camada a mensagem está passando, bem como a animação de recebimento.

É possível ver no site que, ao enviar uma mensagem, o processo de encapsulamento começa. A cada camada que a mensagem atravessa de cima para baixo, ela adiciona um cabeçalho (contendo informações de endereçamento e controle para aquela camada específica). Ao chegar na rede do receptor, o processo de **decapsulamento** inicia-se a partir da camada física, recebendo os sinais elétricos e removendo os cabeçalhos da camada 1 até a camada 7 (ou 5, no modelo TCP/IP).

O processo é o seguinte:

| Camada | O que é adicionado |
|:---|:---|
| **Aplicação** | O usuário cria a mensagem |
| **Apresentação** | Criptografia e compressão (modelo OSI) |
| **Sessão** | A sessão é estabelecida (modelo OSI) |
| **Transporte** | Portas de origem e destino |
| **Rede** | IP de origem e destino |
| **Enlace de Dados** | MAC de origem e destino |
| **Física** | Conversão em sinais elétricos, luminosos ou de rádio |

Ao chegar no receptor, começa o processo de decapsulamento, que é basicamente o inverso: o dispositivo vai removendo os cabeçalhos adicionados a cada salto, até que a mensagem original chegue intacta à camada de aplicação do destinatário.
