# Day#F03: Vasculhando os Registros e Aprendendo a me Localizar (Event Logs, ls, pwd e Links Simbólicos)

# De Onde Vim, Pra Onde Vou: Windows Event Logs e os Primeiros Passos no Terminal Linux

Depois de passar os dois últimos dias entendendo como os dados viajam pela rede (Day#F01) e como cada pacote encontra o endereço exato dele (Day#F02), hoje resolvi dar um passo pra dentro da máquina. Em vez de perguntar "pra onde o dado está indo", a pergunta virou "o que já aconteceu aqui dentro?" e "onde exatamente eu estou agora?". Foi assim que estudei hoje três frentes diferentes: os Windows Event Logs, lá no TryHackMe, e os fundamentos de Linux com os comandos `ls` e `pwd`.

---

## Windows Event Logs: a Prancheta de Ocorrências do Sistema (TryHackMe, Tasks 1 a 4)

### Por que os logs existem

Lembra da prancheta do porteiro do Copan, que expliquei no Day#F02, onde ele anotava quem tinha pedido o quê pelo NAT? Os Event Logs são basicamente essa mesma ideia, só que aplicada a tudo que acontece dentro do prédio (o sistema operacional), e não só aos pedidos de entrega. Todo login, toda instalação de driver, todo erro de aplicativo fica registrado ali, com data, hora e detalhes.

Isso serve pra dois públicos bem diferentes: o administrador, que usa os logs pra fazer *troubleshooting* quando algo quebra, e o time de segurança (Blue Team), que usa os mesmos registros pra caçar ameaças e procurar indícios de que algo foi comprometido. É basicamente a mesma prancheta sendo lida com dois objetivos distintos.

Os logs se dividem em três categorias principais:

- **System Logs**: eventos do próprio sistema operacional, como hardware e drivers.
- **Security Logs**: eventos de auditoria de segurança, como logon e logoff.
- **Application Logs**: avisos e erros dos softwares instalados na máquina.

### O Visualizador de Eventos (Event Viewer)

A primeira forma de ler essa prancheta é pela interface gráfica, acessada digitando `eventvwr.msc`. Nela, cada evento aparece organizado em colunas: o Nível (*Level*), a Data/Hora, a Fonte (*Source*) de onde o evento veio, o ID do Evento (*Event ID*, que funciona como um código de identificação único pra cada tipo de ocorrência) e a Categoria da Tarefa (*Task Category*).

### wevtutil.exe: a mesma prancheta, só que pelo CMD

Só que nem sempre dá pra ficar clicando numa interface gráfica, principalmente se eu estiver numa máquina remota ou quiser automatizar alguma consulta. É aí que entra o `wevtutil.exe`, um utilitário de linha de comando pra gerenciar e consultar os logs direto pelo CMD.

| Parâmetro | Para que serve |
|:---|:---|
| `ep` | Lista todos os provedores de eventos disponíveis |
| `qe` | Consulta (*query*) os eventos de um log específico |
| `/c:X` | Limita a consulta a X eventos |
| `/rd:true` | Exibe os eventos em ordem reversa (mais recentes primeiro) |
| `/f:text` | Exibe o resultado em texto puro, mais fácil de ler |

### PowerShell e Get-WinEvent: a versão avançada de consulta

Por fim, o jeito mais moderno e flexível de analisar os logs é pelo PowerShell, usando o cmdlet `Get-WinEvent`. A grande vantagem dele é o parâmetro `-FilterHashtable`, que permite montar uma filtragem bem mais precisa usando uma tabela hash, tipo:

```
Get-WinEvent -FilterHashtable @{LogName='Application'; Level=4}
```

Isso já me devolve só o que interessa, sem precisar vasculhar evento por evento manualmente.

---

## Fundamentos de Linux: o Comando ls

### Operações básicas

Depois de mexer com Windows a manhã toda, à tarde troquei de ambiente e comecei os fundamentos de Linux. O primeiro comando que todo mundo aprende é o `ls`, usado pra listar arquivos e diretórios do local atual. Uma coisa que já reparei de cara é que o Linux diferencia maiúsculas de minúsculas: `File.txt` e `file.txt` são dois arquivos completamente distintos pro sistema, diferente do Windows. Sempre que bater dúvida sobre alguma opção do comando, o manual completo está a um `man ls` de distância.

### Exibição e formatação

A partir daí, fui vendo as opções que mudam a forma como a listagem aparece:

- `-a`: exibe todos os arquivos, incluindo os ocultos (aqueles que começam com ponto).
- `-l`: mostra a listagem detalhada, com permissões, proprietário e data.
- `-h`: deixa os tamanhos de arquivo legíveis pra humano (KB, MB), em vez de só bytes.

Essas opções podem ser combinadas, como `ls -lh` ou `ls -alh`. Um detalhe que achei interessante: a ordem das letras não muda nada no resultado. `ls -alh` é idêntico a `ls -hal`.

### Organização e classificação

Além de mostrar mais ou menos informação, o `ls` também organiza a listagem de formas diferentes:

- `-lt` / `-ltr`: classifica por data de modificação, do mais recente pro mais antigo (ou o inverso, com o `r` de *reverse*).
- `-S`: ordena pelo tamanho do arquivo, do maior pro menor.
- `-X`: classifica em ordem alfabética pela extensão do arquivo.
- `-1`: lista um arquivo por linha, o que é ótimo quando o resultado vai ser usado dentro de um script.
- `-R`: lista os subdiretórios recursivamente, entrando em cada pasta dentro da pasta atual.

Uma coisa útil que aprendi: dá pra inspecionar um diretório diferente do atual sem precisar se mover pra lá, só passando o caminho como argumento, tipo `ls -l test`.

---

## pwd e Links Simbólicos: Descobrindo Onde Eu Estou de Verdade

### O comando pwd e caminhos absolutos

Depois do `ls`, veio o `pwd` (*Print Working Directory*), que serve pra identificar exatamente onde eu estou dentro do sistema de arquivos naquele momento. Foi esse comando que me ajudou a fixar de vez o conceito de caminho absoluto: o caminho completo, contado a partir da raiz `/`, sem ambiguidade nenhuma sobre onde aquele arquivo ou pasta realmente fica. Ele também pode ser usado em conjunto com outros comandos de navegação, como o próprio `ls`, pra sempre saber de onde a listagem está sendo tirada.

### Links simbólicos: o apelido e o endereço de verdade (pwd -L vs pwd -P)

Aqui apareceu um paralelo direto com o que expliquei sobre DNS no Day#F02. Um link simbólico é basicamente um atalho: uma pasta que, na aparência, existe num lugar, mas que na verdade só aponta pra onde os arquivos estão de fato guardados. É quase a mesma lógica do domínio `google.com` apontando pro IP real do servidor.

E é exatamente por causa disso que o `pwd` tem duas variações:

- **`pwd -L` (caminho lógico)**: mostra o caminho baseado no atalho pelo qual eu passei, mantendo o nome do link simbólico na resposta. É como se eu perguntasse pro taxista "qual foi o nome que você usou pra me trazer aqui", mesmo que por trás desse nome exista um endereço físico diferente.
- **`pwd -P` (caminho físico)**: resolve o link simbólico e revela o diretório real de destino, o lugar onde os arquivos estão fisicamente armazenados. É o taxista largando o apelido de lado e dizendo o endereço de verdade, sem rodeio.

Faz total sentido essas duas opções existirem separadas: às vezes eu quero saber o "nome" que usei pra chegar ali (o atalho que faz sentido no meu fluxo de trabalho), e às vezes eu preciso saber exatamente onde os dados estão guardados de verdade, sem depender de apelidos no meio do caminho.

---

## A Prática do Dia

Fechei o dia concluindo as Tasks 1 a 4 do módulo de Windows Event Logs no TryHackMe, colocando a mão na massa tanto no Event Viewer quanto no `wevtutil` e no `Get-WinEvent`. Em seguida, pratiquei os comandos `ls` e `pwd` direto no terminal, testando as combinações de opções e navegando por pastas com links simbólicos até conseguir prever, antes mesmo de rodar o comando, se `pwd -L` e `pwd -P` iam me devolver a mesma resposta ou não.
