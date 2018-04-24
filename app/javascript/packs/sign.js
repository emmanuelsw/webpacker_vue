import Vue from 'vue/dist/vue.esm'
import App from '../signs/app.vue'
import router  from '../signs/router.js'
import iView from 'iview'
import 'iview/dist/styles/iview.css'
import locale from 'iview/dist/locale/en-US'
import '../signs/app.css'

Vue.use(iView, {locale})

export const eventBus = new Vue();

document.addEventListener('DOMContentLoaded', () => {
  document.body.appendChild(document.createElement('app'))
  const app = new Vue({
    el: 'app',
    template: '<App/>',
    components: { App },
    router
  })
})