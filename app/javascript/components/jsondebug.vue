<template>
  <div id="jsondebug">
    <p><button class="btn btn-sm btn-outline-primary" v-on:click="jsonDebug = !jsonDebug">Toggle JSON</button></p>
    <div v-if="jsonDebug">
      <pre style="font-size: 9px">{{ tableData | pretty }}</pre>
    </div>
  </div>
</template>

<script>
  export default {
    props: ['tableData'],
    filters: {
      pretty: function(value) {
        return JSON.stringify(value, null, 2);
      }
    },
    data() {
      return {
        jsonDebug: false
      }
    }
  }
</script>

<style>
</style>