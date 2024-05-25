# Start from the Airflow base image
FROM apache/airflow:latest

# Use root to perform system modifications
USER airflow

# Install any necessary dependencies (example shown)
RUN pip install --no-cache-dir torch transformers pandas scipy dash spacy

# Switch back to the non-root user 'airflow'
USER airflow
