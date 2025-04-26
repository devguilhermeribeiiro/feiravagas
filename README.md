#README

#Setup database image for development

"docker run --name postgres-dev -e POSTGRES_USER=feiravagas -e POSTGRES_PASSWORD=feiravagas -e  POSTGRES_DB=feiravagas -p 5432:5432 -v pgdata:/var/lib/postgresql/data -d postgres:16"

