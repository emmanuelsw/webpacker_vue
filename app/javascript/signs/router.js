import Vue from 'vue/dist/vue.esm'
import VueRouter from 'vue-router'

import Form from './views/form.vue'
import Signs from './views/signs.vue'

Vue.use(VueRouter)

const routes = [
  { path: '/', component: Form },
  { path: '/signs', component: Signs }
]

const router = new VueRouter({
	mode: 'history',
	routes
})

export default router