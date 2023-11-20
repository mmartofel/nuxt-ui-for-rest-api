// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: false },
  modules: ['@nuxt/ui'],
  ssr: true,
  // routeRules: {
    // Homepage pre-rendered at build time
    //'/': { prerender: false, swr: false },
    //'/table': { prerender: false, swr: false },
    //'/api': { swr: false }
  //}
  runtimeConfig: {
    public: {
      API_URL_PERSON_ALL: process.env.NUXT_API_URL_PERSON_ALL,
    }
  }
})
