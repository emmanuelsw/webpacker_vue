<template>
  <div class="layout">
    <Layout>
      <Header></Header>
      <div class="container main-content">
        <Content>
          <Card>
            <div>
              Content
            </div>
          </Card>
        </Content>
      </div>
    </Layout>
  </div>
</template>

<script>
import Header from './views/header.vue'

export default {
  components: { Header },
  data: function () {
    return {
      message: ""
    }
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