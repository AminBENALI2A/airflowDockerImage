
FROM apache/airflow:latest

# Switch to the airflow user
USER airflow

# Install additional Python dependencies for Airflow
RUN pip install --no-cache-dir torch transformers pandas scipy dash spacy

# Create a directory for storing secrets
USER root

RUN mkdir /run/secrets

# Set the default values for Hugging Face credentials
ENV HF_USERNAME=aminebenaliroo@gmail.com
ENV HF_PASSWORD=aminBENALI2003

# Download models from Hugging Face
RUN mkdir /opt/airflow/models
WORKDIR /opt/airflow/models

# Example: Downloading models from Hugging Face using huggingface-cli
RUN huggingface-cli login
RUN huggingface-cli repo create cardiffnlp/twitter-roberta-base-sentiment-latest
RUN huggingface-cli repo create Falconsai/text_summarization
RUN huggingface-cli repo create facebook/mms-tts-eng
