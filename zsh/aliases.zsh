# docker
alias up='docker-compose up -d'
alias down='docker-compose down -v'
alias reset='docker-compose down -v && docker rmi $(docker images -q) --force && docker-compose up -d'

# zsh
alias so='source ~/.zshrc'
