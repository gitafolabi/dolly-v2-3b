FROM python:3.8-slim-buster

# Set the working directory
WORKDIR /app

# Copy the requirements file and install the dependencies
COPY . /app/
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8080

CMD [ "python", "main.py" ]