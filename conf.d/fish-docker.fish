#!/usr/bin/env fish

function _fish-docker_install --on-event fish-docker_install
    __fish-docker_update_completions
    __populate_docker_abbr
end

function _fish-docker_update --on-event fish-docker_update
    __clear_docker_abbr
    __fish-docker_update_completions
    __populate_docker_abbr
end

function _fish-docker_uninstall --on-event fish-docker_uninstall
    __clear_docker_abbr
    set --local comp_path (status dirname)"/../completions"
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

    # docker(but use **c**: because it's central on containers)
    #
    ## Container(c)
    # special case: avoid conflict with cc command.
    __docker_add_abbr ccn 'docker container'
    __docker_add_abbr cca 'docker container attach'
    __docker_add_abbr cccm 'docker container commit'
    # cp
    __docker_add_abbr ccc 'docker container create'
    __docker_add_abbr ccd 'docker container diff'
    __docker_add_abbr cce 'docker container exec'
    __docker_add_abbr ccei 'docker container exec -it'
    __docker_add_abbr ccei 'docker container exec -it'
    __docker_add_abbr ccE 'docker container export'
    __docker_add_abbr ccin 'docker container inspect'
    __docker_add_abbr cck 'docker container kill'
    __docker_add_abbr ccl 'docker container logs'
    __docker_add_abbr ccL 'docker container logs -f'
    __docker_add_abbr ccls 'docker container ls'
    __docker_add_abbr ccla 'docker container ls -a'
    __docker_add_abbr ccp 'docker container pause'
    __docker_add_abbr ccpt 'docker container port'
    __docker_add_abbr ccpr 'docker container prune'
    __docker_add_abbr ccrn 'docker container rename'
    __docker_add_abbr ccrs 'docker container restart'
    __docker_add_abbr ccrm 'docker container rm'
    __docker_add_abbr ccr 'docker container run'
    __docker_add_abbr ccrr 'docker container run --rm'
    __docker_add_abbr ccri 'docker container run -it --rm'
    __docker_add_abbr ccrie 'docker container run -it --rm --entrypoint /bin/bash'
    __docker_add_abbr ccs 'docker container start'
    __docker_add_abbr ccss 'docker container stats'
    __docker_add_abbr ccx 'docker container stop'
    __docker_add_abbr cct 'docker container top'
    __docker_add_abbr ccup 'docker container unpause'
    __docker_add_abbr ccw 'docker container wait'

    ## Image (i)
    __docker_add_abbr ci 'docker image'
    __docker_add_abbr cib 'docker image build'
    __docker_add_abbr cih 'docker image history'
    __docker_add_abbr ciim 'docker image import'
    __docker_add_abbr ciin 'docker image inspect'
    __docker_add_abbr cil 'docker image load'
    __docker_add_abbr cils 'docker image ls'
    __docker_add_abbr cipr 'docker image prune'
    __docker_add_abbr cipl 'docker image pull'
    __docker_add_abbr ciph 'docker image push'
    __docker_add_abbr cir 'docker image rm'
    __docker_add_abbr cis 'docker image save'
    __docker_add_abbr cit 'docker image tag'

    ## Network (w)
    __docker_add_abbr cw 'docker network'
    __docker_add_abbr cwc 'docker network connect'
    __docker_add_abbr cwC 'docker network create'
    __docker_add_abbr cwd 'docker network disconnect'
    __docker_add_abbr cwin 'docker network inspect'
    __docker_add_abbr cwls 'docker network ls'
    __docker_add_abbr cwpr 'docker network prune'
    __docker_add_abbr cwrm 'docker network rm'

    ## Node (n)
    __docker_add_abbr cn 'docker node'
    __docker_add_abbr cnc 'docker node demote'
    __docker_add_abbr cnin 'docker node inspect'
    __docker_add_abbr cnls 'docker node ls'
    __docker_add_abbr cnp 'docker node promote'
    __docker_add_abbr cnps 'docker node ps'
    __docker_add_abbr cnrm 'docker node rm'
    __docker_add_abbr cnu 'docker node update'

    ## Stack (k)
    __docker_add_abbr ck 'docker stack'
    __docker_add_abbr ckd 'docker stack deploy'
    __docker_add_abbr ckls 'docker stack ls'
    __docker_add_abbr ckps 'docker stack ps'
    __docker_add_abbr ckrm 'docker stack rm'
    __docker_add_abbr cks 'docker stack services'

    ## Swarm (m)
    __docker_add_abbr cm 'docker swarm'
    # ca
    __docker_add_abbr cmi 'docker swarm init'
    __docker_add_abbr cmj 'docker swarm join'
    __docker_add_abbr cmjt 'docker swarm join-token'
    __docker_add_abbr cml 'docker swarm leave'
    __docker_add_abbr cmul 'docker swarm unlock'
    __docker_add_abbr cmulk 'docker swarm unlock-key'
    __docker_add_abbr cmu 'docker swarm update'

    ## Service (s)
    __docker_add_abbr cs 'docker service'
    # ca
    __docker_add_abbr csc 'docker service create'
    __docker_add_abbr csin 'docker service inspect'
    __docker_add_abbr csl 'docker service logs'
    __docker_add_abbr csls 'docker service ls'
    __docker_add_abbr csps 'docker service ps'
    __docker_add_abbr csr 'docker service rm'
    __docker_add_abbr csrb 'docker service rollback'
    __docker_add_abbr css 'docker service scale'
    __docker_add_abbr csu 'docker service update'

    ## System (y)
    __docker_add_abbr cy 'docker system'
    __docker_add_abbr cyd 'docker system df'
    __docker_add_abbr cye 'docker system events'
    __docker_add_abbr cyi 'docker system info'
    __docker_add_abbr cypr 'docker system prune'

    ## Volume (v)
    __docker_add_abbr cv 'docker volume'
    __docker_add_abbr cvc 'docker volume create'
    __docker_add_abbr cvin 'docker volume inspect'
    __docker_add_abbr cvls 'docker volume ls'
    __docker_add_abbr cvpr 'docker volume prune'
    __docker_add_abbr cvrm 'docker volume rm'

    ## CleanUp (rm)
    # Clean up exited containers.
    __docker_add_abbr prmC 'docker container rm (docker container ls -qaf status=exited)'

    # Clean up dangling images.
    __docker_add_abbr prmI 'docker image rm (docker image ls -qaf dangling=true)'

    # Clean up dangling volumes.
    __docker_add_abbr prmV 'docker volume rm (docker volume ls -qf dangling=true)'

    # docker Compose (dcp)
    __docker_add_abbr dp docker-compose
    __docker_add_abbr dpb 'docker-compose build'
    __docker_add_abbr dpB 'docker-compose build --no-cache'
    # convert
    # cp
    # create
    __docker_add_abbr dpd 'docker-compose down'
    __docker_add_abbr dpE 'docker-compose events'
    __docker_add_abbr dpe 'docker-compose exec'
    __docker_add_abbr dpi 'docker-compose images'
    __docker_add_abbr dpk 'docker-compose kill'
    __docker_add_abbr dpl 'docker-compose logs'
    __docker_add_abbr dpL 'docker-compose logs -f'
    __docker_add_abbr dpls 'docker-compose ls'
    __docker_add_abbr dpp 'docker-compose pause'
    __docker_add_abbr dppt 'docker-compose port'
    __docker_add_abbr dpps 'docker-compose ps'
    __docker_add_abbr dppl 'docker-compose pull'
    __docker_add_abbr dpph 'docker-compose push'
    __docker_add_abbr dpS 'docker-compose restart'
    __docker_add_abbr dprm 'docker-compose rm'
    __docker_add_abbr dpr 'docker-compose run'
    __docker_add_abbr dpR 'docker-compose run --rm'
    __docker_add_abbr dps 'docker-compose start'
    __docker_add_abbr dpx 'docker-compose stop'
    __docker_add_abbr dpt 'docker-compose top'
    __docker_add_abbr dpP 'docker-compose unpause'
    __docker_add_abbr dpu 'docker-compose up'
    __docker_add_abbr dpU 'docker-compose up -d'

    functions --erase __docker_add_abbr
end

function __fish-docker_update_completions
    set --local comp_path (status dirname)"/../completions"
    test ! -d $comp_path && command mkdir -p $comp_path
    echo "Downloading the docker-compose completion files from halostatue/fish-docker...."

    # https://raw.githubusercontent.com/docker/compose/master/contrib/completion/fish/docker-compose.fish
    # Use completions generated by halostatue/fish-docker.
    curl https://raw.githubusercontent.com/halostatue/fish-docker/main/completions/docker-compose.fish >"$comp_path"/docker-compose.fish
end
