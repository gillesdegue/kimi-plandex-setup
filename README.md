# Kimi-Dev-72B + Plandex Setup

Ce dépôt automatise l'installation de **Ollama** et **Plandex** sur un serveur (ex: RunPod) pour utiliser le modèle **Kimi-Dev-72B-IQ4_XS.gguf**.

## 🚀 Installation rapide

1. **Cloner le repo :**
```bash
git clone https://github.com/gillesdegue/kimi-plandex-setup.git
cd kimi-plandex-setup
```

2. **Lancer le script d'installation :**
Ce script installera Ollama, Plandex et téléchargera le modèle (attention: 37GB).
```bash
bash setup.sh
```

## 🐳 Docker (Optionnel)

Si vous préférez Docker :
```bash
docker build -t kimi-plandex .
docker run --gpus all -it kimi-plandex
```

## 🛠️ Modèle GGUF utilisé
[unsloth/Kimi-Dev-72B-GGUF/Kimi-Dev-72B-IQ4_XS.gguf](https://huggingface.co/unsloth/Kimi-Dev-72B-GGUF/resolve/main/Kimi-Dev-72B-IQ4_XS.gguf)
