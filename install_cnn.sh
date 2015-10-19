#!/bin/bash


while getopts "eigen:cnn" arg #选项后面的冒号表示该选项需要参数
do
        case $arg in
             eigen)
                echo "eigen's arg:$OPTARG" #参数存在$OPTARG中
                eigen=$OPTARG
                echo $eigen
                
                ;;
             cnn)
                echo "cnn's arg:$OPTARG"
                cnn=$OPTARG
                ;;
            
             ?)  #当有不认识的选项的时候arg为?
            echo "unkonw argument"
        	exit 1
        	;;
        esac
        
done

mkdir splittemp

lines=(`wc -l "$input"`)

# count the number of lines 

r=$(($lines%$number_file))


if (($r == 0)); then 
	lines_file=$(($lines/$number_file))
else
	lines_file=$(($lines/$number_file+1))
fi

# split data
split -l $lines_file $input tempzh
mv tempzh* splittemp

cd splittemp
j=1
for i in tempzh*;
do
	mv $i $j

	((j=j+1))
done

cd ../

for ((i=1;i<=number_file;i++));do
	{
	osascript -e 'tell application "Terminal" to activate' -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down'
	ls
	python '$pyc' "$i"
	} &
done 
wait

