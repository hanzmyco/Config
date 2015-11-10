wget https://github.com/google/protobuf/releases/download/v3.0.0-beta-1/protobuf-python-3.0.0-alpha-4.tar.gz
tar -xvf protobuf-python-3.0.0-alpha-4
cd protobuf-python-3.0.0-alpha-4
./configure
make
make check
sudo make install

