# Buscador Shell

## Descrição
O **Buscador Shell** é um script em Shell robusto e eficiente que permite a busca de arquivos e pastas por nome ou extensão em todo o sistema e dispositivos conectados. Ele é ideal para situações onde você precisa localizar arquivos rápida e precisamente, mesmo em pendrives, HDs externos, SSDs ou smartphones montados.

## Funcionalidades
- Busca de arquivos por nome ou extensão.
- Pesquisa em diretórios específicos ou em todo o sistema.
- Detecta automaticamente dispositivos montados, como pendrives e smartphones, e realiza buscas neles.
- Fácil de usar, com opções de linha de comando claras e intuitivas.

---

## Requisitos
Para utilizar o **Buscador Shell**, você precisa:
- Sistema operacional Linux/Unix.
- Ferramenta `find` (disponível na maioria das distribuições Linux).
- Permissão para executar comandos de busca (uso de `sudo` pode ser necessário para acessar todos os arquivos).

---

## Instalação
1. Clone este repositório ou baixe o script diretamente:
   ```bash
   git clone https://github.com/henriquetourinho/buscador-shell.git
   cd buscador-shell
   ```
2. Dê permissão de execução ao script:
   ```bash
   chmod +x busca_arquivos.sh
   ```

---

## Uso
Execute o script com as opções desejadas:
```bash
./busca_arquivos.sh [opções]
```
### Opções Disponíveis
- `-n <nome>`: Nome parcial ou completo do arquivo para buscar.
- `-e <extensão>`: Extensão dos arquivos para buscar (ex: `.txt`, `.jpg`).
- `-d <diretório>`: Diretório inicial para busca (padrão: `/`).
- `-h`: Exibe a ajuda e explica as opções.

### Exemplos
1. Buscar arquivos contendo "documento" no nome:
   ```bash
   ./buscador_shell.sh -n "documento"
   ```

2. Buscar arquivos com extensão `.jpg`:
   ```bash
   ./buscador_shell.sh -e ".jpg"
   ```

3. Buscar arquivos `.txt` no diretório `/home`:
   ```bash
   ./buscador_shell.sh -e ".txt" -d "/home"
   ```

4. Exibir a ajuda do script:
   ```bash
   ./buscador_shell.sh -h
   ```

---

## Como Funciona
1. O script utiliza o comando `find` para realizar buscas recursivas baseadas nos parâmetros fornecidos.
2. Além do diretório especificado, ele identifica dispositivos conectados (como pendrives e smartphones) através de pontos de montagem localizados em `/media`, `/mnt` ou `/run/media`.
3. Para cada dispositivo ou diretório, ele executa a busca conforme os filtros definidos (nome e/ou extensão).

---

## Notas Importantes
- Certifique-se de que dispositivos externos estejam montados para que possam ser incluídos na busca.
- Para buscar em todo o sistema, execute o script como superusuário:
  ```bash
  sudo ./buscador_shell.sh -n "arquivo"
  ```
- A busca pode demorar dependendo do tamanho do sistema de arquivos ou dos dispositivos conectados.

---

## Contribuição
Contribuições são bem-vindas! Envie um Pull Request ou abra uma issue para sugerir melhorias ou reportar problemas.

---

## Licença
Este projeto está licenciado sob a Licença MIT. Consulte o arquivo LICENSE para mais informações.

---

Aproveite o **Buscador Shell** para encontrar o que você precisa de forma rápida e eficiente! 🚀

