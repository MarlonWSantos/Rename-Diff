##!/usr/bin/env bash
#
#
#
#   Rename Diff - Rename a group of files with differents names 
#   Copyright (C) 2020 Marlon W. Santos <marlon.santos.santos@icen.ufpa.br>
#
#
#	
#   This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>



first_number=$1 #primeiro numero do arquivo
last_number=$2 #último número do arquivo
old_name=$3 ##parte do nome do arquivo que sera alterado
mode=$4 #modo de execução do rename (n = exibe como será alterado;v = altera)
file=$5 #arquivo com os nomes

file_name=$(echo "$old_name" | sed s/*.*$//g)
extension=$(echo "$old_name" | sed s/^.*\\*//g)

rename_File() {
  rename -$mode s/"$extension"/"-$(head -$i $file | tail -1)$extension"/g "$1";
}

for i in $(seq $first_number $last_number);
do
    if [ $i -lt 10 ];then
	
        if [ -e "$file_name$i$extension" ];then

            rename_File "$file_name$i$extension"

        elif [ -e "$file_name"0"$i$extension" ];then

	    rename_File "$file_name"0"$i$extension"

        else
            echo "Files not found";
        fi

    else

        rename_File "$file_name$i$extension"
    fi
done

