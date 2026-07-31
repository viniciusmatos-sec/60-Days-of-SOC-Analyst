# 🛡️ 60 Days of SOC Challenge — Do Zero ao Portfólio

Um desafio de 60 dias (+ uma semana de fundamentos) de imersão prática na rotina de um **Analista de SOC (Security Operations Center)**. O objetivo é sair da teoria pura e construir, documentar e publicar um homelab completo de detecção e resposta a incidentes — usando apenas ferramentas open source e gratuitas — como prova de habilidade real para recrutadores e gerentes de segurança.

Este repositório documenta minha jornada dia a dia: o que estudei, o que configurei, quais ataques simulei, o que detectei e como investiguei — com evidências (screenshots) para cada etapa.

## 🎯 O que eu vou aprender com este projeto

- Fundamentos de redes, protocolos e sistemas operacionais aplicados à segurança (Semana 0)
- Montagem de um Homelab de SOC do zero: Wazuh, ELK/Kibana, TheHive, Wireshark e Suricata
- Simulação de ataques reais (Brute Force, PowerShell malicioso, C2, Phishing) com Atomic Red Team
- Triagem e investigação de alertas em um SIEM
- Análise de tráfego de rede e Email Forensics
- Extração e enriquecimento de IOCs (VirusTotal, AlienVault OTX)
- Threat Hunting proativo usando o framework MITRE ATT&CK
- Gestão de casos e resposta a incidentes (framework NIST) com o TheHive
- Automação SOAR (fluxos de resposta automática, regras Sigma, redução de falsos positivos)
- Como documentar e apresentar um projeto técnico de forma profissional

---

## 📅 Semana 0 — Fundamentos (pré-Homelab)

| Day | Título | Descrição da Task | Nível |
|:---:|--------|--------------------|:---:|
| F01 | Como os Dados Navegam (Redes e Protocolos) | Modelo OSI, TCP x UDP, encapsulamento de pacotes | Iniciante |
| F02 | O Endereço das Coisas (IP, DNS e Portas) | IPv4/IPv6, CIDR, IP público x privado, DNS, portas comuns | Iniciante |
| F03 | O Coração do Sistema (Windows e Linux) | Event Viewer, Event IDs, /var/log, auth.log, comandos grep | Iniciante |
| F04 | Os Pilares da Segurança | Tríade CIA, Firewalls Stateless x Stateful, IDS x IPS | Iniciante |
| F05 | Quem é o Inimigo? (Tipos de Ataques) | Phishing, Malware/Ransomware, DDoS, MITM, conceito de IOC | Iniciante |
| F06 | As Ferramentas do Ofício (SIEM e MITRE) | O que é um SIEM, framework MITRE ATT&CK, Threat Intelligence | Iniciante |
| F07 | O Ciclo de Vida de um Incidente (IR) | Framework NIST de Resposta a Incidentes, Criptografia x Hashing | Iniciante |

---

## 🚀 Desafio Oficial — 60 Dias

### Semana 1 — Fundamentos e Montagem do Homelab

| Day | Título | Descrição da Task | Nível |
|:---:|--------|--------------------|:---:|
| 01 | Arquitetura de um SOC | Desenho do diagrama lógico do ambiente | Iniciante |
| 02 | Instalação do Wazuh Manager | Setup do servidor Wazuh | Iniciante |
| 03 | Instalação de Agentes Wazuh | Deploy em VM Linux e VM Windows | Iniciante |
| 04 | Windows Security Logs | Ingestão e análise de Event IDs (4624/4625) | Intermediário |
| 05 | Logs Linux | Ingestão e análise de Syslog/Auditd | Intermediário |
| 06 | Regras e Alertas Personalizados | Criação de regras customizadas no Wazuh | Intermediário |
| 07 | Dashboards no Kibana | Criação de painéis de visualização | Intermediário |

### Semana 2 — Detecção de Ataques de Força Bruta

| Day | Título | Descrição da Task | Nível |
|:---:|--------|--------------------|:---:|
| 08 | Brute Force SSH | Simulação de ataque com Hydra | Intermediário |
| 09 | Investigação Brute Force SSH | Triagem do alerta no Wazuh | Intermediário |
| 10 | Brute Force RDP | Simulação de ataque em ambiente Windows | Intermediário |
| 11 | Investigação Brute Force RDP | Triagem do alerta no Wazuh | Intermediário |
| 12 | Active Response | Bloqueio automático configurado | Intermediário |
| 13 | Integração com Slack/Telegram | Notificação de alertas em tempo real | Intermediário |
| 14 | Playbook de Resposta a Incidentes | Primeiro playbook (Brute Force) | Intermediário |

### Semana 3 — Análise de Malware e C2

| Day | Título | Descrição da Task | Nível |
|:---:|--------|--------------------|:---:|
| 15 | Atomic Red Team | Introdução à execução de testes de ataque | Intermediário |
| 16 | PowerShell Malicioso (T1059) | Simulação de execução suspeita | Avançado |
| 17 | Investigação PowerShell | Detecção e investigação no SIEM | Avançado |
| 18 | Tráfego C2 | Simulação de Command & Control | Avançado |
| 19 | Análise no Wireshark | Investigação de tráfego suspeito | Intermediário |
| 20 | Regras de Detecção de Malware | Criação de regras básicas | Avançado |
| 21 | Documentação: Incidente de Malware/C2 | Relatório completo do incidente | Intermediário |

### Semana 4 — Análise de Phishing e Email Forensics

| Day | Título | Descrição da Task | Nível |
|:---:|--------|--------------------|:---:|
| 22 | Teoria de Email Forensics | Entendimento de cabeçalhos (Headers) | Iniciante |
| 23 | Análise de Phishing na Prática | Caso real via LetsDefend | Intermediário |
| 24 | Extração de IOCs | IPs, URLs e Hashes extraídos do e-mail | Intermediário |
| 25 | Investigação de IOCs | VirusTotal e AlienVault OTX | Intermediário |
| 26 | Automação em Python | Script para extração automática de IOCs | Avançado |
| 27 | Email Analyzer | Construção de ferramenta própria | Avançado |
| 28 | Documentação: Incidente de Phishing | Relatório completo do incidente | Intermediário |

### Semana 5 — Threat Hunting e Investigação Avançada

| Day | Título | Descrição da Task | Nível |
|:---:|--------|--------------------|:---:|
| 29 | MITRE ATT&CK Aprofundado | Estudo detalhado do framework | Intermediário |
| 30 | Hunt: Lateral Movement | Caça proativa por movimento lateral | Avançado |
| 31 | Hunt: Credential Dumping | Caça proativa por roubo de credenciais | Avançado |
| 32 | Análise de Rede com Zeek/Suricata | Investigação de tráfego de rede | Avançado |
| 33 | Correlação Avançada de Eventos | Cruzamento de dados no SIEM | Avançado |
| 34 | Hipóteses de Hunt | Formulação baseada em IOCs recentes | Avançado |
| 35 | Documentação: Threat Hunting | Relatório da operação de caça | Intermediário |

### Semana 6 — Incident Response e Gestão de Casos

| Day | Título | Descrição da Task | Nível |
|:---:|--------|--------------------|:---:|
| 36 | Instalação do TheHive | Setup da plataforma de gestão de casos | Intermediário |
| 37 | TheHive + MISP | Integração com plataforma de Threat Intel | Avançado |
| 38 | Simulação de Ataque Completo | Cadeia de ataque ponta a ponta | Avançado |
| 39 | Abertura de Ticket no TheHive | Case criado com base no ataque simulado | Intermediário |
| 40 | Triagem do Incidente | Investigação estruturada | Intermediário |
| 41 | Contenção e Mitigação | Ações práticas de resposta | Avançado |
| 42 | Relatório Pós-Incidente | Documentação final do caso | Intermediário |

### Semana 7 — Automação SOAR e Detecção Proativa

| Day | Título | Descrição da Task | Nível |
|:---:|--------|--------------------|:---:|
| 43 | Introdução ao SOAR (Shuffle) | Primeiros passos com automação | Intermediário |
| 44 | Enriquecimento de IOCs | Fluxo automatizado via VirusTotal | Avançado |
| 45 | Bloqueio Automático de IP | Automação de resposta no Firewall | Avançado |
| 46 | Regras em Formato Sigma | Criação de regras de detecção | Avançado |
| 47 | Conversão de Regras Sigma | Adaptação para Wazuh/ELK | Avançado |
| 48 | Alert Tuning | Redução de falsos positivos | Avançado |
| 49 | Documentação: Fluxos de Automação | Relatório dos SOAR playbooks | Intermediário |

### Semana 8 — Revisão, Otimização e Portfólio

| Day | Título | Descrição da Task | Nível |
|:---:|--------|--------------------|:---:|
| 50 | Otimização de Dashboards (parte 1) | Revisão de performance | Intermediário |
| 51 | Otimização de Dashboards (parte 2) | Revisão de performance | Intermediário |
| 52 | Repositório GitHub Profissional | Organização final do repo | Iniciante |
| 53 | Documentação da Arquitetura | Descrição completa do Homelab | Intermediário |
| 54 | Vídeo/Diagrama do Ambiente | Material visual de apresentação | Intermediário |
| 55 | Preparação para Entrevistas (parte 1) | Estudo de perguntas técnicas | Iniciante |
| 56 | Preparação para Entrevistas (parte 2) | Estudo de perguntas técnicas | Iniciante |
| 57 | 🎁 Bônus: Honeypot (Cowrie) | Setup de honeypot SSH | Avançado |
| 58 | 🎁 Bônus: Análise de PCAP Real | Caso real via CyberDefenders | Avançado |
| 59 | 🎁 Bônus: SIEM na Nuvem | Setup em AWS/Azure Free Tier | Avançado |
| 60 | 🏁 Publicação Final do Portfólio | Conclusão e revisão geral do desafio | Iniciante |

---

## 🗂️ Estrutura do Repositório

```
60-Days-of-SOC-Analyst/
├── README.md
├── Semana-0-Fundamentos/
│   ├── Fund-Dia-01/
│   │   ├── Fund-Dia-01.md
│   │   └── img/
│   └── ... (até Fund-Dia-07)
├── Semana-01-Homelab/
│   ├── Dia-01/
│   │   ├── Dia-01.md
│   │   └── img/
│   └── ... (até Dia-07)
├── Semana-02-Forca-Bruta/         # Dias 08-14
├── Semana-03-Malware-C2/          # Dias 15-21
├── Semana-04-Phishing/            # Dias 22-28
├── Semana-05-Threat-Hunting/      # Dias 29-35
├── Semana-06-Incident-Response/   # Dias 36-42
├── Semana-07-SOAR/                # Dias 43-49
└── Semana-08-Portfolio/           # Dias 50-60
```

Cada pasta de dia contém:
- `Dia-XX.md` — relatório do dia (objetivo, conceitos, execução prática, análise e evidências)
- `img/` — screenshots que comprovam a execução da tarefa

---

## 🎯 Goals

- [ ] Completar a Semana 0 de fundamentos antes de iniciar o Homelab
- [ ] Manter consistência: pelo menos 1 commit a cada 1-2 dias
- [ ] Anexar no mínimo 3 evidências (prints) por dia de tarefa prática
- [ ] Documentar não só o "como", mas o "por quê" de cada alerta/decisão
- [ ] Publicar o portfólio completo e funcional ao final dos 60 dias
- [ ] Usar o projeto como material de estudo para entrevistas de SOC Analyst

---

## 📝 Notas

> Este desafio é inspirado no projeto original "60 Days of SOC Challenge" de Faizan Shakir, adaptado e expandido com base em estruturas de outros projetos concluídos com sucesso na comunidade (xrajneesh, JhOe, Iamfazi).

- Ferramentas usadas: Wazuh, ELK/Kibana, Wireshark, Suricata, TheHive, Atomic Red Team, VirusTotal, AlienVault OTX, Shuffle (SOAR).
- Ambiente: VirtualBox rodando no meu setup pessoal (iMac 2010 + Linux Mint / Mac Mini M2).
- Todas as ferramentas utilizadas são gratuitas/open source.

---

## 👤 About Me

**Vinicius Matos**
Estudante de Segurança da Informação (FATEC Santana de Parnaíba) | Em preparação para CCNA

- 🔗 GitHub: [@viniciusmatos-sec](https://github.com/viniciusmatos-sec)
- 💼 LinkedIn: [@viniciusmatos](https://linkedin.com/in/vinicius-matos-3b16141b2)
- 📧 Contato: [@viniciusdiasmatos101@proton.me](viniciusdiasmatos101@proton.me)
