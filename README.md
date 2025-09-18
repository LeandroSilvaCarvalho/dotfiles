# My dotfiles

Ce dépôt contient mes configurations personnelles, gérées avec [chezmoi](https://www.chezmoi.io).

---

## 🖥️ Utilisation sur une nouvelle machine

1. **Installer chezmoi**  
   ```bash
   brew install chezmoi
   ```
2. **Initialiser avec mon dépôt GitHub**
   ```bash
   chezmoi init LeandroSilvaCarvalho
   ```
3. **Appliquer les dotfiles dans $HOME**
    ```bash
    chezmoi apply
    ```
## 🔄 Mettre à jour mes dotfiles
1. **Ajouter un fichier ou un dossier dans chezmoi**  
   ```bash
   brew install chezmoi
   ```
2. **Vérifier les changements**
   ```bash
   chezmoi init LeandroSilvaCarvalho
   ```
3. **Appliquer les changements (si besoin)**
    ```bash
    chezmoi apply
    ```
4. **Commit et push vers GitHub**
   ```bash
   chezmoi cd
   git add .
   git commit -m "Mise à jour dotfiles"
   git push
   ```
---

👉 Avec ce README, tu as :  
- La procédure simple pour **installer tes dotfiles sur un nouveau Mac/Linux**.  
- Le workflow clair pour **mettre à jour et pousser tes changements**.  
