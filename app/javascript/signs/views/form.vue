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
						<DatePicker type="date"  v-model="form.birthdate">
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

					<Button type="success" :loading="loading" @click="">
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

export default {
	data() {
		return {
			loading: false,
			form: {}
		}
	},
	created() {
		eventBus.$emit('changeTitle', 'Signing Form')
	}
}
</script>

