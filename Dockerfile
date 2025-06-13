# Gunakan base image Python
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Instal FFmpeg dan FFprobe
RUN apt-get update && apt-get install -y ffmpeg libsm6 libxext6 && rm -rf /var/lib/apt/lists/*

# Salin requirements.txt dan instal dependensi Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Salin sisa kode aplikasi
COPY . .

# Expose port yang digunakan Gunicorn
EXPOSE 8080

# Tentukan perintah untuk menjalankan aplikasi menggunakan Gunicorn
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:8080"] 