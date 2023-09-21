#!/bin/bash

while getopts i:h flag
do
    case "${flag}" in
        i) ip=${OPTARG};;
        h) echo "Uso: ./script.sh -i <IP>"; exit;;
    esac
done

if [ -z "$ip" ]
then
    echo "Por favor, proporciona una dirección IP con la opción -i. Ejemplo: ./script.sh -i 10.10.0.x"
    exit
fi

for i in $(seq 1 254); do
    (
        pingresult=$(ping -c 1 $ip$i | grep "ttl=")
        if [ ! -z "$pingresult" ]
        then
            ttl=$(echo $pingresult | cut -d "=" -f 3 | cut -d " " -f 1)
            host="El siguiente host $ip$i esta activo"
            case "$ttl" in
                64)
                    os="Linux"
                    ;;
                128)
                    os="Windows"
                    ;;
                255)
                    os="Unix/Linux"
                    ;;
                *)
                    os="desconocido"
                    ;;
            esac
            echo "$host y el sistema operativo es: $os."
        fi
    ) &
done; wait
