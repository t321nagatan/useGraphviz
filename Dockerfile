FROM ubuntu:20.04

RUN apt-get update && apt-get install -y sudo wget vim curl gawk make gcc
RUN sudo apt-get install bzip2

RUN wget https://repo.continuum.io/archive/Anaconda3-2019.03-Linux-x86_64.sh && \
    sh Anaconda3-2019.03-Linux-x86_64.sh -b  && \
    rm -f Anaconda3-2019.03-Linux-x86_64.sh && \
    sudo curl -sL https://deb.nodesource.com/setup_16.x | sudo bash -  && \
    sudo apt-get install -y nodejs

ENV PATH $PATH:/root/anaconda3/bin

RUN pip install --upgrade pip
RUN pip install pandas_datareader
RUN sudo apt install -y graphviz
RUN pip install graphviz
RUN pip install pyyaml

RUN mkdir /workspace

CMD ["jupyter-lab", "--ip=0.0.0.0","--port=8888" ,"--no-browser", "--allow-root", "--LabApp.token=''"]