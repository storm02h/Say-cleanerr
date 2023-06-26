# Say-cleaner
Salve o código em um arquivo com extensão ".sh", como "nome_script.sh".

Dê permissão de execução ao arquivo com o comando 'chmod +x' nome_script.sh. 

[ Exemplo --> chmod +x nome_script.sh ]

Em seguida, execute o script com ./nome_script.sh.

Por que .sh? Porque todo script em Bash é salvo nessa extensão. Fazendo jus a linguagem que foi escrita,
para o interpretador interpretar segundo a lingua que foi escrito o código. ^.^

Este script executa várias verificações, como verificação de integridade dos arquivos do sistema, 
análise de registros de atividades, monitoramento de tráfego de rede, verificação de processos em execução, 
verificação de serviços em execução, verificação de contas de usuário, varreduras de malware e auditorias de segurança.

Personalize-o de acordo com suas necessidades e adicione outras verificações específicas que possam
ser relevantes para o seu ambiente.

################################### EVITANDO ERROS COMO ##########################################

tripwire: comando não encontrado;
sudo: tcpdump: comando não encontrado;
clamscan: comando não encontrado;
openvas-check-setup: comando não encontrado;                                          
#######################################################################################


PARA EVITAR ESSES ERROS MENCIONADOS ACIMA QUANDO VC RODAR O CÓDIGO, TENHA CERTEZA DE INSTALAR AS FERRAMENTAS USADAS
NO CÓDIGO.

EX:  Para instalar o Tripwire, você pode executar o seguinte comando:

sudo apt-get install tripwire

Para instalar o Tcpdump:

sudo apt-get install tcpdump

BASEADO EM SISTEMA DEBIAN/UBUNTU


Obs: Tenha em mente  de executar esses comandos com privilégios de administrador ou use o comando 'su' para alternar
para a conta de administrador antes de instalá-los.

Lembre-se de que alguns comandos, como o Tcpdump, podem exigir privilégios elevados ou a execução como usuário root.


########################################### INSTALANDO - ClamAV -##########################################################

Essa é uma das ferramentas principais do nosso código, é ela que realizará a função de de análise de anomalias.

Nota:

ClamAV é uma ferramenta de código aberto e gratuito que é utilizada para detecção de vírus, malware.,
spyware e outras ameaças em sistemas computacionais.

Ele é um antivírus projetado principalmente para sistemas baseados em Unix,
mas também pode ser usado em outros sistemas operacionais, como Windows.

O ClamAV é usado para verificar arquivos em busca de possíveis ameaças de segurança. 
Ele utiliza uma base de dados atualizada regularmente que contém assinaturas de vírus conhecidos. 

Quando um arquivo é escaneado, o ClamAV verifica sua assinatura em relação à base 
de dados de vírus para determinar se o arquivo é malicioso.

Além de verificar arquivos, o ClamAV também pode ser integrado a servidores de e-mail para verificar anexos de e-mail em
busca de ameaças. 

********** Ele pode ser configurado para escanear arquivos em tempo real, 
realizar escaneamentos agendados ou ser executado manualmente conforme necessário. ************

O ClamAV é uma ferramenta amplamente utilizada em servidores de e-mail,
servidores de arquivos e outros sistemas que requerem proteção contra ameaças de malware.

############################################### INSTLANDO O ClamAV ####################################################

Execute o comando em seu terminal linux:

sudo apt-get install clamav

Atualize  as definições de vírus do ClamAV após a instalação, usando o seguinte comando:

sudo freshclam  <----- Mantenha em mente esse comandinho, tá? ele é essencial para atualizar a base de dados do ClamAV.

Em outras palavras, ele atualiza o seu código com as bases de dados de vŕus e afins atualizados, trazendo assim, uma melhor
eficiência nos resultados...


############################################# INSTALANDO - OpenVas - ######################################################

Instalar OpenVas é um pouco complexo, mas nao há nada que o passo a passo ajude. Bora la..

Recomendo seguir a documentação oficial do OpenVAS para obter instruções
detalhadas sobre como instalar e configurar o OpenVAS de maneira certa. 

Link do site: https://www.greenbone.net/en/documents/


Instalando dependencias necessarias. No terminal execute:

sudo apt-get install sqlite3 python3-software-properties software-properties-common

Obs: isso pode variar de acordo com a distrubuicao linux que vc está usando.

Depois de executar o comando acima, Adicione o repositório do OpenVAS:

sudo add-apt-repository ppa:mrazavi/openvas
sudo apt-get update

sudo apt-get install openvas9
sudo openvas-setup --> Esse comando realizará várias configurações iniciais e baixará as atualizações de seguranca

NOTA:

Aguarde o processo de configuração ser concluído.
Isso pode levar algum tempinho, pois envolve a configuração do banco de dados, a configuração dos certificados SSL, 
a importação dos feeds de atualização de segurança, entre outras tarefas.

Após a conclusão do processo, você receberá informações de login para acessar a interface web do OpenVAS.

Acesse a interface web do OpenVAS usando um navegador.
A URL padrão é https://localhost:9392. Faça login usando as informações fornecidas durante o processo de configuração.

Agora você pode usar a interface web do OpenVAS para configurar e executar auditorias de segurança em seu sistema.

QUALQUER DÚVIDA OU ERROS, VERIFIQUE A DOCUMENTAÇÃO. SE PREFERIR, VC TAMBEM PODE TIRAR ESSA FERRAMENTA DO CÓDIGO E USAR
O ' NESSUS ' NO LUGAR. Mas vc vai conseguir. Seguindo a documentação e o passo a passo, tudo ocorrerá certinho.


########################################################################################################################

Para mais comodidade, siga esse tutorial no YouTube e instale o OpenVAS de maneira mais dinâmica:

link do vídeo de instalaçao : https://www.youtube.com/watch?v=5H23ONMkH_A

Depois de tudo instalado, basta executar o script de acordo com o nome e diretório que vc salvou ele.

Ex: ./MalwareFinder.sh e ele começará a analisar o sistema por completo.


L-E-M-B-R-A-N-D-O  Q-U-E, esse código irá demorar umas 6, 7 horas para anlisar seu sistema por completo.

Afinal, queremos analisar o sistema todo, nao é mesmo ?

Recomendo deixar esse script rodando quando vc for dormir, para melhor proveito das funcionalidades do código e eficiência.

AO FINAL, vc verá uma mensagem desse tipo,


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


Antes de terminar, uma lembrancinha para evitar dores de cabeça, quando ficar alguns dias, semanas ou ate meses 
sem rodar esse código, a base de dados poderá está desatualizada, ja que a equipe da ClamVA sempre estão atualizando
à base de dados deles.

Voce poderá receber uma mensagem como essa:

Realizando varreduras de malware...

LibClamAV Warning: **************************************************
LibClamAV Warning: ***  The virus database is older than 7 days!  ***
LibClamAV Warning: ***   Please update it as soon as possible.    ***
LibClamAV Warning: **************************************************

Para corrigir esse erro, que nao é especificamente um erro mas uma mensagem para vc atualizar à base de dados do código
na função que verifica malwares, basta vc digitar o seguinte comando no terminal linux:

comando -->  sudo freshclam

esse comando atualizará toda à base de dados desatualizada outrora. Depois, basta rodar seu cÓdigo novamente.

Obs: Este é o tutorial README 1, leia o 2 para melhor proveito.
