#!/bin/bash

#Скрипт пишет каджые 5 секунд в файл log.txt даты с разницей в 5 секунд

while true; do echo "Текущая дата и время" `date` >> ./log.txt; echo "Записалось"; sleep 5; done


