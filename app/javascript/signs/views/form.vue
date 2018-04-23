<template>
	<div>

		<Form :model="form" label-position="top">
			<Row :gutter="16">
				<Col span="12">
					<FormItem label="Name" prop="name">
						<Input v-model="form.name">
							<Icon type="person" slot="prepend"></Icon>
						</Input>
					</FormItem>
					<FormItem label="Birthdate" prop="birthdate">
						<DatePicker type="date" @on-change="setDate" v-model="form.birthdate">
						</DatePicker>
					</FormItem>
				</Col>
				<Col span="12">
					<FormItem label="Email" prop="email">
						<Input v-model="form.email">
							<Icon type="email" slot="prepend"></Icon>
						</Input>
					</FormItem>
					<FormItem label="Phone" prop="phone">
						<Input v-model="form.phone">
							<Icon type="ios-telephone" slot="prepend"></Icon>
						</Input>
					</FormItem>
				</Col>
				<Col span="24">
					<FormItem label="Signature" prop="sign">
						<Input v-model="form.sign" type="textarea" :autosize="{minRows: 7,maxRows: 7}"></Input>
					</FormItem>
					<Button type="success" :loading="loading" @click="save">
						<span v-if="!loading">
							Submit Form
							<Icon type="android-send"></Icon>
						</span>
						<span v-else>Loading...</span>
					</Button>
				</Col>
			</Row>
		</Form>

	</div>
</template>

<script>
import { eventBus } from '../../packs/sign.js'
import { post } from '../helpers/api'

export default {
	data() {
		return {
			loading: false,
			form: {}
		}
	},
	created() {
		eventBus.$emit('changeTitle', 'Signing Form')
	},
	methods: {
		setDate() {
			var date = new Date(this.form.birthdate)
			date.setDate(date.getDate() + 1)
			this.form.birthdate = date
		},
		save() {
			post('/signs', this.form)
			.then((res) => {
				this.$Notice.success({title: 'Sign Form', desc: 'Sign created successfully.', duration: 4})
				this.form = {}
			})
			.catch((err) => {
				var message = ''
				for(let i of err.response.data) {
					message += `<li>${i}</li>`
				}
				this.$Notice.error({
					title: 'Error saving signing',
					desc: message
				});
			})
		}
	}
}
</script>

