#!/bin/bash

# Script para busca de arquivos por nome ou extensão em todo o sistema e dispositivos conectados.

# Função para exibir ajuda
exibir_ajuda() {
    echo "Uso: $0 [-n <nome_do_arquivo>] [-e <extensão>] [-d <diretório>]"
    echo ""
    echo "Opções:"
    echo "  -n <nome>       Nome parcial ou completo do arquivo para buscar."
    echo "  -e <extensão>   Extensão dos arquivos para buscar (ex: .txt, .jpg)."
    echo "  -d <diretório>  Diretório inicial para busca (padrão: /)."
    echo "  -h              Exibe esta ajuda."
    echo ""
    echo "Este script também busca em dispositivos conectados, como pendrives e smartphones montados."
    exit 1
}

# Variáveis padrão
nome=""
extensao=""
diretorio="/"

# Parse dos argumentos
while getopts "n:e:d:h" opt; do
    case "$opt" in
        n) nome="$OPTARG" ;;
        e) extensao="$OPTARG" ;;
        d) diretorio="$OPTARG" ;;
        h) exibir_ajuda ;;
        *) exibir_ajuda ;;
    esac
done

# Verificação de parâmetros
if [[ -z "$nome" && -z "$extensao" ]]; then
    echo "Erro: Você deve fornecer pelo menos uma das opções -n ou -e."
    exibir_ajuda
fi

# Função para buscar arquivos
buscar_arquivos() {
    local dir="$1"
    echo "Buscando em: $dir"
    if [[ -n "$nome" && -n "$extensao" ]]; then
        find "$dir" -type f -iname "*$nome*" -iname "*$extensao*" 2>/dev/null
    elif [[ -n "$nome" ]]; then
        find "$dir" -type f -iname "*$nome*" 2>/dev/null
    elif [[ -n "$extensao" ]]; then
        find "$dir" -type f -iname "*$extensao" 2>/dev/null
    fi
}

# Buscar no diretório principal
buscar_arquivos "$diretorio"

# Listar dispositivos montados
echo "Verificando dispositivos conectados..."
montados=$(awk '{print $2}' /proc/mounts | grep -E '^/media|^/mnt|^/run/media|^/run/mounts' | sort | uniq)

# Buscar em dispositivos montados
for dispositivo in $montados; do
    buscar_arquivos "$dispositivo"
done

echo "Busca concluída."

