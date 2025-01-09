# build stage
FROM python:2.7 AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

# run stage
FROM gcr.io/distroless/python3
COPY --from=builder /app /app
WORKDIR /app
CMD ["application.py", "--mode", "local", "--serverPort", "5000", "--port", "8000"]
