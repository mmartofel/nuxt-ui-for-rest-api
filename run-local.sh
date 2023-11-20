
export NUXT_API_URL_PERSON_ALL="http://127.0.0.1:8080/api/person/all"

npm install -loglevel silent
npm run build
npm prune

node .output/server/index.mjs


