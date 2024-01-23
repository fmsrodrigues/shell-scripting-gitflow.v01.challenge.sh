#!/bin/bash

echo "Olá, seja bem vindo!"

DIRECTORY="logs"
FILE="log.txt"
FILEPATH="./${DIRECTORY}/${FILE}"

if [ ! -d "./${DIRECTORY}" ]; then
  mkdir -p "${DIRECTORY}"

  if [ ! -f "${FILEPATH}" ]; then
    touch "${FILEPATH}"
  fi
fi

echo "Qual o seu nome?"
read NAME

if [[ (-z ${NAME}) || (${#NAME} -lt 2) ]]; then
  echo "$(date '+%Y/%m/%d - %H:%M:%S'):" >> "${FILEPATH}"
  echo "Error: User didn't input a valid name" >> "${FILEPATH}"
  echo -e "Input: \"${NAME}\"\n" >> "${FILEPATH}"
  
  echo "O nome deve ter 2 ou mais caracteres"
  exit 1
fi

if [[ ! ${NAME} =~ ^[[:alpha:]]+$ ]]; then
  echo "$(date '+%Y/%m/%d - %H:%M:%S'):" >> "${FILEPATH}"
  echo "Error: User input a name with numbers" >> "${FILEPATH}"
  echo -e "Input: \"${NAME}\"\n" >> "${FILEPATH}"

  echo "O nome deve conter apenas caracteres alfabéticos"
  exit 1
fi

echo "Qual a sua idade?"
read AGE

if [[ (-z ${AGE}) || !(${AGE} =~ ^[0-9]+$) ]]; then
  echo "$(date '+%Y/%m/%d - %H:%M:%S'):" >> "${FILEPATH}"
  echo "Error: User didn't input a valid age" >> "${FILEPATH}"
  echo -e "Input: \"${AGE}\"\n" >> "${FILEPATH}"

  echo "A idade deve ser informada"
  exit 1
fi

echo "${NAME} informou ter ${AGE} anos!"