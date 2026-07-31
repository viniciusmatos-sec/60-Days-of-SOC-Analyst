#!/bin/bash
# ============================================================
# Script de criação de estrutura - 60 Days of SOC Challenge
# Inclui Semana 0 (Fundamentos) + Semanas 1-8 (Dias 1-60)
# Rode este script DENTRO da pasta raiz do seu repositório Git.
# ============================================================

set -e

criar_dia() {
  local pasta_semana="$1"
  local pasta_dia="$2"
  local arquivo_md="$3"
  local titulo="$4"
  local numero="$5"

  mkdir -p "$pasta_semana/$pasta_dia/img"

  cat > "$pasta_semana/$pasta_dia/$arquivo_md" << EOF
# Day#${numero}: ${titulo}

## 1. Objetivo do Dia
[Escreva 1 ou 2 frases sobre o que você queria aprender ou alcançar hoje.]

## 2. Conceitos Fundamentais
[Explique o conceito principal do dia.]

Se houver comandos usados:
\`\`\`bash
seu_comando_aqui
\`\`\`

## 3. Execução Prática (Lab)
- **Ferramentas utilizadas:** [Ex: Wazuh, Wireshark, Windows 10]
- **Passo 1:** [...]
- **Passo 2:** [...]

## 4. Análise e Conclusão
[O que você aprendeu com a tarefa de hoje?]

## 5. Evidências
![Print 1](img/print1.png)

---
**Comando Git para enviar este dia:**
\`git add . && git commit -m "Finalizando Dia ${numero}: ${titulo}"\`
EOF

  echo "Criado: $pasta_semana/$pasta_dia/"
}

echo "======================================================"
echo " Criando Semana 0 - Fundamentos (começa amanhã)"
echo "======================================================"

SEMANA0="Semana-0-Fundamentos"
declare -a TITULOS_S0=(
  "Como os Dados Navegam (Redes e Protocolos)"
  "O Endereço das Coisas (IP, DNS e Portas)"
  "O Coração do Sistema (Windows e Linux)"
  "Os Pilares da Segurança (CIA, Firewalls, IDS/IPS)"
  "Quem é o Inimigo (Tipos de Ataques e IOCs)"
  "As Ferramentas do Ofício (SIEM e MITRE ATT&CK)"
  "O Ciclo de Vida de um Incidente (NIST IR)"
)
for i in "${!TITULOS_S0[@]}"; do
  n=$(printf "%02d" $((i+1)))
  criar_dia "$SEMANA0" "Fund-Dia-${n}" "Fund-Dia-${n}.md" "${TITULOS_S0[$i]}" "F${n}"
done

echo ""
echo "======================================================"
echo " Criando Semanas 1-8 - Desafio Oficial (Dias 1-60)"
echo "======================================================"

# --- Semana 1: Fundamentos e Montagem do Homelab ---
SEM="Semana-01-Homelab"
declare -a T=(
  "Arquitetura de um SOC e desenho do diagrama lógico"
  "Instalação e configuração do Wazuh Manager"
  "Instalação de Agentes Wazuh (VM Linux e VM Windows)"
  "Ingestão e análise de Windows Security Logs (Event IDs)"
  "Ingestão e análise de logs Linux (Syslog/Auditd)"
  "Criação de regras e alertas personalizados no Wazuh"
  "Criação de Dashboards no Kibana"
)
DIA=1
for titulo in "${T[@]}"; do
  n=$(printf "%02d" $DIA)
  criar_dia "$SEM" "Dia-${n}" "Dia-${n}.md" "$titulo" "$n"
  DIA=$((DIA+1))
done

# --- Semana 2: Detecção de Ataques de Força Bruta ---
SEM="Semana-02-Forca-Bruta"
declare -a T=(
  "Simulação de ataque de Brute Force SSH (Hydra)"
  "Investigação do alerta de Brute Force SSH no Wazuh (Triage)"
  "Simulação de ataque de Brute Force RDP (Windows)"
  "Investigação do alerta de Brute Force RDP no Wazuh"
  "Configuração de bloqueio automático (Active Response)"
  "Integração do Wazuh com Slack/Telegram para alertas"
  "Criação do primeiro Playbook de Resposta a Incidentes"
)
for titulo in "${T[@]}"; do
  n=$(printf "%02d" $DIA)
  criar_dia "$SEM" "Dia-${n}" "Dia-${n}.md" "$titulo" "$n"
  DIA=$((DIA+1))
done

# --- Semana 3: Análise de Malware e C2 ---
SEM="Semana-03-Malware-C2"
declare -a T=(
  "Introdução à execução de testes com Atomic Red Team"
  "Simulação de execução suspeita via PowerShell (T1059)"
  "Detecção e investigação do comando PowerShell no SIEM"
  "Simulação de tráfego de rede C2"
  "Análise de tráfego de rede suspeito com Wireshark"
  "Criação de regras básicas para detecção de malware"
  "Documentação de um Incidente de Malware/C2"
)
for titulo in "${T[@]}"; do
  n=$(printf "%02d" $DIA)
  criar_dia "$SEM" "Dia-${n}" "Dia-${n}.md" "$titulo" "$n"
  DIA=$((DIA+1))
done

# --- Semana 4: Análise de Phishing e Email Forensics ---
SEM="Semana-04-Phishing"
declare -a T=(
  "Teoria de Email Forensics: entendimento de cabeçalhos"
  "Análise prática de um e-mail de phishing (LetsDefend)"
  "Extração de IOCs (IPs, URLs, Hashes)"
  "Investigação de IOCs com VirusTotal e AlienVault OTX"
  "Scripting em Python para automação de extração de IOCs"
  "Construção de uma ferramenta de Email Analyzer"
  "Documentação de um Incidente de Phishing"
)
for titulo in "${T[@]}"; do
  n=$(printf "%02d" $DIA)
  criar_dia "$SEM" "Dia-${n}" "Dia-${n}.md" "$titulo" "$n"
  DIA=$((DIA+1))
done

# --- Semana 5: Threat Hunting ---
SEM="Semana-05-Threat-Hunting"
declare -a T=(
  "Estudo aprofundado do framework MITRE ATT&CK"
  "Threat Hunting: busca por Lateral Movement"
  "Threat Hunting: busca por Credential Dumping"
  "Análise de Logs de Rede com Zeek/Suricata"
  "Correlação avançada de eventos no SIEM"
  "Formulação de hipóteses de Hunt baseadas em IOCs"
  "Documentação de uma operação de Threat Hunting"
)
for titulo in "${T[@]}"; do
  n=$(printf "%02d" $DIA)
  criar_dia "$SEM" "Dia-${n}" "Dia-${n}.md" "$titulo" "$n"
  DIA=$((DIA+1))
done

# --- Semana 6: Incident Response e Gestão de Casos ---
SEM="Semana-06-Incident-Response"
declare -a T=(
  "Instalação e configuração do TheHive"
  "Integração do TheHive com MISP"
  "Simulação de um Ataque Completo (Cadeia de ataque)"
  "Abertura de um Ticket (Case) no TheHive"
  "Triagem e investigação do Incidente"
  "Ações de Contenção e Mitigação"
  "Criação do Relatório Pós-Incidente"
)
for titulo in "${T[@]}"; do
  n=$(printf "%02d" $DIA)
  criar_dia "$SEM" "Dia-${n}" "Dia-${n}.md" "$titulo" "$n"
  DIA=$((DIA+1))
done

# --- Semana 7: Automação SOAR ---
SEM="Semana-07-SOAR"
declare -a T=(
  "Introdução a ferramentas SOAR (Shuffle)"
  "Fluxo automatizado para enriquecimento de IOCs"
  "Automação de bloqueio de IP malicioso no Firewall"
  "Criação de regras de detecção no formato Sigma"
  "Conversão de regras Sigma para o SIEM (Wazuh/ELK)"
  "Técnicas de Alert Tuning (redução de falsos positivos)"
  "Documentação dos fluxos de Automação criados"
)
for titulo in "${T[@]}"; do
  n=$(printf "%02d" $DIA)
  criar_dia "$SEM" "Dia-${n}" "Dia-${n}.md" "$titulo" "$n"
  DIA=$((DIA+1))
done

# --- Semana 8: Revisão, Otimização e Portfólio (Dias 50-60) ---
SEM="Semana-08-Portfolio"
declare -a T=(
  "Revisão e otimização de performance dos Dashboards (parte 1)"
  "Revisão e otimização de performance dos Dashboards (parte 2)"
  "Criação de um Repositório GitHub profissional e limpo"
  "Documentação completa da Arquitetura do Homelab"
  "Gravação de vídeo/diagrama detalhado do ambiente"
  "Preparação para entrevistas técnicas (parte 1)"
  "Preparação para entrevistas técnicas (parte 2)"
  "Projeto Bônus: Setup de um Honeypot (Cowrie)"
  "Projeto Bônus: Análise de PCAP de casos reais (CyberDefenders)"
  "Projeto Bônus: Instalação de um SIEM na Nuvem (AWS/Azure Free Tier)"
  "Publicação final do Portfólio e conclusão do desafio"
)
for titulo in "${T[@]}"; do
  n=$(printf "%02d" $DIA)
  criar_dia "$SEM" "Dia-${n}" "Dia-${n}.md" "$titulo" "$n"
  DIA=$((DIA+1))
done

echo ""
echo "======================================================"
echo " Estrutura criada com sucesso! Total de dias: $((DIA-1)) (desafio) + 7 (Semana 0)"
echo "======================================================"
echo ""
echo "Próximo passo sugerido:"
echo "  git add ."
echo "  git commit -m \"Estrutura inicial: Semana 0 + Semanas 1-8 (60 dias)\""
echo "  git push"
