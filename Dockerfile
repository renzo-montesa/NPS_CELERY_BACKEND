FROM python:3.8

WORKDIR /app

# Setup virtual environment
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install dependencies
COPY NPS_MASTER_BACKEND/requirements.txt .
RUN pip install -r requirements.txt

# Copy source
COPY NPS_MASTER_BACKEND/. .

# Expose port
# EXPOSE 5000

# Set env variables
# ENV FLASK_APP=run.py
# ENV FLASK_DEBUG=1

# Run application
CMD ["celery", "-E", "-A", "celery_worker.celery", "worker", "--loglevel=info", "--pool=eventlet"]
