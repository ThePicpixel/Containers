

podman pod create --name confluence --publish 8090:8090 --publish 8091:8091

podman run --pod confluence --name confluence.postgres -e POSTGRES_USER=postgres -e POSTGRES_DB=postgres -e POSTGRES_PASSWORD=psql -d postgres

podman run --pod confluence -v /home/thepicpixel/Containers/confluence/data:/var/atlassian/application-data/confluence --name confluence.server -d atlassian/confluence


