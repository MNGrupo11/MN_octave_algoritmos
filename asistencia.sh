#! /bin/bash
archivo=$1
temp=temp.csv #Archivo que contendra la lista en .csv

band=0
#############################################################################
for i in *; do 
  if [[ $(echo $i) == $(echo $archivo) ]]; then #Comprobamos si existe el listado
    ssconvert  $archivo $temp #Transformamos de .xlsx a .csv
    band=1
    break
 fi
 
done 
#############################################################################
if [ $band -eq 0 ];then  
   echo "Lista no encontrada" 
   exit 
fi 
#############################################################################

for img in *.png; do 
  date=$(echo $img | cut -b 4-13)  
  convert "$img" -crop 260x880+1585+110  .out.png &> /dev/null 
  tesseract .out.png "datos-$img"  &> /dev/null 
  echo "$date" >> data.csv
  echo "$(head -1 $temp ),${date}" > .temp_1.csv
  tail -n +2 $temp > .temp_2.csv
  while IFS= read -r line; do

        c="0"
        cedula=$(echo "$line" | cut -d"," -f2)
        long=$(echo "${#cedula}")
        #echo "$cedula"
        #echo "$lon"

        if [[ "$long" -eq "9" ]]; then
             cedula="$c$cedula"
        else
             continue
        fi


        if [[ $(echo "$cedula" | ./v_cedula.awk) -eq  "True" ]];
        then
            if [[ $(grep "$cedula" "datos-$img".txt) ]]; 
            then
                echo "$line,S" >> .temp_1.csv
            else
                echo "$line,N" >> .temp_1.csv
            fi

        else
                continue
        fi

    done < .temp_2.csv
    cat  .temp_1.csv > temp.csv

done

echo $(python3 xlsx.py)

rm .temp_1.csv .temp_2.csv .out.png *.txt temp.csv data.csv
