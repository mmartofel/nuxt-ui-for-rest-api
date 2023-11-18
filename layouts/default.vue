<template>
    <UContainer>
      <UCard class="mt-10">
        <template #header>
            <div class="flex justify-between">
                <h1>Here we will be testing REST API integration with Nuxt 3 and Nuxt UI</h1>

                <!-- Color scheme change button-->
                <ClientOnly>
                    <UButton :icon="isDark ? 'i-heroicons-moon-20-solid' : 'i-heroicons-sun-20-solid'"
                                            color="gray"
                                            variant="ghost"
                                            aria-label="Theme"
                                            @click="isDark = !isDark"
                    />
                    <template #fallback>
                        <div class="w-8 h-8" />
                    </template>
                </ClientOnly>
                <!-- end -->
                
            </div>
        </template>
            <UButton icon="i-heroicons-book-open" to="https://ui.nuxt.com" target="_blank">Open Nuxt UI Documentation</UButton>
      </UCard>
        <!-- Here page content will be injected -->
        <slot />
        <!-- end -->
    </UContainer>
</template>

<script setup>
    const colorMode = useColorMode()
    const isDark = computed({
    get () {
            return colorMode.value === 'dark'
    },
    set () {
        colorMode.preference = colorMode.value === 'dark' ? 'light' : 'dark'
    }
})
</script>
