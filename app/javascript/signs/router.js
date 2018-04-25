import Vue from 'vue/dist/vue.esm'
import VueRouter from 'vue-router'

import Index from './views/index.vue'
import Form from './views/form.vue'
import Show from './views/show.vue'

Vue.use(VueRouter)

const routes = [
  { path: '/', component: Index },
	{ path: '/form', component: Form },
	{ path: '/signs/:id', component: Show }
]

const router = new VueRouter({
	mode: 'history',
	routes
})

export default router