# Desenhos de Bombeiros

echo "                       
 / _(_)                               
| |_ _ _ __ ___ _ __ ___   __ _ _ __  
|  _| | '__/ _ \ '_ ` _ \ / _` | '_ \ 
| | | | | |  __/ | | | | | (_| | | | |
|_| |_|_|  \___|_| |_| |_|\____|_| |_| "

#!/bin/bash

# Nome do arquivo CSV para ocorrências
arquivo_ocorrencias="ocorrencias.csv"
# Nome do arquivo CSV para formações
arquivo_formacoes="formacoes.csv"

# Função para registrar uma ocorrência
function registar_ocorrencia() {
  echo "Registando ocorrência..."
  
  # Solicita informações do usuário
  read -p "Veículo: " veiculo
  read -p "Condutor: " condutor
  read -p "Quilômetros iniciais: " km_iniciais
  read -p "Quilômetros finais: " km_finais
  read -p "Guarnição: " guarnicao
  read -p "TO: " to
  read -p "Tipo de Ocorrência: " tipo_ocorrencia
