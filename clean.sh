oc delete imagestreamtag.image.openshift.io nuxt-ui-for-rest-api:latest
oc delete buildconfig nuxt-ui-for-rest-api
oc delete deployment nuxt-ui-for-rest-api
oc delete service nuxt-ui-for-rest-api

git add .
git commit -m "update Dockerfile #8"
git push origin main

oc new-app https://github.com/mmartofel/nuxt-ui-for-rest-api

