# Start with the Airflow base image
FROM apache/airflow:latest

# Switch to the airflow user
USER airflow

# Install additional Python dependencies for Airflow
RUN pip install torch transformers pandas scipy Dash spacy

# Add the latest version of NiFi
FROM apache/nifi:latest

# Switch back to the airflow user
USER root
