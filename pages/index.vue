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
    </UCard>
</template>

<script setup lang="ts">
    const url = "http://127.0.0.1:8080/api/person/all"
    const { data: people, pending, error } = await useFetch(url)
</script>
