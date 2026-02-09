## Note

### Change shell to fish
```bash
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)
```
