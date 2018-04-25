<template>
	<div>
		<Row>
			<Col span="24">
				<Table border :loading="loading" :columns="columns" :data="signs"></Table>
			</Col>
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
		eventBus.$emit('changeTitle', 'Signing List')
		this.fetchSigns()
		setTimeout(() => { this.loading = false }, 500)
	},
	methods: {
		fetchSigns() {
			get('/api/signs')
			.then((res) => {
				this.signs = res.data
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
