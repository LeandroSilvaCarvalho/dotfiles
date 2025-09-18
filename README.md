# My dotfiles

This repository contains my personal configurations, managed with [chezmoi](https://www.chezmoi.io).

---

## 🖥️ Using on a new machine

1. **Install chezmoi**
   ```bash
   brew install chezmoi
   ```

2. **Initialise with my GitHub repository**
   ```bash
   chezmoi init LeandroSilvaCarvalho
   ```

3. **Apply the dotfiles in $HOME**
   ```bash
   chezmoi apply
   ```

## 🔄 Update my dotfiles

1. **Add a file or folder to chezmoi**  
   ```bash
   brew install chezmoi
   ```

2. **Check for changes**
   ```bash
   chezmoi init LeandroSilvaCarvalho
   ```

3. **Apply changes (if necessary)**
   ```bash
   chezmoi apply
   ```

4. **Commit and push to GitHub**
   ```bash
   chezmoi cd
   git add .
   git commit -m ‘Update dotfiles’
   git push
   ```

