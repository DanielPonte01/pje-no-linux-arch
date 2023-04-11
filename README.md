# pje-no-linux-arch
#Shell script para ArchLinux #PJE-Office

# Manual de utilização do script "pje-linux.sh"

Este script foi projetado para automatizar a instalação e configuração de certificados digitais e aplicativos relacionados em sistemas operacionais baseados em Arch Linux.

# Requisitos:

- Sistema operacional baseado em Arch Linux.
- Acesso de administrador (sudo).

# Como usar:

- Faça o download do script "pje-linux.sh".
- Abra a pasta em que baixou o arquivo, clique com o direito e selecione "abrir terminal aqui" ou abra um terminal e navegue até a pasta onde o script foi baixado.
- Execute o comando "chmod +x instalar_certificado.sh" para tornar o script executável.
- Execute o comando "./pje-linux.sh" para iniciar a instalação.

O script realiza as seguintes tarefas:

1. Verifica se o sistema operacional em execução é baseado em Arch Linux. Se não for, o script perguntará se o usuário deseja continuar a execução. Se o usuário responder "s" ou "S", o script continuará; caso contrário, ele será interrompido.

2. Verifica se o "yay" está instalado. Se não estiver instalado, o script o instalará.

3. Verifica se o "opensc" e o "jre11-openjdk" estão instalados. Se não estiverem instalados, o script os instalará.

4. Habilita o serviço "pcscd.service", que é responsável pela comunicação com dispositivos de cartão inteligente.

5. Verifica se o "safesignidentityclient" e o "pje-office" estão instalados. Se não estiverem instalados, o script os instalará.

Ao final da execução do script, a mensagem "TUDO OK" será exibida, indicando que todas as tarefas foram concluídas com sucesso.

# Observações:

    Este script foi projetado para uso em sistemas operacionais baseados em Arch Linux e não é garantido que funcionará corretamente em outros sistemas operacionais.
    Certifique-se de ter acesso de administrador (sudo) antes de executar o script.
    Se o "yay" já estiver instalado em seu sistema, o script não o reinstalará.
    Se o "opensc" e o "jre11-openjdk" já estiverem instalados em seu sistema, o script não os reinstalará.
    Se o serviço "pcscd.service" já estiver em execução em seu sistema, o script não o reiniciará.
    Se o "safesignidentityclient" e o "pje-office" já estiverem instalados em seu sistema, o script não os reinstalará.
