<template>
    <UCard class="mt-10">
        <div class="justify">
            <span v-if="error"> Can't read data ... data table could not be displayed! {{ error }}</span>
            <span v-else>
                <UTable :rows="people" /> 
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

    // read NUXT_API_URL_PERSON_ALL from actual env
    var url = process.env.NUXT_API_URL_PERSON_ALL as string
       if (url === '') {
           url = 'unedfined API'
       }
    const { data: people, pending, error } = await useFetch('http://127.0.0.1:8080/api/person/all')

</script>
