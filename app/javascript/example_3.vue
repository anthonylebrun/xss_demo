<template>
  <div class="space-y-6">
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
