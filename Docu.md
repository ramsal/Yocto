- [ ] muy imporatnet elegir la misma rama de poky y de los metas
- [ ] los repositorios dan jaleo. Me funcionó esto: 
  1. pongo como unico repo "http://ubuntu.uc3m.es/ubuntu/ xenial main"
  2. me descargo la firma gpg "wget ubuntu.uc3m.es/ubuntu/project/ubuntu-archive-keyring.gpg"
  3. añado la firma a apt "apt-key add ubuntu-archive-keyring.gpg"
  4. apt-get update
  
  
  
