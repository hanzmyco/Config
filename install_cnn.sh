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

cd $eigen
hg clone https://bitbucket.org/eigen/eigen
cd "$eigen/eigen"
mkdir build
cmake "$eigen/eigen/build"
cd $cnn
git clone https://github.com/clab/cnn.git
cd "$cnn/cnn"
mkdir build
cmake .. -DEIGEN3_INCLUDE_DIR="$eigen/eigen"
make -j 4


