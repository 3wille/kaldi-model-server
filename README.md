# kaldi-model-server

Kaldi-model-server is a simple Kaldi model server for online decoding with TDNN chain nnet3 models. It is written in pure Python and uses [PyKaldi](https://github.com/pykaldi/pykaldi) to interface Kaldi as a library. It is mainly meant for live decoding with real microphones and for single-user applications that need to work with realtime speech recognition locally (e.g. dictation, voice assistants) or an aggregation of multiple audio speech streams (e.g. decoding meeting speech). Computations happen on the device that interfaces the microphone. The [redis](https://redis.io) messaging server and a event server that can send [server-sent event notifications](https://www.w3schools.com/html/html5_serversentevents.asp) to a web browser can also be run on different devices.

Because redis supports a [wide range of different programming languages](https://redis.io/clients), it can easily be used to interact with decoded speech output in realtime with your favourite programming language.

For demonstration purposes we added an simple demo example application that uses a Python based event server with [Flask](https://palletsprojects.com/p/flask/) (event_server.py) to display the recognized words in a simple HTML5 app running in a browser window:

example/ An example HTML5 application that visualizes 

To start the demo run 

    python3 event_server.py

and then in a different window:

    python3 nnet3_model.py

You can browse to http://127.0.0.1:5000/ and should see words appear. Word confidences are computed after an utterance is decoded and visualized with different levels of greyness.

# Installation

## The easist way to install PyKaldi is with a virtual environment

mkdir ~/projects/
cd ~/projects/
git clone https://github.com/pykaldi/pykaldi
git clone https://github.com/uhh-lt/kaldi-model-server

cd kaldi-model-server

virtualenv -p python3 .
source ./bin/activate

## Ubuntu dependencies
sudo apt-get install portaudio19-dev autoconf automake cmake curl g++ git graphviz libatlas3-base libtool make pkg-config subversion unzip wget zlib1g-dev

## Python pip dependencies
pip3 install numpy pyparsing ninja redis pyyaml pyaudio flask flask_cors bs4

## Compile and install Protobuf, CLIF and KALDI dependencies (compiliation can take some time)
cd  ~/projects/pykaldi/tools/
./install_protobuf.sh ~/projects/kaldi-model-server/bin/python3
./install_clif.sh ~/projects/kaldi-model-server/bin/python3
./install_kaldi.sh ~/projects/kaldi-model-server/bin/python3

cd ~/projects/pykaldi

## Now install pykaldi
~/projects/pykaldi$ python3 setup.py install

## You can test the install with:
~/projects/pykaldi$ python3 setup.py test

