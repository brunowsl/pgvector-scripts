FROM postgres:latest

# Instalar dependências necessárias para pgvector
RUN apt-get update && apt-get install -y \
    build-essential \
    postgresql-server-dev-all \
    git \
    cmake

# Clonar e instalar pgvector
RUN git clone https://github.com/pgvector/pgvector.git \
    && cd pgvector \
    && make \
    && make install

# Copiar o script de inicialização para o diretório correto
COPY init-pgvector.sh /docker-entrypoint-initdb.d/

EXPOSE 5432
