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

## 🛠️ Utilisation avec Plandex

Pour utiliser **Plandex** avec votre modèle **Kimi** local :

1. **Utiliser l'alias raccourci :**
```bash
pdx-kimi
```

2. **Ou configurer manuellement :**
```bash
export PLANDEX_OPENAI_BASE_URL="http://localhost:11434/v1"
export OPENAI_API_KEY="ollama"
export PLANDEX_MODEL="Kimi"
pdx
```
