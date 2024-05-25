
FROM apache/airflow:latest

# Switch to the airflow user
USER airflow

# Install additional Python dependencies for Airflow
RUN pip install --no-cache-dir torch transformers pandas scipy dash spacy


# Download models from Hugging Face
RUN mkdir /opt/airflow/models
WORKDIR /opt/airflow/models

# Example: Downloading models from Hugging Face
RUN transformers-cli repo create cardiffnlp/twitter-roberta-base-sentiment-latest
RUN transformers-cli repo create Falconsai/text_summarization
RUN transformers-cli repo create facebook/mms-tts-eng
