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

    # docker
    #
    ## Container (pc)
    __docker_add_abbr pc 'docker container'
    __docker_add_abbr pca 'docker container attach'
    __docker_add_abbr pccm 'docker container commit'
    # cp
    __docker_add_abbr pcc 'docker container create'
    __docker_add_abbr pcd 'docker container diff'
    __docker_add_abbr pce 'docker container exec'
    __docker_add_abbr pcei 'docker container exec -it'
    __docker_add_abbr pcei 'docker container exec -it'
    __docker_add_abbr pcE 'docker container export'
    __docker_add_abbr pcin 'docker container inspect'
    __docker_add_abbr pck 'docker container kill'
    __docker_add_abbr pcl 'docker container logs'
    __docker_add_abbr pcL 'docker container logs -f'
    __docker_add_abbr pcls 'docker container ls'
    __docker_add_abbr pcla 'docker container ls -a'
    __docker_add_abbr pcp 'docker container pause'
    __docker_add_abbr pcpt 'docker container port'
    __docker_add_abbr pcpr 'docker container prune'
    __docker_add_abbr pcrn 'docker container rename'
    __docker_add_abbr pcrs 'docker container restart'
    __docker_add_abbr pcrm 'docker container rm'
    __docker_add_abbr pcr 'docker container run'
    __docker_add_abbr pcrr 'docker container run --rm'
    __docker_add_abbr pcri 'docker container run -it --rm'
    __docker_add_abbr pcrie 'docker container run -it --rm --entrypoint /bin/bash'
    __docker_add_abbr pcs 'docker container start'
    __docker_add_abbr pcss 'docker container stats'
    __docker_add_abbr pcx 'docker container stop'
    __docker_add_abbr pct 'docker container top'
    __docker_add_abbr pcup 'docker container unpause'
    __docker_add_abbr pcw 'docker container wait'

    ## Image (pi)
    __docker_add_abbr pi 'docker image'
    __docker_add_abbr pib 'docker image build'
    __docker_add_abbr pih 'docker image history'
    __docker_add_abbr piim 'docker image import'
    __docker_add_abbr piin 'docker image inspect'
    __docker_add_abbr pil 'docker image load'
    __docker_add_abbr pils 'docker image ls'
    __docker_add_abbr pipr 'docker image prune'
    __docker_add_abbr pipl 'docker image pull'
    __docker_add_abbr piph 'docker image push'
    __docker_add_abbr pir 'docker image rm'
    __docker_add_abbr pis 'docker image save'
    __docker_add_abbr pit 'docker image tag'

    ## Volume (pv)
    __docker_add_abbr pv 'docker volume'
    __docker_add_abbr pvc 'docker volume create'
    __docker_add_abbr pvin 'docker volume inspect'
    __docker_add_abbr pvl 'docker volume ls'
    __docker_add_abbr pvpr 'docker volume prune'
    __docker_add_abbr pvrm 'docker volume rm'

    ## Network (pn)
    __docker_add_abbr pn 'docker network'
    __docker_add_abbr pnc 'docker network connect'
    __docker_add_abbr pnC 'docker network create'
    __docker_add_abbr pnd 'docker network disconnect'
    __docker_add_abbr pnin 'docker network inspect'
    __docker_add_abbr pnl 'docker network ls'
    __docker_add_abbr pnpr 'docker network prune'
    __docker_add_abbr pnrm 'docker network rm'

    ## Stack (pk)
    __docker_add_abbr pk 'docker stack'
    __docker_add_abbr pkd 'docker stack deploy'
    __docker_add_abbr pkls 'docker stack ls'
    __docker_add_abbr pkps 'docker stack ps'
    __docker_add_abbr pkrm 'docker stack rm'
    __docker_add_abbr pks 'docker stack services'

    ## Swarm (pm)
    __docker_add_abbr pm 'docker swarm'
    # ca
    __docker_add_abbr pmi 'docker swarm init'
    __docker_add_abbr pmj 'docker swarm join'
    __docker_add_abbr pmjt 'docker swarm join-token'
    __docker_add_abbr pml 'docker swarm leave'
    __docker_add_abbr pmul 'docker swarm unlock'
    __docker_add_abbr pmulk 'docker swarm unlock-key'
    __docker_add_abbr pmu 'docker swarm update'

    ## System (ps)
    __docker_add_abbr psd 'docker system df'
    __docker_add_abbr pse 'docker system events'
    __docker_add_abbr psi 'docker system info'
    __docker_add_abbr pspr 'docker system prune'

    ## Pod (pp)
    __docker_add_abbr pp 'docker pod'
    # clone
    __docker_add_abbr ppc 'docker pod create'
    __docker_add_abbr ppe 'docker pod exists'
    __docker_add_abbr ppin 'docker pod inspect'
    __docker_add_abbr ppk 'docker pod kill'
    __docker_add_abbr ppl 'docker pod logs'
    __docker_add_abbr ppL 'docker pod logs -f'
    __docker_add_abbr ppp 'docker pod pause'
    __docker_add_abbr pppr 'docker pod prune'
    # ps
    __docker_add_abbr pprs 'docker pod restart'
    __docker_add_abbr pprm 'docker pod rm'
    __docker_add_abbr ppst 'docker pod start'
    __docker_add_abbr ppss 'docker pod stats'
    __docker_add_abbr ppP 'docker pod stop'
    __docker_add_abbr ppt 'docker pod top'
    __docker_add_abbr ppup 'docker pod unpause'

    ## Machine (pm)
    __docker_add_abbr pm 'docker machine'
    __docker_add_abbr pmi 'docker machine info'
    # init
    __docker_add_abbr pmin 'docker machine inspect'
    __docker_add_abbr pml 'docker machine list'
    __docker_add_abbr pmrm 'docker machine rm'
    # set
    __docker_add_abbr pms 'docker machine ssh'
    __docker_add_abbr pmst 'docker machine start'
    __docker_add_abbr pmP 'docker machine stop'

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
