<template>
	<Row>
		<Col span="12">
			<Col span="12">
				<div class="info-group">
					<Avatar shape="square" icon="person" size="large" /> 
					<div class="info-text">
						<p>Name</p>
						{{sign.name}}
					</div>
				</div>

				<div class="info-group">
					<Avatar shape="square" icon="android-mail" size="large" />
					<div class="info-text">
						<p>Email</p>
						{{sign.email}}
					</div>
				</div>
				<div class="info-group">
					<Avatar shape="square" icon="android-time" size="large" />
					<div class="info-text">
						<p>Created At</p>
						{{sign.created_at}}
					</div>
				</div>
			</Col>
			<Col span="12">
				<div class="info-group">
					<Avatar shape="square" icon="android-call" size="large" />
					<div class="info-text">
						<p>Phone</p>
						{{sign.phone}}
					</div>
				</div>
				<div class="info-group">
					<Avatar shape="square" icon="calendar" size="large" />
					<div class="info-text">
						<p>Birthdate</p>
						{{sign.birthdate}}
					</div>
				</div>
				<div class="info-group">
					<Avatar shape="square" icon="android-time" size="large" />
					<div class="info-text">
						<p>Last Update</p>
						{{sign.updated_at}}
					</div>
				</div>
			</Col>
		</Col>
		<Col span="12">
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
				this.sign = res.data.sign
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