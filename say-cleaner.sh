#!/bin/bash

# Script para verificar possíveis backdoors em um sistema Linux
print_banner(){
   echo "-------------------------------------------------------------"
   echo "                                                             "
   echo "   _________                             *   * (())          "
   echo "  |  ______ @     ========  <><<>    <>><> *    ||* *   *    "
   echo "  @ @      \/    !!<><><>!!  !! !!  !! !!     * || *  *      "
   echo "   !!_____ _      @      @     !! @  !!    _____||_____      "
   echo "  /\____  ! !   !!  //\\  !!     \\\  //  * ||x,x,x,x,,x|| *   "
   echo "  | say-c ! !  |            |    |  | *   ||,x,x,x,x,x||   * "
   echo "  |_______!_!  !!__!    !__!!   !!__!!  * ||x,,x,,x,,x|| *   "
   echo "\\____________________________              _______________//"
   echo "                               \\         //                 "
   echo "#######************************ SAY-CLEANER **********#######"
   echo "-------------------------------------------------------------Versao 2.0"
   sleep 5
}

# Diretório para salvar as informações
pasta_saida="output_seguranca"

# Funcao para criar o diretório de saída, se não existir
criar_pasta_saida() {
    if [ ! -d "$pasta_saida" ]; then
        mkdir "$pasta_saida"
    fi
}

#salvar informações em um arquivo dentro do diretório de saída
salvar_info() {
    local info="$1"
    local ferramenta="$2"
    local timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
    local nome_arquivo="${pasta_saida}/${ferramenta}_${timestamp}.txt"
    echo "$info" > "$nome_arquivo"
}

#Funcao para imprimir cabeçalho
imprimir_cabecalho() {
    echo "--------------------------------------------------------"
    echo "      Verificação de Segurança no sistema Linux  M-B    "
    echo "--------------------------------------------------------"
    echo
}

#Funcao para verificar a integridade dos arquivos do sistema
verificar_integridade_arquivos() {
    echo "Verificando a integridade dos arquivos do sistema..."
    local resultado_integridade=$(tripwire --check 2>&1)
    echo "$resultado_integridade"
    salvar_info "$resultado_integridade" "integridade_arquivos"
    echo
}

#Funcao para analisar os regiistros de atividades do sistema
analisar_registros_atividades() {
    echo "Analisando registros de atividades do sistema..."
    local resultado_registros=$(grep -Ei "acesso não autorizado|login incomum|tentativa de acesso" /var/log/syslog 2>&1)
    echo "$resultado_registros"
    salvar_info "$resultado_registros" "registros_atividades"
    echo
}

#Funcaoo para monitorar o tráfego de rede
monitorar_trafego_rede() {
    echo "Monitorando o tráfego de rede..."
    local resultado_rede=$(sudo tcpdump -i eth0 -n 2>&1)
    echo "$resultado_rede"
    salvar_info "$resultado_rede" "trafego_rede"
    echo
}

# Funcao para verificar processos em execução
verificar_processos_execucao() {
    echo "Verificando processos em execução..."
    local resultado_processos=$(ps aux 2>&1)
    echo "$resultado_processos"
    salvar_info "$resultado_processos" "processos_execucao"
    echo
}

# Funcao para verificar serviços em execução
verificar_servicos_execucao() {
    echo "Verificando serviços em execução..."
    local resultado_servicos=$(netstat -tuln 2>&1)
    echo "$resultado_servicos"
    salvar_info "$resultado_servicos" "servicos_execucao"
    echo
}

# Funcao para verificar contas de usuário
verificar_contas_usuario() {
    echo "Verificando contas de usuário..."
    local resultado_contas=$(awk -F: '{print $1}' /etc/passwd 2>&1)
    echo "$resultado_contas"
    salvar_info "$resultado_contas" "contas_usuario"
    echo
}

# Funcao para realizar varreduras de malware
realizar_varreduras_malware() {
    echo "Realizando varreduras de malware..."
    local resultado_malware=$(clamscan -r --exclude-dir="caminho/para/excluir" / 2>&1)
    echo "$resultado_malware"
    salvar_info "$resultado_malware" "varredura_malware"
    echo
}

# Funcao para realizar auditorias de segurança
realizar_auditorias_seguranca() {
    echo "Realizando auditorias de segurança com o OpenVAS..."
    local resultado_auditoria=$(openvas-check-setup 2>&1)
    echo "$resultado_auditoria"
    salvar_info "$resultado_auditoria" "auditoria_openvas"
    echo
}

# Funca para realizar auditorias de segurança alternativa
realizar_auditorias_seguranca_alternativa() {
    echo "Realizando auditorias de segurança com o Nessus..."
    local resultado_auditoria=$(comando_nessus_aqui 2>&1)
    echo "$resultado_auditoria"
    salvar_info "$resultado_auditoria" "auditoria_nessus"
    echo
}

# Início do script
imprimir_cabecalho
criar_pasta_saida

sleep 10

# Banner
print_banner
sleep 10
# Executar as verificacoes
verificar_integridade_arquivos
sleep 10

analisar_registros_atividades
sleep 10

monitorar_trafego_rede
sleep 10

verificar_processos_execucao
sleep 10

verificar_servicos_execucao
sleep 10

verificar_contas_usuario
sleep 10

realizar_varreduras_malware
realizar_auditorias_seguranca

#Verificar se a auditoria do OpenVAS falhou
if [[ $? -ne 0 ]]; then
    echo "Auditoria do OpenVAS falhou. Então, executando auditoria alternativa com Nessus..."
    realizar_auditorias_seguranca_alternativa
fi

# Fim do script
echo "Verificação concluída."
