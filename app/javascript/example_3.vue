<template>
  <div class="space-y-6">
    <div class="space-y-6">
      <div class="bg-yellow-50 border-l-4 border-yellow-400 p-4">
        <div class="flex">
          <div class="flex-shrink-0">
            <!-- Heroicon name: exclamation -->
            <svg class="h-5 w-5 text-yellow-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
              <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd" />
            </svg>
          </div>
          <div class="ml-3">
            <p class="text-sm text-yellow-700">
              This page does not sanitize comments before injecting them in the page via <code>v-html</code>.
            </p>
          </div>
        </div>
      </div>
    </div>

    <h1 class="text-3xl">3. XSS vue template</h1>
    <p>Post a comment</p>
    <div>
      <div class="mt-1 flex rounded-md shadow-sm">
        <div class="relative flex items-stretch flex-grow focus-within:z-10">
          <input type="text" v-model="comment" name="comment" class="focus:ring-indigo-500 focus:border-indigo-500 block w-full rounded-none rounded-l-md sm:text-sm border-gray-300" placeholder="Your message...">
        </div>
        <button @click="submit" class="-ml-px relative inline-flex items-center space-x-2 px-4 py-2 border border-gray-300 text-sm font-medium rounded-r-md text-gray-700 bg-gray-50 hover:bg-gray-100 focus:outline-none focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500">Post</button>
      </div>
    </div>
    <p v-if="displayedComment" v-html="displayedComment">
    </p>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      comment: '',
      displayedComment: '',
    }
  },
  methods: {
    submit() {
      const { comment } = this

      fetch('/example_3', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ comment })
      })
      .then(response => response.json())
      .then(data => {
        this.displayedComment = data.comment
      });
    }
  },
}
</script>
