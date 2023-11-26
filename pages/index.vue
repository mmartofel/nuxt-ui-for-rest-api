<template>
    <UCard class="mt-10">
        <div class="justify">
            <span v-if="error"> Can't read data ... data table could not be displayed! {{ error }}</span>
            <span v-else>
                <UTable :rows="people" /> 
                    <div class="flex justify-end px-3 py-3.5 border-t border-gray-200 dark:border-gray-700">
                        <UPagination v-model="page" :page-count="5" :total="people.length" />
                    </div>
            </span>
        </div>
    </UCard>
    <UCard class="mt-10">
        <div>
            <span v-if="error"> Data API perhaps failed my friend ...</span>
            <span v-else>Data has being loaded.</span>
            <span v-if="pending">Loading...</span>
        </div>
        <div> API URL is set to: {{ url }}</div>
    </UCard>
</template>

<script setup lang="ts">

// read API_URL_PERSON_ALL from runtime configuration set at nuxt.config.ts
const runtimeConfig = useRuntimeConfig();
var url = runtimeConfig.public.API_URL_PERSON_ALL

console.log('API URL set to:')
console.log(url)

// check if NUXT_API_URL_PERSON_ALL is set at your env
if (url === ''){
    url = 'undefined API URL, can not find NUXT_API_URL_PERSON_ALL env variable'
}
const { data: people, pending, error } = await useFetch(url)

const page = ref(1)
const pageCount = 5
const rows = computed(() => {
  return people.slice((page.value - 1) * pageCount, (page.value) * pageCount)
})


</script>
