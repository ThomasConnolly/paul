/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %>
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'
import VueResource from 'vue-resource'

Vue.use(VueResource)

document.addEventListener('turbolinks:load', () => {
  Vue.http.headers.common['X-CRS-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  
  var element = document.getElementById("hello")
  if (element != null) {
   
   const app = new Vue({
    el: element,
    mixins: [TurbolinksAdapter]
  })
 }
})