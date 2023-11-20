// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: false },
  modules: ["@nuxt/ui"],
  ssr: true,
  routeRules: {
    // Homepage pre-rendered at build time
    '/': { prerender: false, swr: false },
    '/table': { prerender: false, swr: false },
    '/api': { swr: false },
    // Product page generated on-demand, revalidates in background
    '/products/**': { swr: 3600 },
    // Blog post generated on-demand once until next deploy
    '/blog/**': { isr: true },
    // Admin dashboard renders only on client-side
    '/admin/**': { ssr: false },
    // Add cors headers on API routes
    '/api/**': { cors: true },
    // Redirects legacy urls
    '/old-page': { redirect: '/new-page' }
  }
})