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
    __docker_add_abbr dka 'docker attach'
    __docker_add_abbr dkb 'docker build'
    __docker_add_abbr dkd 'docker diff'
    __docker_add_abbr dkdf 'docker system df'
    __docker_add_abbr dke 'docker exec'
    __docker_add_abbr dkei 'docker exec -it'
    __docker_add_abbr dkh 'docker history'
    __docker_add_abbr dki 'docker images'
    __docker_add_abbr dkin 'docker inspect'
    __docker_add_abbr dkim 'docker import'
    __docker_add_abbr dkk 'docker kill'
    __docker_add_abbr dkkh 'docker kill -s HUP'
    __docker_add_abbr dkl 'docker logs'
    __docker_add_abbr dkL 'docker logs -f'
    __docker_add_abbr dkli 'docker login'
    __docker_add_abbr dklo 'docker logout'
    __docker_add_abbr dkp 'docker pause'
    __docker_add_abbr dkP 'docker unpause'
    __docker_add_abbr dkpl 'docker pull'
    __docker_add_abbr dkph 'docker push'
    __docker_add_abbr dkps 'docker ps'
    __docker_add_abbr dkpsa 'docker ps -a'
    __docker_add_abbr dkr 'docker run'
    __docker_add_abbr dkri 'docker run -it --rm'
    __docker_add_abbr dkrie 'docker run -it --rm --entrypoint /bin/bash'
    __docker_add_abbr dkRM 'docker system prune'
    __docker_add_abbr dkrm 'docker rm'
    __docker_add_abbr dkrmi 'docker rmi'
    __docker_add_abbr dkrn 'docker rename'
    __docker_add_abbr dks 'docker start'
    __docker_add_abbr dkS 'docker restart'
    __docker_add_abbr dkss 'docker stats'
    __docker_add_abbr dksv 'docker save'
    __docker_add_abbr dkt 'docker tag'
    __docker_add_abbr dktop 'docker top'
    __docker_add_abbr dkup 'docker update'
    __docker_add_abbr dkv 'docker version'
    __docker_add_abbr dkw 'docker wait'
    __docker_add_abbr dkx 'docker stop'
    __docker_add_abbr dkstop 'docker stop (docker ps -aq)'

    # Docker Compose (c)
    __docker_add_abbr dkc docker-compose
    __docker_add_abbr dkcb 'docker-compose build'
    __docker_add_abbr dkcB 'docker-compose build --no-cache'
    __docker_add_abbr dkcd 'docker-compose down'
    __docker_add_abbr dkce 'docker-compose exec'
    __docker_add_abbr dkck 'docker-compose kill'
    __docker_add_abbr dkcl 'docker-compose logs'
    __docker_add_abbr dkcL 'docker-compose logs -f'
    __docker_add_abbr dkcls 'docker-compose ps'
    __docker_add_abbr dkcp 'docker-compose pause'
    __docker_add_abbr dkcP 'docker-compose unpause'
    __docker_add_abbr dkcpl 'docker-compose pull'
    __docker_add_abbr dkcph 'docker-compose push'
    __docker_add_abbr dkcps 'docker-compose ps'
    __docker_add_abbr dkcr 'docker-compose run'
    __docker_add_abbr dkcR 'docker-compose run --rm'
    __docker_add_abbr dkcrm 'docker-compose rm'
    __docker_add_abbr dkcs 'docker-compose start'
    __docker_add_abbr dkcsc 'docker-compose scale'
    __docker_add_abbr dkcS 'docker-compose restart'
    __docker_add_abbr dkcu 'docker-compose up'
    __docker_add_abbr dkcU 'docker-compose up -d'
    __docker_add_abbr dkcv 'docker-compose version'
    __docker_add_abbr dkcx 'docker-compose stop'
    #
    ## Container (C)
    __docker_add_abbr dkC 'docker container'
    __docker_add_abbr dkCa 'docker container attach'
    __docker_add_abbr dkCcp 'docker container cp'
    __docker_add_abbr dkCd 'docker container diff'
    __docker_add_abbr dkCe 'docker container exec'
    __docker_add_abbr dkCei 'docker container exec -it'
    __docker_add_abbr dkCin 'docker container inspect'
    __docker_add_abbr dkCk 'docker container kill'
    __docker_add_abbr dkCl 'docker container logs'
    __docker_add_abbr dkCL 'docker container logs -f'
    __docker_add_abbr dkCls 'docker container ls'
    __docker_add_abbr dkCp 'docker container pause'
    __docker_add_abbr dkCpr 'docker container prune'
    __docker_add_abbr dkCrn 'docker container rename'
    __docker_add_abbr dkCS 'docker container restart'
    __docker_add_abbr dkCrm 'docker container rm'
    __docker_add_abbr dkCr 'docker container run'
    __docker_add_abbr dkCri 'docker container run -it --rm'
    __docker_add_abbr dkCrie 'docker container run -it --rm --entrypoint /bin/bash'
    __docker_add_abbr dkCs 'docker container start'
    __docker_add_abbr dkCss 'docker container stats'
    __docker_add_abbr dkCx 'docker container stop'
    __docker_add_abbr dkCtop 'docker container top'
    __docker_add_abbr dkCP 'docker container unpause'
    __docker_add_abbr dkCup 'docker container update'
    __docker_add_abbr dkCw 'docker container wait'

    ## Image (I)
    __docker_add_abbr dkI 'docker image'
    __docker_add_abbr dkIb 'docker image build'
    __docker_add_abbr dkIh 'docker image history'
    __docker_add_abbr dkIim 'docker image import'
    __docker_add_abbr dkIin 'docker image inspect'
    __docker_add_abbr dkIls 'docker image ls'
    __docker_add_abbr dkIpr 'docker image prune'
    __docker_add_abbr dkIpl 'docker image pull'
    __docker_add_abbr dkIph 'docker image push'
    __docker_add_abbr dkIrm 'docker image rm'
    __docker_add_abbr dkIsv 'docker image save'
    __docker_add_abbr dkIt 'docker image tag'

    ## Volume (V)
    __docker_add_abbr dkV 'docker volume'
    __docker_add_abbr dkVin 'docker volume inspect'
    __docker_add_abbr dkVls 'docker volume ls'
    __docker_add_abbr dkVpr 'docker volume prune'
    __docker_add_abbr dkVrm 'docker volume rm'

    ## Network (N)
    __docker_add_abbr dkN 'docker network'
    __docker_add_abbr dkNs 'docker network connect'
    __docker_add_abbr dkNx 'docker network disconnect'
    __docker_add_abbr dkNin 'docker network inspect'
    __docker_add_abbr dkNls 'docker network ls'
    __docker_add_abbr dkNpr 'docker network prune'
    __docker_add_abbr dkNrm 'docker network rm'

    ## System (Y)
    __docker_add_abbr dkY 'docker system'
    __docker_add_abbr dkYdf 'docker system df'
    __docker_add_abbr dkYpr 'docker system prune'

    ## Stack (K)
    __docker_add_abbr dkK 'docker stack'
    __docker_add_abbr dkKls 'docker stack ls'
    __docker_add_abbr dkKps 'docker stack ps'
    __docker_add_abbr dkKrm 'docker stack rm'

    ## Swarm (W)
    __docker_add_abbr dkW 'docker swarm'

    ## CleanUp (rm)
    # Clean up exited containers (docker < 1.13)
    __docker_add_abbr dkrmC 'docker rm (docker ps -qaf status=exited)'

    # Clean up dangling images (docker < 1.13)
    __docker_add_abbr dkrmI 'docker rmi (docker images -qf dangling=true)'

    # Pull all tagged images
    __docker_add_abbr dkplI 'docker images --format "{{ .Repository }}" | grep -v "^<none>$" | xargs -L1 docker pull'

    # Clean up dangling volumes (docker < 1.13)
    __docker_add_abbr dkrmV 'docker volume rm (docker volume ls -qf dangling=true)'

    # Docker Machine (m)
    __docker_add_abbr dkm docker-machine
    __docker_add_abbr dkma 'docker-machine active'
    __docker_add_abbr dkmcp 'docker-machine scp'
    __docker_add_abbr dkmin 'docker-machine inspect'
    __docker_add_abbr dkmip 'docker-machine ip'
    __docker_add_abbr dkmk 'docker-machine kill'
    __docker_add_abbr dkmls 'docker-machine ls'
    __docker_add_abbr dkmpr 'docker-machine provision'
    __docker_add_abbr dkmps 'docker-machine ps'
    __docker_add_abbr dkmrg 'docker-machine regenerate-certs'
    __docker_add_abbr dkmrm 'docker-machine rm'
    __docker_add_abbr dkms 'docker-machine start'
    __docker_add_abbr dkmsh 'docker-machine ssh'
    __docker_add_abbr dkmst 'docker-machine status'
    __docker_add_abbr dkmS 'docker-machine restart'
    __docker_add_abbr dkmu 'docker-machine url'
    __docker_add_abbr dkmup 'docker-machine upgrade'
    __docker_add_abbr dkmv 'docker-machine version'
    __docker_add_abbr dkmx 'docker-machine stop'

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
