# Start from the Airflow base image
FROM apache/airflow:latest

# Use root to perform system modifications
USER root

# Install any necessary dependencies (example shown)
RUN pip install --no-cache-dir torch transformers pandas scipy dash spacy

# Create the 'airflow' group and user if they don't already exist
RUN groupadd -f -g 50000 airflow && \
    useradd -u 50000 -g 50000 -ms /bin/bash airflow || true

# Create directory and set correct ownership
RUN mkdir -p /home/airflow/.cache/huggingface && \
    chown -R airflow:airflow /home/airflow/.cache

# Switch back to the non-root user 'airflow'
USER airflow
