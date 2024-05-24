# Start with the Airflow base image
FROM apache/airflow:latest

# Switch to the airflow user
USER airflow

# Install additional Python dependencies for Airflow
RUN pip install torch pandas transformers scipy Dash spacy

USER root

RUN mkdir -p /home/airflow/.cache/huggingface && \
    chown -R airflow:airflow /home/airflow/.cache

