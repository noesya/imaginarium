# Imaginarium

Création collective d'imaginaire

## Variables d'environnement

```yaml
STABILITY_SDK_API_KEY

SCALEWAY_OS_ACCESS_KEY_ID
SCALEWAY_OS_BUCKET
SCALEWAY_OS_ENDPOINT
SCALEWAY_OS_REGION
SCALEWAY_OS_SECRET_ACCESS_KEY

ADMIN_NAME
ADMIN_PASSWORD
```

## Déploiement en production 

Pour installer le remote 
```bash
git remote add scalingo git@ssh.osc-fr1.scalingo.com:imaginarium.git
```

Pour déployer sur Scalingo 

```bash
git push scalingo main
```