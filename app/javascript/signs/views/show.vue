<template>
	<Row>
		<Col span="24">
			{{sign.name}}
		</Col>
	</Row>
</template>

<script>
import { eventBus } from '../../packs/sign.js'
import { get } from '../helpers/api'

export default {
	created() {
		eventBus.$emit('changeTitle', 'Show Signing')
		this.fetchSign()
	},
	data() {	
		return {
			sign: {}
		}
	},
	methods: {
		fetchSign() {
			get(`/api/signs/${this.$route.params.id}`)
			.then((res) => {
				this.sign = res.data
			})
			.catch((err) => {
				this.$Message.error('Error fetching signing');
				console.log(err.response)
			})
		}
	}
}
</script>

<style scoped>

</style>