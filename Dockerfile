# Start with the Airflow base image
FROM apache/airflow:latest

# Switch to the airflow user
USER airflow

# Install additional Python dependencies for Airflow
RUN pip install torch transformers pandas scipy Dash

# Set the default value for the Hugging Face User Access Token
ENV HF_TOKEN=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

# Download models from Hugging Face
RUN mkdir /opt/airflow/models
WORKDIR /opt/airflow/models

# Example: Downloading models from Hugging Face using huggingface-cli
RUN huggingface-cli login --token $HF_TOKEN
RUN huggingface-cli repo create cardiffnlp/twitter-roberta-base-sentiment-latest
RUN huggingface-cli repo create Falconsai/text_summarization
RUN huggingface-cli repo create facebook/mms-tts-eng
