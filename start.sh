#!/bin/bash

echo "Olá, seja bem vindo!"

echo "Qual o seu nome?"
read NAME

if [[ ${#NAME} -lt 2 ]]; then
  echo "O nome deve ter 2 ou mais caracteres"
  exit 1
fi

echo "Qual a sua idade?"
read AGE

if [[ -z $AGE ]]; then
  echo "A idade deve ser informada"
  exit 1
fi

echo "${NAME} informou ter ${AGE} anos!"