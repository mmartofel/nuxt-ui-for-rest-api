<template>
    <UCard class="mt-10">
        <div class="justify">
            <span v-if="error"> Can't read data ... data table could not be displayed! {{ error }}</span>
            <span v-else>
                <UTable :rows="rows" /> 
                    <div class="flex justify-end px-3 py-3.5 border-t border-gray-200 dark:border-gray-700">                        
                        <UPagination v-model="page" :page-count="numberOfRecordsPerPage" :total="recordsCount" />
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
        <div> Number of rows returned: {{ recordsCount }}</div>
    </UCard>
</template>

<script setup lang="ts">

// read API_URL_PERSON_ALL from runtime configuration set at nuxt.config.ts
const runtimeConfig = useRuntimeConfig();
var url = runtimeConfig.public.API_URL_PERSON_ALL

// log API URL at the console
console.log('API URL set to: ' + url)

// check if NUXT_API_URL_PERSON_ALL is set at your env
if (url === ''){
    url = 'undefined API URL, can not find NUXT_API_URL_PERSON_ALL env variable'
}

// fetch API data
const { data: people, error, pending } = await useFetch(url)

// return count of records
const recordsCount = (people.value as any[]).length

// set reference and number of records per table page
const page = ref(1)
const numberOfRecordsPerPage = 5

// fetch slice of data for actual table page
const rows = computed(() => {
  return (people.value as any[]).slice((page.value - 1) * numberOfRecordsPerPage, (page.value) * numberOfRecordsPerPage)
});

</script>
