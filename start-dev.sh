docker build -t base:1 -f .infra/Dockerfile-base .
docker compose up -d --build --force-recreate
docker exec -t sf_keycloak_exam-ple composer install
docker exec -t sf_keycloak_exam-ple bin/console d:m:m --no-interaction
docker exec -t sf_keycloak_exam-ple bin/console lexik:jwt:generate-keypair --overwrite --no-interaction