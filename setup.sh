#!/bin/bash

# 1. Installer Ollama si absent
if ! command -v ollama &> /dev/null
then
    echo "Installing Ollama..."
    curl -fsSL https://ollama.com/install.sh | sh
fi

# 2. Installer Plandex si absent
if ! command -v pdx &> /dev/null
then
    echo "Installing Plandex..."
    curl -sL https://plandex.ai/install.sh | bash
fi

# 3. Créer le dossier pour le modèle
mkdir -p /root/models

# 4. Télécharger le modèle Kimi (37GB) si non présent
MODEL_PATH="/root/models/Kimi-Dev-72B-IQ4_XS.gguf"
if [ ! -f "$MODEL_PATH" ]; then
    echo "Downloading Kimi-Dev-72B GGUF..."
    wget -c -O "$MODEL_PATH" https://huggingface.co/unsloth/Kimi-Dev-72B-GGUF/resolve/main/Kimi-Dev-72B-IQ4_XS.gguf
fi

# 5. Lancer Ollama avec optimisations et créer le modèle
export OLLAMA_FLASH_ATTENTION=1
export OLLAMA_KV_CACHE_TYPE=q4_0
ollama serve &
sleep 10
ollama create Kimi -f /root/models/Kimi.Modelfile

echo "Setup complete! Vous pouvez utiliser 'ollama run Kimi' ou 'pdx'."
