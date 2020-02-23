FROM tensorflow/tensorflow:2.0.1-gpu-py3-jupyter

RUN apt-get update && apt-get install -y python3.6
RUN apt-get install -y python3-pip
RUN apt-get install -y vim

# Jupyter related
RUN pip3 install ipykernel

# Machine learning
RUN pip3 install sklearn

# Data viz
RUN pip3 install seaborn

# NLP
RUN pip3 install nltk
RUN pip3 install spacy
RUN pip3 install gensim

