



# Função para realizar o login
function login() {
  while true; do
    read -p "Nome de utilizador: " username
    read -s -p "Senha: " password
    echo ""

    # Verifica as credenciais
    if [ "$username" == "0Fire" ] && [ "$password" == "0Fire" ]; then
      echo "Login bem-sucedido!"
      break
    else
      echo "Credenciais inválidas. Tente novamente."
    fi
  done
}

# Realiza o login antes de permitir o acesso ao menu principal
login


# Desenhos de Bombeiros

echo "                       
 ______ ________
|  __  | _______|                               
| |  | | |_ _ _ __ ___  
| |  | |  _| | '__/ _ \  
| |__| | | | | | |  __/ 
|______|_| |_|_|  \___|


"

#!/bin/bash

# Nome do Ficheiro CSV para ocorrências
ficheiro_ocorrencias="ocorrencias.csv"
# Nome do Ficheiro CSV para formações
ficheiro_formacoes="formacoes.csv"

# Função para registrar uma ocorrência
function registar_ocorrencia() {
  echo "Registando ocorrência..."
  
  # Incrementa o número de ocorrências
  num_ocorrencias=$(( $(wc -l < "$ficheiro_ocorrencias") + 1 ))

  # Solicita informações ao utilizador
  read -p "Veículo: " veiculo
  read -p "Condutor: " condutor
  read -p "Quilômetros iniciais: " km_iniciais
  read -p "Quilômetros finais: " km_finais
  read -p "Guarnição: " guarnicao
  read -p "TO: " to
  read -p "Tipo de Ocorrência: " tipo_ocorrencia

  # Obtém a data atual
  data=$(date +"%d-%m-%y %H:%M:%S")

  # Verifica se o ficheiro de ocorrências CSV já existe
  if [ ! -e "$ficheiro_ocorrencias" ]; then
    # Cria o cabeçalho do CSV
    echo "ID,Data,Veículo,Condutor,Quilômetros Iniciais,Quilômetros Finais,Guarnição,TO,Tipo de Ocorrência" > "$ficheiro_ocorrencias"
  fi

  # Adiciona a ocorrência ao Ficheiro de ocorrências CSV
  echo "$num_ocorrencias,$data,$veiculo,$condutor,$km_iniciais,$km_finais,$guarnicao,$to,$tipo_ocorrencia" >> "$ficheiro_ocorrencias"

  echo "Ocorrência registrada com sucesso no ficheiro $ficheiro_ocorrencias."
}

# Função para ver as ocorrências
function ver_ocorrencias() {
  echo "Visualizar ocorrências..."
  
  # Verifica se o Ficheiro CSV de ocorrências existe
  if [ -e "$ficheiro_ocorrencias" ]; then #-e serve para verificar se o ficheio existe 
    # ver as ocorrências no formato de tabela
    column -s, -t "$ficheiro_ocorrencias"
  else
    echo "Nenhuma ocorrência encontrada."
  fi
}

# Função para eliminar ocorrências
function eliminar_ocorrencia() {
  echo "Eliminar ocorrência..."
  
  # Verifica se o ficheiro CSV de ocorrências existe
  if [ -e "$ficheiro_ocorrencias" ]; then
    # Exibe as ocorrências no formato de tabela
    column -s, -t "$ficheiro_ocorrencias"
    
    # Solicita o número da linha a ser eliminada
    read -p "Escreva o número da linha a ser eliminada: " num_ocorrencia
    
    # Elimina a linha do ficheiro CSV de ocorrências
    sed -i "/^$num_ocorrencia,/d" "$ficheiro_ocorrencias"
    
    echo "Ocorrência número $num_ocorrencia eliminada com sucesso."
  else
    echo "Nenhuma ocorrência encontrada."
  fi
}

# Função para registrar uma formação
function registrar_formacao() {
  echo "Registar formação..."
  
  # Incrementa o número de formações
  num_formacoes=$(( $(wc -l < "$ficheiro_formacoes") + 1 ))

  # Solicita informações do Utilizador 
  read -p "Nome da Formação: " nome_formacao
  read -p "Instrutor: " instrutor
  read -p "Local: " local_formacao
  read -p "Data da Formação (DD-MM-yyyy): " data_formacao

  # Verifica se o ficheiro CSV de formações já existe
  if [ ! -e "$ficheiro_formacoes" ]; then
    # Cria o cabeçalho do CSV
    echo "ID,Nome da Formação,Instrutor,Local,Data da Formação" > "$ficheiro_formacoes"
  fi

  # Adiciona a formação ao ficheiro de formações CSV
  echo "$num_formacoes,$nome_formacao,$instrutor,$local_formacao,$data_formacao" >> "$ficheiro_formacoes"

  echo "Formação registrada com sucesso no ficheiro $ficheiro_formacoes."
}

# Função para visualizar as formações
function ver_formacoes() {
  echo "Visualizar formações..."
  
  # Verificar se o ficheiro CSV de formações existe
  if [ -e "$ficheiro_formacoes" ]; then #-e serve para verificar se o ficheio existe 
    # Exibe as formações no formato de tabela
    column -s, -t "$ficheiro_formacoes"
  else
    echo "Nenhuma formação encontrada."
  fi
}

# Função para eliminar formações
function eliminar_formacao() {
  echo "Eliminar formação..."
  
  # Verifica se o ficheiro CSV de formações existe
  if [ -e "$ficheiro_formacoes" ]; then
    # Exibe as formações no formato de tabela
    column -s, -t "$ficheiro_formacoes"
    
    # Solicita o número da linha a ser eliminada
    read -p "Insira o número da linha a ser eliminada: " num_formacao
    
    # Elimina a linha do ficheiro CSV de formações
    sed -i "/^$num_formacao,/d" "$ficheiro_formacoes"
    
    echo "Formação número $num_formacao eliminada com sucesso."
  else
    echo "Nenhuma formação encontrada."
  fi
}


# Loop principal do programa
while true; do
  echo "Escolha uma opção:"
  echo "1 - Registar ocorrência"
  echo "2 - Ver ocorrências"
  echo "3 - Eliminar ocorrência"
  echo "4 - Registar formação"
  echo "5 - Ver formações"
  echo "6 - Eliminar formação"
  echo "0 - Sair"

  read opcao

  case $opcao in
    1) registar_ocorrencia ;;
    2) ver_ocorrencias ;;
    3) eliminar_ocorrencia ;;
    4) registrar_formacao ;;
    5) ver_formacoes ;;
    6) eliminar_formacao ;;
    0) break ;; # Sai do loop
    *) echo "Opção inválida. Tente novamente."
  esac

  echo ""
done

echo "Programa encerrado."
