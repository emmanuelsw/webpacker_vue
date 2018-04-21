import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import App from '../signs/app.vue'
import router  from '../signs/router.js'
import iView from 'iview'
import 'iview/dist/styles/iview.css'

Vue.use(TurbolinksAdapter)
Vue.use(iView)

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '#root',
    components: { App },
    router
  })
})