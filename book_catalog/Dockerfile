FROM python:3-slim
WORKDIR /app
COPY ./book_catalog/app ./app
COPY ./book_catalog/requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt
EXPOSE 81
ENV PYTHONUNBUFFERED=1
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "81"]
