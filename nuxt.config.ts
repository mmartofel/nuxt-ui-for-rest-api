// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  modules: ["@nuxt/ui"],

  runtimeConfig: {
    public: {
      NUXT_API_URL_PERSON_ALL: process.env.NUXT_API_URL_PERSON_ALL,
    },
  },

})