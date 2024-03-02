# Update le dotfiles

Pour mettre à jour les fichiers et les synchroniser avec votre dépôt distant, suivez ces commandes dans l'ordre :

```bash
chezmoi re-add
chezmoi git -- commit -m "Update dotfiles"
git push

# Download les maj du dotfiles
```bash
chezmoi update -v
