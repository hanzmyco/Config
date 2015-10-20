#!/bin/bash


while getopts "e:c:" arg #选项后面的冒号表示该选项需要参数
do
        case $arg in
             e)
                echo "eigen's arg:$OPTARG" #参数存在$OPTARG中
                eigen=$OPTARG
                echo $eigen
                
                ;;
             c)
                echo "cnn's arg:$OPTARG"
                cnn=$OPTARG
                ;;
            
             ?)  #当有不认识的选项的时候arg为?
            echo "unkonw argument"
        	exit 1
        	;;
        esac
        
done

cd $eigen
hg clone https://bitbucket.org/eigen/eigen
eigen="$eigen/eigen"
cd eigen
mkdir build
cd build
cmake $eigen

cd $cnn
git clone https://github.com/clab/cnn.git
cd cnn
mkdir build
cd build
cmake .. -DEIGEN3_INCLUDE_DIR=$eigen
make -j 4


