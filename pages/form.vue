<script setup lang="ts">
import type { FormError } from '@nuxt/ui/dist/runtime/types'
import type { FormSubmitEvent } from '@nuxt/ui/dist/runtime/types'

const state = reactive({
  email: undefined,
  password: undefined
})

const validate = (state: any): FormError[] => {
  const errors = []
  if (!state.email) {
    errors.push({ path: 'email', message: 'Required' })
    console.log('email can not be null')
  }
  if (!state.password) {
    errors.push({ path: 'password', message: 'Required' })
    console.log('password can not be null')
  }
    return errors
}

async function onSubmit (event: FormSubmitEvent<any>) {
  // Do something with data
  console.log('Button submitted')
  console.log('Event after button click: ' + event.data)
  state.email = '' as any;
  state.password = '' as any;
}
</script>

<template>
  <UForm :validate="validate" :state="state" class="space-y-4" @submit="onSubmit">
    <UFormGroup label="Email" name="email">
      <UInput v-model="state.email" />
    </UFormGroup>

    <UFormGroup label="Password" name="password">
      <UInput v-model="state.password" type="password" />
    </UFormGroup>

    <UButton type="submit">
      Submit
    </UButton>
  </UForm>
</template>

