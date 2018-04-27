<template>
  <div class="layout">
    <Layout>
      <Header></Header>
      <div class="container main-content">
        <Content>
          <Card class="main-card">
            <p slot="title">{{title}}</p>
            <div>
              <router-view></router-view>
            </div>
          </Card>
        </Content>
      </div>
    </Layout>
  </div>
</template>

<script>
import Header from './views/layout/header.vue'
import { eventBus } from '../packs/sign.js'

export default {
  components: { Header },
  data() {
    return {
      title: ''
    }
  },
  created() {
    eventBus.$on('changeTitle', (title) => {
      this.title = title
    })
  }
}
</script>

<style scoped>
.layout{
  position: relative;
  overflow: hidden;
}
.main-content {
  margin-top: 25px;
}
</style>