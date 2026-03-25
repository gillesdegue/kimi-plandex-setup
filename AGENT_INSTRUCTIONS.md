# 🤖 Instructions pour l'Agent IA (Session suivante)

Ce document est destiné à l'agent IA qui reprendra ce projet. Il résume la configuration système, les optimisations et la méthode pour connecter Kimi à Cursor.

## 🛠️ État de la Configuration Système

1.  **Modèle** : `Kimi-Dev-72B-IQ4_XS.gguf` (~37GB).
2.  **Serveur** : Ollama (port 11434).
3.  **Optimisations Actives** :
    *   `OLLAMA_FLASH_ATTENTION=1`
    *   `OLLAMA_KV_CACHE_TYPE=q4_0` (Essentiel pour tenir le contexte 128k sur GPU).
4.  **Alias de Modèle** : Les alias `gpt-4` et `gpt-4o` ont été créés (`ollama cp Kimi:latest gpt-4`) pour assurer la compatibilité avec Cursor.

## 🌐 Méthode de Connexion "Zéro-Config" (Tunnel SSH)

N'essaie PAS d'utiliser des tunnels HTTP publics (Cloudflare, Ngrok). La méthode la plus fiable pour que l'utilisateur connecte son **Cursor local** au **Kimi distant** est le **Port Forwarding SSH**.

**Commande à donner à l'utilisateur :**
```bash
ssh -L 11434:localhost:11434 root@<IP_DU_POD> -p <PORT_SSH>
```

Une fois le tunnel ouvert, Cursor peut être configuré sur :
*   **Base URL** : `http://localhost:11434/v1`
*   **Model** : `gpt-4` (alias de Kimi).

## 🚀 Méthode d'Automatisation pour l'Agent

Si tu dois réinstaller l'environnement sur un nouveau Pod :

1.  **Installation Base** : `apt update && apt install -y zstd wget git curl`.
2.  **Ollama** : `curl -fsSL https://ollama.com/install.sh | sh`.
3.  **Récupération Modèle** : Cloner `kimi-plandex-setup` et lancer `bash setup.sh`.
4.  **Optimisation GPU** : Toujours exporter les variables `FLASH_ATTENTION` et `KV_CACHE` avant de lancer `ollama serve`.
5.  **Initialisation du projet `site_vitrine`** :
    *   Vérifier la table `site_settings` dans `database.sqlite`.
    *   S'assurer que le Front (`VisitorApp.tsx`) et le Back (`design.controller.ts`) sont synchronisés via l'API.

## 📝 Historique des modifications majeures
*   **Design Dynamique** : Ajout d'une gestion de thème (couleurs, logos) via l'admin.
*   **Documentations** : `KIMI_GUIDE.md` (pour l'utilisateur) et `AGENT_INSTRUCTIONS.md` (pour toi).

---
*Signé : Ton prédécesseur IA.*
