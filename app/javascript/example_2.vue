<template>
  <div class="space-y-6">
    <h1 class="text-3xl">2. XSS vue template</h1>
    <div id="profile-form" class="space-y-6">
      <div>
        <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
        <div class="mt-1">
          <input v-model="name" id="email" type="text" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md" placeholder="Jane Doe">
        </div>
      </div>
      <div>
        <label for="business" class="block text-sm font-medium text-gray-700">Business</label>
        <div class="mt-1">
          <input v-model="business" id="business" type="text" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md" placeholder="Widget Co">
        </div>
      </div>
      <div>
        <label for="website" class="block text-sm font-medium text-gray-700">Website</label>
        <div class="mt-1">
          <input v-model="website" id="website" type="text" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md" placeholder="http://example.com">
        </div>
      </div>
      <button @click="showProfile = true" type="button" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
        Submit Application
      </button>
    </div>
    <div id="profile" v-if="showProfile">
      <div class="bg-white shadow overflow-hidden sm:rounded-lg">
        <div class="px-4 py-5 sm:px-6">
          <h3 class="text-lg leading-6 font-medium text-gray-900">
            Loan Applicant Information
          </h3>
          <p class="mt-1 max-w-2xl text-sm text-gray-500">
            Personal details and application.
          </p>
        </div>
        <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
          <dl class="sm:divide-y sm:divide-gray-200">
            <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
              <dt class="text-sm font-medium text-gray-500">
                Full name
              </dt>
              <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                {{name}}
              </dd>
            </div>
            <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
              <dt class="text-sm font-medium text-gray-500">
                Website
              </dt>
              <dd class="mt-1 text-sm text-indigo-600 sm:mt-0 sm:col-span-2">
                <a :href="website">{{business}}</a>
              </dd>
            </div>
          </dl>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      name: '',
      business: '',
      website: '',
      showProfile: false,
    }
  },
}
</script>
