FROM python:2.7

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "./application.py", "--mode", "local", "--serverPort", "5000", "--port", "8000" ]