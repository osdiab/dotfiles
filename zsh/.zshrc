source "$HOME/.zsh-config/public/osdiab/zshrc.zsh"

[ -s "/Users/omardiab/.jabba/jabba.sh" ] && source "/Users/omardiab/.jabba/jabba.sh"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/omardiab/code/open-source/serverless-mono-example/packages/sls-random/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/omardiab/code/open-source/serverless-mono-example/packages/sls-random/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/omardiab/code/open-source/serverless-mono-example/packages/sls-random/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/omardiab/code/open-source/serverless-mono-example/packages/sls-random/node_modules/tabtab/.completions/sls.zsh


export EVERY_ORG="$HOME/code/every.org"
export EVERY_ORG_WEBAPP="$EVERY_ORG/webapp"

everydb () {
  (
    cd "$EVERY_ORG_WEBAPP/packages/api"
    yarn db:run
  )
}
# alias ecodevdb="docker run --rm --name ecodevdb -e POSTGRES_PASSWORD=ecotestpassword -e POSTGRES_USER=ecouser -e POSTGRES_DB=eco -d -p 5432:5432 -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data postgres"

