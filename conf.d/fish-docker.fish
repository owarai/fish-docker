#!/usr/bin/env fish

function _fish-docker_install --on-event fish-docker_install
    __fish-docker_update_completions
    __populate_docker_abbr
end

function _fish-docker_update --on-event fish-docker_update
    __clear_docker_abbr
    __populate_docker_abbr
end

function _fish-docker_uninstall --on-event fish-docker_uninstall
    __clear_docker_abbr
    set --local comp_path (status dirname)"/../completions"
    #rm "$comp_path"/docker.fish
    rm "$comp_path"/docker-compose.fish
end

function __clear_docker_abbr
    for ab in $__docker_abbrs
        abbr --erase $ab
    end
    set -Ue __docker_abbrs
end

# Alias adapted from https://github.com/akarzim/zsh-docker-aliases;
# Abbr impls borrowed from https://github.com/gazorby/fish-docker.
function __populate_docker_abbr
    set -U __docker_abbrs

    function __docker_add_abbr -d "Create docker abbreviations"
        set -l name $argv[1]
        set -l body $argv[2..-1]
        abbr -a $name $body
        set -a __docker_abbrs $name
    end

    # Docker
    __docker_add_abbr dk docker
    __docker_add_abbr dkli 'docker login'
    __docker_add_abbr dklo 'docker logout'
    __docker_add_abbr dkv 'docker version'

    # Docker Compose (dcp)
    __docker_add_abbr dcp docker-compose
    __docker_add_abbr dcpb 'docker-compose build'
    __docker_add_abbr dcpB 'docker-compose build --no-cache'
    __docker_add_abbr dcpd 'docker-compose down'
    __docker_add_abbr dcpe 'docker-compose exec'
    __docker_add_abbr dcpk 'docker-compose kill'
    __docker_add_abbr dcpl 'docker-compose logs'
    __docker_add_abbr dcpL 'docker-compose logs -f'
    __docker_add_abbr dcpls 'docker-compose ps'
    __docker_add_abbr dcpp 'docker-compose pause'
    __docker_add_abbr dcpP 'docker-compose unpause'
    __docker_add_abbr dcppl 'docker-compose pull'
    __docker_add_abbr dcpph 'docker-compose push'
    __docker_add_abbr dcpps 'docker-compose ps'
    __docker_add_abbr dcpr 'docker-compose run'
    __docker_add_abbr dcpR 'docker-compose run --rm'
    __docker_add_abbr dcprm 'docker-compose rm'
    __docker_add_abbr dcps 'docker-compose start'
    __docker_add_abbr dcpS 'docker-compose restart'
    __docker_add_abbr dcpu 'docker-compose up'
    __docker_add_abbr dcpU 'docker-compose up -d'
    __docker_add_abbr dcpv 'docker-compose version'
    __docker_add_abbr dcpx 'docker-compose stop'
    #
    ## Container (dkc)
    __docker_add_abbr dkc 'docker container'
    __docker_add_abbr dkca 'docker container attach'
    __docker_add_abbr dkcc 'docker container create'
    __docker_add_abbr dkccm 'docker container commit'
    __docker_add_abbr dkccp 'docker container cp'
    __docker_add_abbr dkcd 'docker container diff'
    __docker_add_abbr dkce 'docker container exec'
    __docker_add_abbr dkcei 'docker container exec -it'
    __docker_add_abbr dkcE 'docker container export'
    __docker_add_abbr dkcin 'docker container inspect'
    __docker_add_abbr dkcl 'docker container logs'
    __docker_add_abbr dkcL 'docker container logs -f'
    __docker_add_abbr dkcls 'docker container ls'
    __docker_add_abbr dkclsa 'docker container ls -a'
    __docker_add_abbr dkcr 'docker container run'
    __docker_add_abbr dkcri 'docker container run -it --rm'
    __docker_add_abbr dkcrie 'docker container run -it --rm --entrypoint /bin/bash'
    __docker_add_abbr dkcs 'docker container start'
    __docker_add_abbr dkcx 'docker container stop'
    __docker_add_abbr dkcS 'docker container restart'
    __docker_add_abbr dkcp 'docker container pause'
    __docker_add_abbr dkcP 'docker container unpause'
    __docker_add_abbr dkck 'docker container kill'
    __docker_add_abbr dkcrm 'docker container rm'
    __docker_add_abbr dkcpr 'docker container prune'
    __docker_add_abbr dkcrn 'docker container rename'
    __docker_add_abbr dkcss 'docker container stats'
    __docker_add_abbr dkcpt 'docker container port'
    __docker_add_abbr dkctop 'docker container top'
    __docker_add_abbr dkcup 'docker container update'
    __docker_add_abbr dkcw 'docker container wait'

    ## Image (dki)
    __docker_add_abbr dki 'docker image'
    __docker_add_abbr dkib 'docker image build'
    __docker_add_abbr dkih 'docker image history'
    __docker_add_abbr dkiim 'docker image import'
    __docker_add_abbr dkiin 'docker image inspect'
    __docker_add_abbr dkils 'docker image ls'
    __docker_add_abbr dkipr 'docker image prune'
    __docker_add_abbr dkipl 'docker image pull'
    __docker_add_abbr dkiph 'docker image push'
    __docker_add_abbr dkir 'docker image rm'
    __docker_add_abbr dkis 'docker image save'
    __docker_add_abbr dkit 'docker image tag'

    ## Volume (dkv)
    __docker_add_abbr dkv 'docker volume'
    __docker_add_abbr dkvc 'docker volume create'
    __docker_add_abbr dkvin 'docker volume inspect'
    __docker_add_abbr dkvls 'docker volume ls'
    __docker_add_abbr dkvpr 'docker volume prune'
    __docker_add_abbr dkvrm 'docker volume rm'

    ## Network (dkn)
    __docker_add_abbr dkn 'docker network'
    __docker_add_abbr dknC 'docker network create'
    __docker_add_abbr dknc 'docker network connect'
    __docker_add_abbr dknd 'docker network disconnect'
    __docker_add_abbr dknin 'docker network inspect'
    __docker_add_abbr dknls 'docker network ls'
    __docker_add_abbr dknpr 'docker network prune'
    __docker_add_abbr dknrm 'docker network rm'

    ## System (dks)
    __docker_add_abbr dks 'docker system'
    __docker_add_abbr dksd 'docker system df'
    __docker_add_abbr dkse 'docker system events'
    __docker_add_abbr dksi 'docker system info'
    __docker_add_abbr dkspr 'docker system prune'

    ## Stack (dkk)
    __docker_add_abbr dkk 'docker stack'
    __docker_add_abbr dkkd 'docker stack deploy'
    __docker_add_abbr dkkls 'docker stack ls'
    __docker_add_abbr dkkps 'docker stack ps'
    __docker_add_abbr dkkrm 'docker stack rm'

    ## Swarm (w)
    __docker_add_abbr dkw 'docker swarm'

    ## CleanUp (rm)
    # Clean up exited containers.
    __docker_add_abbr dkrmC 'docker container rm (docker container ls -qaf status=exited)'

    # Clean up dangling images.
    __docker_add_abbr dkrmI 'docker image rm (docker image ls -qf dangling=true)'

    # Clean up dangling volumes.
    __docker_add_abbr dkrmV 'docker volume rm (docker volume ls -qf dangling=true)'

    functions --erase __docker_add_abbr
end

function __fish-docker_update_completions
    set --local comp_path (status dirname)"/../completions"
    test ! -d $comp_path && command mkdir -p $comp_path
    echo "Downloading the docker completion files from official repo..."

    # not work currently.
    #curl https://raw.githubusercontent.com/docker/cli/master/contrib/completion/fish/docker.fish >"$comp_path"/docker.fish

    curl https://raw.githubusercontent.com/docker/compose/master/contrib/completion/fish/docker-compose.fish >"$comp_path"/docker-compose.fish
end
