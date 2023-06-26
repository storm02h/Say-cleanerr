# Say-cleaner

Nesse tuorial vc nao precisará de quase nada. Nem mesmo fazer nada.

Apenas se no tutorial 1 que vc fez todo o processo e o OpenVAS nao funcionou, nesse código 2. 
Caso o OpenVAS falhar, vc poderá usar o Nessus como alternativa.

Geralmente o código funciona de primeira. Mas se caso vc baixou OpenVAS, e achou complexo mesmo vendo o tutorial no Youtube,

E preferir usar Nessus, vc pode ir no site oficial deles e baixar : https://www.tenable.com/downloads/nessus?loginAttempted=true

Nao esqueça da boa prática de verificar as Hashs dos arquivos que vc baixa, ok?

Não se lembra como verificar hashs no linux?

Vamos recapitular:

No diretorio que vc baixou o arquivo do site nessus, execute esse comando, buddy:
=================================================================================
=> sha256sum nome_do_arquivo --> caso vc tenha baixdo em sha256

ou md5sum nome_do_arquivo --> caso o arquivo seja em md5
======================================================================================

==> Confira as hashs, se forem iguais, perfeito! se nao forem, consulte o seu médico local.

########################## CASO SUA VIBE SEJA MAIS ASSISTIR VÍDEOS #################################

esse tutorial vai te ajudar:

Está em inglês, mas foque nos comandos que ele vai utilizar no kali. Faça o mesmo no seu terminal Linux.

no linux o comando  dpkg é usado para decompactar arquivos .deb

quando vc baixar, faça a mesma coisa que vê no vídeo. 

Ex: dpkg -i nome_do_arquivo.deb  ".deb" ok?

ele extrairá todo o documento do arquivo pra vc. Na sua pasta/ diretório atual.

vc verá ele utilizando o comando /etc/init.d/nessus start  esse comando é usado para iniciar o serviço do
Nessus manualmente, caso ele não tenha sido iniciado automaticamente durante a inicialização do sistema.


no vídeo ele digita, https://kali.or, porque ele irá se conectar ao do kali na por 8834, ja que está usando o kali.

Faça isso:

nessuscli scanner --hostname <endereço_do_servidor> --port <porta> --user <nome_de_usuário> --password <senha>

Substitua <endereço_do_servidor> pelo endereço IP ou nome de domínio do servidor Nessus,

<porta> pela porta na qual o servidor Nessus está configurado para ouvir (por padrão, é 8834),
<nome_de_usuário> pelo seu nome de usuário do Nessus e <senha> pela sua senha do Nessus.

Pressione Enter para executar o comando.

Isso irá estabelecer a conexão com o servidor Nessus e você poderá interagir com ele através do terminal,
emitindo comandos e recebendo as saídas correspondentes.

Tenha certeza de ter configurado o nessus direitinho. Qualquer coisa basta voltar na documentação do Nessus.

#####################################################################################################################################

criar_pasta_saida():

 Essa função verifica se o diretório de saída especificado pela variável "pasta_saida" existe.
 Se o diretório não existir, a função cria o diretório utilizando o comando mkdir.
==================================================================================================================================

salvar_info():

 Essa função recebe informações, uma ferramenta e um timestamp como parâmetros.
 Ela cria um nome de arquivo utilizando a pasta de saída, a ferramenta e o timestamp fornecidos.
 Em seguida, ela salva as informações no arquivo utilizando o comando echo com a sintaxe,
 echo "$info" > "$nome_arquivo", onde "$info" é o conteúdo a ser salvo e "$nome_arquivo" é o caminho do arquivo de destino.

===================================================================================================================================

imprimir_cabecalho():

 Essa função exibe um cabeçalho na saída do console utilizando o comando echo. 
 O cabeçalho é uma mensagem de apresentação para indicar o início da verificação de segurança.

===================================================================================================================================

verificar_integridade_arquivos():
 
 Essa função verifica a integridade dos arquivos do sistema utilizando o comando tripwire --check.
 O resultado da verificação é armazenado na variável "resultado_integridade" utilizando a sintaxe $(comando) para
 capturar a saída do comando.
 Em seguida, o resultado é exibido no console utilizando o comando echo.
 As informações também são salvas em um arquivo utilizando a função salvar_info().

====================================================================================================================================

analisar_registros_atividades():
 
 Essa função analisa os registros de atividades do sistema, especificamente o arquivo "/var/log/syslog".
 Ela utiliza o comando grep para procurar por palavras-chave relacionadas a acesso não autorizado,
 login incomum ou tentativas de acesso.
 O resultado da análise é armazenado na variável "resultado_registros" utilizando a sintaxe $(comando).
 Em seguida, o resultado é exibido no console utilizando o comando echo.
 As informações também são salvas em um arquivo utilizando a função salvar_info().

====================================================================================================================================

monitorar_trafego_rede():
 
 Essa função monitora o tráfego de rede utilizando o comando tcpdump.
 O comando é executado com a opção "-i eth0" para especificar a interface de rede a ser monitorada.
 O resultado do monitoramento é armazenado na variável "resultado_rede" utilizando a sintaxe $(comando).
 Em seguida, o resultado é exibido no console utilizando o comando echo.
 As informações também são salvas em um arquivo utilizando a função salvar_info().

Obs: vc pode usar ifconfig ou link addr no lugar de "i eth0" tbem. 

====================================================================================================================================

verificar_processos_execucao(): 

Essa função verifica os processos em execução no sistema utilizando o comando ps aux. 
O resultado da verificação é armazenado na variável "resultado_processos" utilizando a sintaxe $(comando). 
Em seguida, o resultado é exibido no console utilizando o comando echo. 
As informações também são salvas em um arquivo utilizando a função salvar_info().

=====================================================================================================================================

verificar_servicos_execucao(): 

Essa função verifica os serviços em execução no sistema utilizando o comando netstat -tuln. 
O resultado da verificação é armazenado na variável "resultado_servicos" utilizando a sintaxe $(comando). 
Em seguida, o resultado é exibido no console utilizando o comando echo. 
As informações também são salvas em um arquivo utilizando a função salvar_info().

=====================================================================================================================================

verificar_contas_usuario(): 

Essa função verifica as contas de usuário no sistema utilizando o comando awk em conjunto com o arquivo "/etc/passwd". 
O comando awk -F: '{print $1}' extrai o nome de usuário de cada linha do arquivo. 
O resultado da verificação é armazenado na variável "resultado_contas" utilizando a sintaxe $(comando). 
Em seguida, o resultado é exibido no console utilizando o comando echo. 
As informações também são salvas em um arquivo utilizando a função salvar_info().

=====================================================================================================================================

realizar_varreduras_malware(): 

Essa função realiza varreduras de malware utilizando o comando clamscan. 
O comando é executado com as opções "-r" para realizar a verificação recursiva em todo o sistema de arquivos e "--exclude-dir" 
para especificar diretórios a serem excluídos da verificação. 
O resultado da varredura é armazenado na variável "resultado_malware" utilizando a sintaxe $(comando). 
Em seguida, o resultado é exibido no console utilizando o comando echo. 
As informações também são salvas em um arquivo utilizando a função salvar_info().

=====================================================================================================================================

realizar_auditorias_seguranca(): 

Essa função realiza auditorias de segurança utilizando o comando openvas-check-setup. 
O resultado da auditoria é armazenado na variável "resultado_auditoria" utilizando a sintaxe $(comando). 
Em seguida, o resultado é exibido no console utilizando o comando echo. 
As informações também são salvas em um arquivo utilizando a função salvar_info().

=====================================================================================================================================

realizar_auditorias_seguranca_alternativa(): 

Essa função realiza auditorias de segurança alternativas utilizando um comando fictício "comando_nessus_aqui". 
O resultado da auditoria é armazenado na variável "resultado_auditoria" utilizando a sintaxe $(comando). 
Em seguida, o resultado é exibido no console utilizando o comando echo. 
As informações também são salvas em um arquivo utilizando a função salvar_info().

=====================================================================================================================================

=> No final do script, as funções são chamadas sequencialmente para executar as verificações de segurança. 
Se a auditoria do OpenVAS falhar (retorno diferente de zero), uma auditoria alternativa é realizada. 
Por fim, é exibida uma mensagem indicando a conclusão da verificação do código aparecerá na tela.

Lembrando que essa é a versao 2 do codigo 1. o codigo nao vai mostrar a execução na tela.

Ele criará o diretório com nome específico, "output_seguranca", e salvará as informaçoes em .txt. De acordo com cada função.

**** nÃO ESqueça de verificar os seus diretórios quando terminar a execução. *****************

vc verá uma mensagem assim no arquivo final de varredura de malware:

----------- SCAN SUMMARY -----------
Virus conhecidos: 1.000.000.000 --> de acordo com a base de dados do sistema
Versao do sistema: 0.103.6
Diretorios scaneados: 111076
Arquivos scaneados: 7
Arquivos infectados: 4
Erros: 285749090
Data scanned: 32024.52 MB
Data de leitura: 37994.20 MB (ratio 0.84:1)
Hora: 20294.000 sec (338 m 14 s)
Início de data: 2023:05:23 21:48:22
Data Final:   2023:05:24 03:26:36



Antes de terminar, uma lembrancinha para evitar dores de cabeça, quando ficar alguns dias, semanas ou até meses 
sem rodar esse código, a base de dados poderá está desatualizada, já que a equipe da ClamVA sempre estão atualizando
à base de dados deles.

Você poderá receber uma mensagem como essa:

Realizando varreduras de malware...

LibClamAV Warning: **************************************************
LibClamAV Warning: ***  The virus database is older than 7 days!  ***
LibClamAV Warning: ***   Please update it as soon as possible.    ***
LibClamAV Warning: **************************************************

Para corrigir esse erro, que nao é especificamente um erro mas uma mensagem para vc atualizar à base de dados do código
na funçao que verifica malwares, basta vc digitar o seguinte comando no terminal linux:

comando -->  sudo freshclam

esse comando atualizará toda à base de dados desatualizada outrora. Depois, basta rodar seu código novamente.

##################################### Considerações finais, buddy ###########################################

FAÇA O QUE VC QUISER COM ESSE CÓDIGO. MODIFIQUE DA MANEIRA QUE VC ACHAR MELHOR AS SUAS NECESSIDADES.

Enjoy it!  E espero ter contribuido a vc voluntariamente de alguma forma ^.^
