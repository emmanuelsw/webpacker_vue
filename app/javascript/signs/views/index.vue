<template>
  <div>
    <Row>
      <Col span="24">
        <Table border :columns="columns" :data="signs"></Table>
      </Col>
      <Spin size="large" fix v-if="loading"></Spin>
    </Row>
  </div>
</template>

<script>
import { eventBus } from '../../packs/sign.js'
import { get, del } from '../helpers/api'

export default {
  data() {
    return {
      loading: true,
      signs: [],
      columns: [
        {
          title: 'Name',
          key: 'name'
        },
        {
          title: 'Email',
          key: 'email'
        },
        {
          title: 'Phone',
          key: 'phone'
        },
        {
          title: 'Birthdate',
          key: 'birthdate'
        },
        {
          title: 'Actions',
          key: 'actions',
          width: 150,
          align: 'center',
          render: (h, params) => {
            return h('div', [
              h('Button', {
                props: {
                  type: 'primary',
                  size: 'small'
                },
                on: {
                  click: () => {
                    this.$router.push(`/signs/${params.row.id}`)
                  }
                }
              }, 'Show'),
              h('Button', {
                props: {
                  type: 'error',
                  size: 'small'
                },
                on: {
                  click: () => {
                    this.remove(params.index)
                  }
                }
              }, 'Delete')
            ]);
          }
        }
      ]
    }
  },
  created() {
    this.fetchSigns()
    eventBus.$emit('changeTitle', 'Signing List')
  },
  methods: {
    fetchSigns() {
      get('/api/signs')
      .then((res) => {
        this.signs = res.data
        setTimeout(() => { this.loading = false }, 300)
      })
      .catch((err) => {
        this.$Message.error('Error fetching signings');
      })
    },
    remove(index) {
      del(`/api/signs/${this.signs[index].id}`)
      .then((res) => {
        this.signs.splice(index, 1)
        this.$Message.success('Signing deleted succesfully.');
      })
      .catch((err) => {
        this.$Message.error('Error deleting signing');
      })
    }
  }
}
</script>
