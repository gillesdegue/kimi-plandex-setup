FROM nvidia/cuda:12.8.0-runtime-ubuntu22.04

# Installer les dépendances
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    zstd \
    git \
    && rm -rf /var/lib/apt/lists/*

# Installer Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Installer Plandex
RUN curl -sL https://plandex.ai/install.sh | bash

# Dossier pour les modèles
RUN mkdir -p /root/models

# Exposer le port Ollama
EXPOSE 11434

# Optimisations GPU (Flash Attention + KV q4_0)
ENV OLLAMA_FLASH_ATTENTION=1
ENV OLLAMA_KV_CACHE_TYPE=q4_0

# Script de démarrage
COPY Kimi.Modelfile /root/models/Kimi.Modelfile
COPY setup.sh /setup.sh
RUN chmod +x /setup.sh

CMD ["ollama", "serve"]
